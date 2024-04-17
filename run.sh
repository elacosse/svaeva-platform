sudo usermod -aG docker $USER

if [ -x "$(command -v docker)" ]; then
    echo "Docker is already installed"
    echo "Building and running the Docker container"
    sudo docker-compose -f docker-compose-multimodal-telegram-bot.yaml stop
    sudo docker-compose -f docker-compose-multimodal-telegram-bot.yaml up -d
else
    # Update the apt package index
    sudo apt-get update
    # Install packages to allow apt to use a repository over HTTPS
    sudo apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common
    # Add Docker’s official GPG key
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    # Verify that you now have the key with the fingerprint
    sudo apt-key fingerprint 0EBFCD88

    # Set up the stable repository
    sudo add-apt-repository \
       "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable"

    # Update the apt package index again
    sudo apt-get update -y

    # Install the latest version of Docker Engine and containerd
    sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose

    # Add current user to the Docker group to run Docker commands without sudo
    sudo usermod -aG docker $USER

    # Output Docker version to verify installation
    sudo docker --version

    echo "Docker installation completed. You may need to log out and back in for this to take effect."
    sudo docker-compose -f docker-compose-multimodal-telegram-bot.yaml up -d
fi
