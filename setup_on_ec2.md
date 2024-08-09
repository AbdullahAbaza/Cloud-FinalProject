## Connect to your ec2 machine and Update the System

Connect to the EC2 Linux instance via SSH.

### Update the System:

```bash
sudo yum update -y
```

## Install Docker:

`Run the following commands to install Docker on your EC2 Linux instance:`

```bash
sudo yum install -y docker

sudo usermod -aG docker $USER
id ec2-user
newgrp docker
```

### Enable docker service at AMI boot time and Start the Docker service:

```bash
sudo systemctl enable docker.service
sudo systemctl start docker.service
```

### Get the docker service status on your AMI instance, run:

```bash
sudo systemctl status docker.service
```

### If you have any Problem Starting Docker make sure to do the following

```bash
ls -l /lib/systemd/system/docker.socket
sudo chgrp docker /lib/systemd/system/docker.socket
sudo chmod g+w /lib/systemd/system/docker.socket
sudo usermod -aG docker $USER
sudo systemctl restart docker.service
```

### Need docker-compose too? Try any one of the following command:

- `Get pip3`

```bash
sudo yum install python3-pip
```

- `Then run any one of the following`

```bash
sudo pip3 install docker-compose # with root access
```

```bash
pip3 install --user docker-compose # without root access for security reasons
```
## setup a docker network and pull the image from Docker hub to setup it and run
### Create a docker network to connect it to the container later
``` bash
docker network create django-app-net
```
## Run docker container with your correct DATABASE_URL

```bash
docker run -d -p 80:8000 --network django-app-net --name django-app-c1 \
  -e DATABASE_URL=postgres://postgres:postgres@database-1-instance-1.ceyv227pdll6.us-east-1.rds.amazonaws.com:5432/django_clinic_app_db abdullahabaza/django_clinic_app:v1
```
