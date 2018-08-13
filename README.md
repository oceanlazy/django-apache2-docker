# Django Apache2 Docker basic #

Simple example for Django Apache2 Docker project

## Installation ##
```sh
sudo apt-get install docker-ce -compose
pip install -r requirements.txt
```

## Usage ##
Build and run image:
```sh
docker-compose build
docker-compose up
```

Enter to the shell while container is running:
```sh
docker-compose exec django_apache2_docker_service bash
```
