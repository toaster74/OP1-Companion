#!/bin/bash

sudo apt install -y docker.io docker-compose
sudo usermod pi -G docker
newgrp docker
