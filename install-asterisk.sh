#!/bin/bash

# Asterisk Installation Script

# Update package lists
sudo apt update

# Install dependencies
sudo apt install -y build-essential libssl-dev libncurses5-dev libnewt-dev libxml2-dev libsqlite3-dev libjansson-dev libuuid1 uuid-dev

# Download Asterisk source code (adjust the version as needed)
ASTERISK_VERSION="18.20.0"
wget http://downloads.asterisk.org/pub/telephony/asterisk/asterisk-${ASTERISK_VERSION}.tar.gz
tar -zxvf asterisk-${ASTERISK_VERSION}.tar.gz
cd asterisk-${ASTERISK_VERSION}

# Configure Asterisk
./configure

# Compile and install Asterisk
make
sudo make install
sudo make config
sudo ldconfig

# Install additional sample configuration files
sudo make samples

# Start Asterisk service
sudo systemctl start asterisk

# Enable Asterisk to start on boot
sudo systemctl enable asterisk

# Display installation completion message
echo "Asterisk ${ASTERISK_VERSION} has been successfully installed."

# Clean up
cd ..
rm -rf asterisk-${ASTERISK_VERSION} asterisk-${ASTERISK_VERSION}.tar.gz
