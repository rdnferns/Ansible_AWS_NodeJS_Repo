# Ansible_AWS_NodeJS_Repo
It is a repository that has two exercises about deploying NodeJS on an amazon ec2 instance using ansible-playbook, ansible is a tool primarily used for configuring a enviroment on cloud infrastructures services like AWS, GCP, Azure, etc. It is quite a useful tool in the tech field mainly among DevOps professionals.

<br><br><br>

# 1) Prerequisites:
- Linux OS (distro or VM, will need bash for the other tools)
- GitHub account.
- AWS management console account.
- AWS CLI installed in your system.
- An AWS access key & secret key to build & configure infrastructure via code in CLI.
- A private SHA Key pair for ssh access to instances.
- Ansible installed in your linux ecosystem for configuring cloud infrastructure.
- Terraform installed for building AWS Cloud infrastructure.

<br><br><br>

# 2) Assignment-1: Deploying NodeJS app using Ansible.
=> In this assignment, we basically execute an ansible-playbook that will prrimarily:
1) Install Git & clone a public node.js repo.
2) Install NodeJS & PM2 into your ec2 instance.
3) Run your NodeJS application in your ec2 system.

<br>

<h3>Step-1: Take everything from Ansi-Assign-1 directory & place it in a single directory locally</h3>
> you can do so in multiple ways, either by forking, using git clone or even manually extract the files if you are not using git in your local system.

<br><br>

<h3>Step-2: Set up the desired configuration in the respective files</h3>
> The primary file will be the terraform.tfvars file in the Terraform Operations directory which will have the list of variables of the data one might desire to change, you can also make any desired changes to the amazo-ec2, provider & variable .tf files.

<br><br>

<h3>Step-3: Execute the required Terraform commands to build the desired AWS infrastructure</h3>
> Execute the following set of commands into you local linux system.

```bash
# Execute all these commands while in the Terrafor-opr-1 directory, once done get back to Ansi-Assign-1 directory
#
#
terraform init
terraform validate
terraform plan
terraform apply -var my_ip=$(curl ifconfig.me ; echo "/32")  # You can exclude -var if you hardcoded your ip in .tfvars file.
```
<br>

<h3>Step-4: Now in your AWS management console carry out the following actions</h3>
> Click on the checkbox on the newly created instance & then next click on the connect option, once you enter the new tab, select the ssh tab, you should find this entire line at the bottom, copy it as it will be handy for the next task.

```bash
ssh -i "YourPemKey.pem" ubuntu@ec2-##-###-##-###.ap-south-1.compute.amazonaws.com
```
<br>

<h3>Step-5: Now copy that line from the console, & carry out the following</h3>
> Once you get the whole command, either change to a directory where your sha .pem key is located or bring your .pem key to your directory & execute this modified command. To confirm it work, try entering your ec2 instance just using the host-id & DNS 

```bash
# Execute this. 
ssh-copy-id -f "-o IdentityFile YourPemKey.pem" ubuntu@ec2-##-###-##-###.ap-south-1.compute.amazonaws.com

# Once successful, try executing: ssh ubuntu@ec2-##-###-##-###.ap-south-1.compute.amazonaws.com
```
<br>

<h3>Step-6: Go to inventory.ini & add configure the file to run the ansible-playbook</h3>
> inventory.ini

```bash
[webservers]
ubuntu@ec2-##-###-##-###.ap-south-1.compute.amazonaws.com
```
<br>

<h3>Step-7: Finally, execute the ansible-playbook command to configure the instance to run the NodeJS App</h3>

```bash
# Execute
ansible-playbook -i inventory.ini playbook.yml
```
<br>

<h3>Step-8: Observation: </h3>
> In Order to observe if Ansible successfully configured your ec2 instance, log into your instance terminal & execute the following commands to verify that you instance has been configured & app is running.
<br>
In your ec2 instance terminal

```bash
git --version

sudo ls /app

sudo bash -c 'source /root/.nvm/nvm.sh && pm2 list'

curl localhost:3000

# Note: You can use any other commands that helps your cause, in-case you have strong expertise in these stacks ;).

# Note2: If you don't want this project to continue, you can perform 'terraform destroy' command in your local machine to end everything.
```
<br><br><br>

# 3) Assignment-2: Running Terraform + Ansible together.
=> This Assignment achieves the same end as the first one, i.e. deploying & running a NodeJS app on an ec2 instance. But what changes this time is that this time Ansible will carry out its configuration task alongside Terraform building the infrastructure, allowing for both tools to carry out the process of building & configuring infrastructure in one fell swoop.

<br>

<b> Remember: Terraform builds the external cloud infrastructure, while Ansible configures the environment within the built infrastructure. </b>

<br><br>

<h3>Step-1: Take everything from Ansi-Assign-2 directory & place it in a single directory locally </h3>
> The same step as previous exercise, this one should be much shorter

<br><br>


<h3>Step-2: Set up the desired configuration in the respective files</h3>
> Again, ensure that your .tfvars & all the .tf files have been successfully configired, but I also heavily recommend to read & observe all the files & the playbook.yml file too, for understanding the changes made compared to the first exercise

<br><br>

<h3>Step-3: Execute the required Terraform commands to build the desired AWS infrastructure</h3>
> Execute the following set of commands into you local linux system.

```bash
terraform init
terraform validate
terraform plan
terraform apply -var my_ip=$(curl ifconfig.me ; echo "/32")  # again, exclude -var if you hardcoded your ip in .tfvars file.
```
<br><br>

<h3>Step-4: Observe the terminal  </h3>
> This is a request, kindly keep an eye on the terminal as ansible-playbooks starts to play as Terraform finishes building the ec2 instance.

<br><br>

<h3>Step-5: Exercise-2: Observation</h3>
> Follow the [step-8] of previous exercise & observe the changes created.

<br><br><br>

# <div align="center">---XXXXX [THE END] XXXXX---</div>
