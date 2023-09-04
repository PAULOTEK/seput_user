#!/bin/bash
# Script de configuração de infraestrutura
# Autor: Seu Nome
# Descrição: Este script configura usuários, grupos, diretórios e permissões automaticamente em uma nova máquina.
USER_NAME="novousuario"
GROUP_NAME="novogrupo"
DIRECTORY="/caminho/para/diretorio"
sudo groupadd $GROUP_NAME
sudo useradd -m -g $GROUP_NAME -s /bin/bash $USER_NAME
echo "$USER_NAME:suasenha" | sudo chpasswd
sudo mkdir -p $DIRECTORY
sudo chown $USER_NAME:$GROUP_NAME $DIRECTORY
sudo mkdir -p $DIRECTORY
sudo chown $USER_NAME:$GROUP_NAME $DIRECTORY
sudo chmod 755 $DIRECTORY
