#!/bin/bash

# Atualiza os pacotes do sistema
sudo apt-get update
sudo apt-get upgrade -y

# Instala o Apache
sudo apt-get install apache2 -y

# Inicia o Apache
sudo systemctl start apache2

# Habilita o Apache para iniciar na inicialização
sudo systemctl enable apache2

# Abre o firewall para o tráfego HTTP
sudo ufw allow 'Apache'

# Configuração do VirtualHost (substitua 'seusite.com' pelo seu domínio)
sudo echo "
<VirtualHost *:80>
    ServerAdmin webmaster@seusite.com
    ServerName seusite.com
    DocumentRoot /var/www/seusite.com/public_html
    ErrorLog /var/www/seusite.com/error.log
    CustomLog /var/www/seusite.com/access.log combined
</VirtualHost>
" | sudo tee /etc/apache2/sites-available/seusite.com.conf

# Ativa o VirtualHost
sudo a2ensite seusite.com

# Recarrega o Apache para aplicar as alterações
sudo systemctl reload apache2

# Crie o diretório de documento raiz
sudo mkdir -p /var/www/seusite.com/public_html

# Define permissões para o diretório de documento raiz (ajuste conforme necessário)
sudo chown -R $USER:$USER /var/www/seusite.com/public_html
sudo chmod -R 755 /var/www/seusite.com/public_html

# Cria uma página de teste (substitua pelo seu conteúdo)
echo "<html><body><h1>Seu site está funcionando!</h1></body></html>" > /var/www/seusite.com/public_html/index.html
