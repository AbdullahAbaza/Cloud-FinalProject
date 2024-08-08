## Update the System:

Connect to the EC2 Linux instance via SSH.
Update the system packages by running the following command:

``` bash
sudo yum update -y
```

## Install Docker:

Run the following commands to install Docker on your EC2 Linux instance:

``` bash
sudo yum install docker
```

sudo usermod -a -G docker ec2-user
id ec2-user
newgrp docker

##Need docker-compose too? Try any one of the following command:
### 1. Get pip3 
sudo yum install python3-pip
 
### 2. Then run any one of the following
sudo pip3 install docker-compose # with root access
 
 
pip3 install --user docker-compose # without root access for security reasons


Enable docker service at AMI boot time:
sudo systemctl enable docker.service
Start the Docker service:
sudo systemctl start docker.service


Finding status
Get the docker service status on your AMI instance, run:
sudo systemctl status docker.service



[ec2-user@ip-192-0-3-67 ~]$ ls -l /lib/systemd/system/docker.socket
-rw-r--r--. 1 root root 295 Jul 24 22:57 /lib/systemd/system/docker.socket
[ec2-user@ip-192-0-3-67 ~]$ groups
ec2-user adm wheel systemd-journal docker
[ec2-user@ip-192-0-3-67 ~]$ sudo chgrp docker /lib/systemd/system/docker.socket
[ec2-user@ip-192-0-3-67 ~]$ sudo chmod g+w /lib/systemd/system/docker.socket
[ec2-user@ip-192-0-3-67 ~]$ sudo usermod -aG docker $USER
[ec2-user@ip-192-0-3-67 ~]$ 

docker network create django-app-net
docker login

# docker run -d -p 80:8000 --network django-app-net abdullahabaza/django_clinic_app:v1 

docker run -d -p 80:8000 --network django-app-net --name django-app-c1 \
  -e DATABASE_URL=postgres://postgres:postgres@database-1-instance-1.ceyv227pdll6.us-east-1.rds.amazonaws.com:5432/django_clinic_app_db abdullahabaza/django_clinic_app:v1

