In this README I will walk you through how to run an NGINX server on an AWS EC2 instance, and map it to a Cloudflare domain.


 # 1. Buy a domain on Cloudflare
 
You start by choosing a domain registrar to search for the site you want. I recommend picking a cheap domain(if its personal), even if it has an unusual extension. For my project, I chose mahamedismail.uk.
<img src="https://github.com/MahamedIsmail/Devops-Progression/blob/main/Networking/Images/Cloadflare_dashboard?raw.png=true" width="800" alt="key_creation.png">

# 2. Launch an AWS EC2 Instance

Navigate to the AWS Management Console, search for EC2 and begin the "Launch Instance" process.
The first step is selecting an AMI (Amazon Machine Image). An AMI is a pre-configured template that provides the software configuration (operating system, application server and applications) required for your instance. For this setup, I chose Amazon Linux.


<img src="https://github.com/MahamedIsmail/Devops-Progression/blob/main/Networking/Images/EC2_Instace_creation.png?raw=true" width="800" alt="EC2_Instace_creation">


## 2.1 Next you select the Instance Type

For this project, I chose the t3.micro. It is part of the AWS Free Tier, making it ideal for testing and hosting a lightweight NGINX server.

## 2.2 Creating a Key pair (for logging using ssh)

Before launching the instance, you must create a Key Pair (or select an existing one). This ensures secure access to your server.

- Type: Select RSA for encryption.

- Format: Choose the .pem file format.

- Security: Once downloaded, move the key to your .ssh directory and set the correct permissions. This prevents SSH from rejecting the key due to it being "too public."


<img src="https://github.com/MahamedIsmail/Devops-Progression/blob/main/Networking/Images/key_creation.png?raw=true" width="800" alt="key_creation.png">

### Run these commands
**Move the key to .ssh folder**
```
mv ~/Downloads/<my-key.pem> ~/.ssh/
```
**Set the correct permissions for your private key**
```
 chmod 400 <my-key.pem>
```


### 2.3 Firewall Configuration (Security Groups)
By default AWS implements a "deny-all" policy for inbound traffic to ensure instance security. To allow communication with my network I configured the following Inbound Rules

- SSH (Port 22): Enabled from 0.0.0.0/0 (Anywhere) to ensure seamless remote access for management and configuration.

- HTTP (Port 80): Enabled to allow standard web traffic, which is essential for serving the NGINX web content in this project.
  
<img src="https://github.com/MahamedIsmail/Devops-Progression/blob/main/Networking/Images/firewall.png?raw=true" width="800" alt="firewall.png">


# 3 Copy Your Instance IP

To proceed, navigate to your running instance in the AWS Console and locate the Public IPv4 address or the Public IPv4 DNS either of these will work to identify your server. You will also need your default EC2 user name, which is typically `ec2-user` for Amazon Linux or `ubuntu` for Ubuntu-based instances. Once you have copied both your IP address and the user name, you can use them to run the SSH command in your terminal as shown below.

<img src="https://github.com/MahamedIsmail/Devops-Progression/blob/main/Networking/Images/ip_of_instance.png?raw=true" width="800" alt="ip_of_instance.png">  

### Run this command
```
ssh -i "<my-key.pem>" ec2-user@<your-public-ip>
```


# 4. Install NGINX 

Use the follwing commands if you use **Amazon Linux AMI**.


```
sudo yum install -y nginx

```

```
sudo systemctl enable nginx

```

```
sudo systemctl start nginx

```

# 5. Create an A Record for Your Domain

Now that your instance is running, you need to point your domain to it. Return to the domain management dashboard you accessed in Step 1 and follow these instructions to create an A Record


- Set the Value(A Record): Enter your EC2 instance's Public IP address (ensure you do not use the Private IP). This allows the DNS zone file to direct traffic to your specific server.

- Enable Proxy: I recommend enabling the Proxy toggle (the orange cloud icon in Cloudflare). This acts as a "middleman," hiding your origin IP address from the public. This adds a layer of security by acting as a firewall, ensuring queries reach the proxy first rather than your server directly.

# 6. Confirm propagation in the terminal
Use this command. 
```
nslookup <your_domain_name>
```

# 7. Search your domain name in your browser and you should see your work live !

![giphy(https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExdHNkejZwc3VkMHZ3dGY0Z3FvaGx5NDR0NnpzMnBkYzFpMTk0NDhiZCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/btqH7TbLi8xS3qUgNY/giphy.gif)](https://media4.giphy.com/media/v1.Y2lkPTc5MGI3NjExdHNkejZwc3VkMHZ3dGY0Z3FvaGx5NDR0NnpzMnBkYzFpMTk0NDhiZCZlcD12MV9pbnRlcm5hbF9naWZfYnlfaWQmY3Q9Zw/btqH7TbLi8xS3qUgNY/giphy.gif)


# 8. Optional: Customizing Your Site
You can customize your website by editing the Nginx HTML file directly through your terminal. I chose to do this because the default landing page is quite basic and its more fun with your own site 



<img src="https://github.com/MahamedIsmail/Devops-Progression/blob/main/Networking/Images/My_domain.png?raw=true" width="800" alt="Cloudflare domain dashboard showing mahamedismail.uk">






