# evt-challenge

## Usage: 
- Run command ```ansible-playbook -e profile=YOUR_AWS_PROFILE_CREDENTIALS deploy_evt_website.yml -K```
in terminal. 
    - This command takes the variable 'profile' as an argument. Store your AWS credentials in the ~/.aws/credentials file and pass the associated profile as the parameter, in place of YOUR_AWS_PROFILE_CREDENTIALS.
    - You will be prompted for your machine password; this is so the script can allow your machine to trust the generated self-signed certificate and map the generated IP to the domain name.
        - Trusting functionality only works for Mac OS at the moment.
        - Domain mapping should work on Mac, Windows, Debian-based distributions, and RedHat-based distributions.
        - If you do not want to provide your machine password, run the command ```ansible-playbook --skip-tags local-trust -e profile=YOUR_AWS_PROFILE_CREDENTIALS deploy_evt_website.yml``` instead. Doing so may render the connection insecure and will disable IP-domain mapping.

## How it works:
- Hosts the given html website on an AWS EC2 instance on an Ubuntu Linux platform, with an NGINX webserver configurated with Ansible.

- deploy_evt_website.yml: Main deployment driver.
- cert_tasks.yml: Generates private key, CSR, and self-signed SSL certificate.
- ec2_launch_tasks.yml: Builds the EC2 instance.
- configure_nginx_tasks.yml: Configures NGINX within the EC2 instance and deploys given HTML content.
- local_trust_tasks.yml: Trusts the generated certificate.
- test_tasks.yml: Tests the connection.
- site.conf.j2: Template for NGINX server block.
- install_packages.sh: Installs packages needed for the webserver onto the EC2 instance.

## Reasoning:
- I chose to host on EC2 because it's easily scalable if we want to add more to the web page, secure, and flexible as far as the services you can choose to use. I also wanted to showcase a bit of what I've learned in AWS as well as take the opportunity to learn new things in this medium.
- I chose NGINX as the webserver because it is high-performance, secure, and widely-used.
- I chose Linux as the OS because it is secure, widely-used, and free.
- I chose Ansible as the config management tool because it can be used for provisioning AWS as well as configuring NGINX/has a wide array of modules available.
