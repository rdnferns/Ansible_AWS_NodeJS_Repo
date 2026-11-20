resource "aws_security_group" "ssh_access" {
  name = var.src_grp_name

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow my IP to access site"
    from_port   = var.port_id
    to_port     = var.port_id
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]
  }

  egress {
    description = "Allow all connections"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


data "aws_ami" "ubuntu_linux" {
  most_recent = true

  owners = [var.owner_id] # Canonical

  filter {
    name   = "name"
    values = [var.ami_val]
  }
}

/*
data "aws_ami" "rhel_linux" {
  most_recent = true

  owners = [var.owner_id_2] # Red Hat Enterprise Linux

  filter {
    name   = "name"
    values = [var.ami_val_2]
  }
}
 
resource "aws_instance" "rhel-inst" {
  ami           = data.aws_ami.rhel_linux.id
  instance_type = var.ec2_inst_type_2
  key_name      = var.private_key_id
  vpc_security_group_ids = [aws_security_group.ssh_access.id]

  tags = {
    Name = var.ec2_tag_name_2
  }
}
*/

resource "aws_instance" "ubuntu-inst" {
  ami                    = data.aws_ami.ubuntu_linux.id
  instance_type          = var.ec2_inst_type
  key_name               = var.private_key_id
  vpc_security_group_ids = [aws_security_group.ssh_access.id]

  tags = {
    Name = var.ec2_tag_name
  }

  # first we need to ensure that your instance has an ssh connection established to carry out the ansible-playbook operations.
  provisioner "remote-exec" {
    inline = ["echo 'SSH is ready'"]

    connection {
      type        = var.net_prot
      user        = var.conn_usr
      private_key = file(var.private_key_path)
      host        = self.public_ip
    }
  }

  provisioner "local-exec" {
    # Note: the trick with using your ec2's ip as a host is the ',' after ${self.publix_ip}. Observe & study, it will be helpful
    command = "ANSIBLE_HOST_KEY_CHECKING=False ansible-playbook -u ubuntu -i '${self.public_ip},' --private-key ${var.private_key_path} ${var.ansi_playbk}"
  }
}


