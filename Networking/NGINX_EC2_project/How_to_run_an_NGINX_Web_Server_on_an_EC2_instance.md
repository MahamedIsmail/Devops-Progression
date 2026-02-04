In this README I will walk you through how to run an NGINX server on an AWS EC2 instance, and map it to a Cloudflare domain.


 # 1. Buy a domain on Cloudflare
You start by choosing a domain registrar to search for the site you want. I recommend picking a cheap domain(if its personal), even if it has an unusual extension. For my project, I chose mahamedismail.uk.
<img src="https://github.com/MahamedIsmail/Devops-Progression/blob/main/Networking/Images/My_domain.png?raw=true" width="800" alt="Cloudflare domain dashboard showing mahamedismail.uk">


# 2. Launch an AWS EC2 Instance
Navigate to the AWS Management Console, search for EC2, and begin the "Launch Instance" process.

The first step is selecting an AMI (Amazon Machine Image). An AMI is a pre-configured template that provides the software configuration (operating system, application server, and applications) required for your instance. For this setup, I chose Amazon Linux.

https://github.com/MahamedIsmail/Devops-Progression/blob/main/Networking/Images/EC2_Instace_creation.png

### 2.1 Next you select the Instance Type
For this project, I chose the t3.micro. It is part of the AWS Free Tier, making it ideal for testing and hosting a lightweight NGINX server. I chose this specifically because it balances cost-efficiency with enough performance to handle web traffic without over-provisioning resources."

### 2.2 Key pair for loging (for ssh)

Before launching the instance, you must create a Key Pair (or select an existing one). This ensures secure access to your server.

- Type: Select RSA for encryption.

- Format: Choose the .pem file format.

- Security: Once downloaded, move the key to your .ssh directory and set the correct permissions. This prevents SSH from rejecting the key due to it being "too public."

### Run this command
```
 chmod 400 my-key.pem
```

### 2.3 Firewall Configuration (Security Groups)
By default, AWS implements a "deny-all" policy for inbound traffic to ensure instance security. To allow communication with my network, I configured the following Inbound Rules:

SSH (Port 22): Enabled from 0.0.0.0/0 (Anywhere) to ensure seamless remote access for management and configuration.

HTTP (Port 80): Enabled to allow standard web traffic, which is essential for serving the NGINX web content in this project.
<img src="https://github.com/MahamedIsmail/Devops-Progression/blob/main/Networking/Images/firewall.png?raw=true" width="800" alt="Cloudflare domain dashboard showing mahamedismail.uk">


2.4 Copy your instce ip
go to instace copy you ip from your runing instce and run  the command down below in youer termiunal 
### 2.3 copy your  
```
ssh -i "my-key.pem" ec2-user@your-public-ip
```








