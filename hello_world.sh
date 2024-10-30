#!/bin/bash

# Atualiza os pacotes
sudo su
sudo apt-get update -q -y

# Instala o Docker sem interação
sudo apt-get install -q -y docker.io

# Habilita e inicia o serviço Docker
sudo systemctl enable docker
sudo systemctl start docker

# Cria um arquivo HTML com a mensagem "Hello World"
echo "<h1>Hello World</h1>" > index.html

# Executa um container Docker utilizando nginx, montando o diretório atual com o arquivo HTML
sudo docker run -d -p 8080:80 -v $(pwd)/index.html:/usr/share/nginx/html/index.html nginx

# Exibe a mensagem de sucesso
echo "O container está rodando! Acesse no navegador: http://localhost:8080"
