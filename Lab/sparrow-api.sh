#!/bin/bash

# update & upgrade
sudo apt update -y
sudo apt upgrade -y

# Set up Docker's apt repository
# Add Docker's official GPG key:
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y

# Install the Docker packages
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# install node 20
curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt install nodejs -y
sudo apt-get update -y

# Create sparrow user
sudo useradd -m sparrow

# Set the password for the new user
echo "sparrow:sparrow" | sudo chpasswd

# Optionally, add the user to a specific group (e.g., 'sudo' for admin access)
sudo usermod -aG sudo sparrow

# add user to docker group
sudo usermod -aG docker sparrow

# install git
sudo apt install git -y

# Clone the repository
sudo git clone https://github.com/sparrowapp-dev/sparrow-api.git
 
sudo touch /sparrow-api/.env

sudo cp /sparrow-api/.env.example /sparrow-api/.env

sudo chown -R sparrow:sparrow /sparrow-api/


# Install PNPM globally
sudo npm i -g pnpm

# # Run docker up command inside /sparrow-api
# sudo bash -c "cd /sparrow-api && pnpm docker:up"


# # Install PNPM globally
# sudo npm i -g pnpm

# # Setup required components locally - Mongo, Kafka (Wait for 3-5 minutes after running this command)
# sudo pnpm docker:up


# # Install nodemon globally
# sudo npm install -g nodemon

# # Require sleep of 5 minutes for mongo and kafka
# sleep 100

# # Insatll dependencies
# sudo pnpm i

# # Copy .env file
# sudo cp /sparrow-api/.env.example /sparrow-api/.env

# # Run App in development mode
# sudo pnpm start:dev

# # # Access swagger on localhost
# # Go to http://localhost/api/docs
# # Check health <public-ip>:9000/health

# # #[OPTIONAL] In case you want to remove the local components, run the below command 
# # pnpm docker:down
