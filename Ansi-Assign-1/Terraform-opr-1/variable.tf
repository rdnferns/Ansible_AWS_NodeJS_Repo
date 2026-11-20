variable "private_key_id" {
  description = "This variable will declare the private sha key that will be used to access amazon ec2"
  type        = string
}

variable "my_ip" {
  description = "Personal IP Address allowed to access the ec2 instance"
  type        = string
}


variable "ec2_inst_type" {
  description = "The type of instance that will be used when you are building your ec2 cloud machine"
  type        = string
}

variable "ec2_tag_name" {
  description = "Tags a name for the ec2 instance"
  type        = string
}

/*
variable "ec2_inst_type_2" {
  description  = "The type of instance that will be used when you are building your 2nd ec2 cloud machine"
  type         = string
}

variable "ec2_tag_name_2" {
  description  = "Tags a name for the 2nd ec2 instance"
  type         = string
}
*/

variable "src_grp_name" {
  description = "declares a name for the security group"
  type        = string
}

variable "port_id" {
  description = "declares a port that you will use to connect to the server"
  type        = number
}

variable "owner_id" {
  description = "provides the owner id of the AMI that will be used in the ec2 instance"
  type        = string
}

variable "ami_val" {
  description = "Adds the required ami image address towards building a ec2 instance"
  type        = string
}

/*
variable "owner_id_2" {
  description  = "provides the owner id of the 2nd AMI that will be used in the 2nd ec2 instance"
  type         = string
}

variable "ami_val_2" {
  description  = "Adds the required ami image address towards building a 2nd ec2 instance"
  type         = string
}
*/


