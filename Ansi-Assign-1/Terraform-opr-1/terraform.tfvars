# Important private data (be mindful & protect this data)
my_ip          = ""                 # recommend to keep it empty, it can be declared when running terraform apply
private_key_id = "YourPemKey_name"


# ec2 instance config for 1st instance
ec2_inst_type = "your_instance_type"
ec2_tag_name  = "your_instance_tag_name"


# ec2 instance config for 2nd instance
# ec2_inst_type_2 = "your_instance_type_2"
# ec2_tag_name_2 = "your_instance_tag_name_2"


# ec2 ami config variables for 1st instance
owner_id = "099720109477"           # Canonical
ami_val  = "ubuntu/images/hvm-ssd-gp3/ubuntu-resolute-26.04-amd64-server-*"


# ec2 ami config variables for 2nd instance
# owner_id_2 = "309956199498"       # Red Hat Enterprise Linux
# ami_val_2 = "RHEL-10.2.0_HVM-*-x86_64-0-Hourly2-GP3"


# config variables for a security group
src_grp_name = "src_grp_ssh"
port_id      = 3000


