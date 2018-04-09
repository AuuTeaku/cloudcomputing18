# Buatlah Vagrantfile sekaligus provisioning-nya untuk menyelesaikan kasus.

Yang pertama kali kami lakukan adalah membuat direktori loadbalancer, worker1, dan worker2

          mkdir loadbalancer
          mkdir worker1
          mkdir worker2

Lalu, masuk ke direktori loadbalancer, worker1, dan worker2
          
          cd loadbalancer
          cd worker1
          cd worker2

lakukan ***vagrant init*** pada ketiganya.

Untuk Virtual Box, ketiganya menggunakan hashicorp/precise64
          
          virtual box add hashicorp/precise64
          
Kemudian jika box mendukung lebih dari satu provider akan ditanyakan provider yang akan digunakan. Pilih provider virtualbox. Jangan lupa melakukan setting pada Vagrantfile seperti yang telah dilakukan di sesi lab 1. Dalam laporan ini, kami akan menjelaskan lebih khusus ke provisioning dan configurasi loadbalancing.

Pada LOADBALANCER, WORKER1, dan WORKER2, provisioningnya adalah sebagai berikut :
        
          apt-get update
          apt-get install -y php5 php5-fpm php5-cgi nginx

### Pembagian IP

- IP loadbalancer = 192.168.1.1
- IP worker1 = 192.168.1.2
- IP worker2 = 192.168.1.3

### Konfigurasi Loadbalancing
Untuk konfigurasi loadbalancing, pada **LOADBALANCER**:
          
          nano /etc/nginx/sites-available/default

Ubah menjadi :
  
          upstream worker {
             server 192.168.1.2;
             server 192.168.1.3;
          }

          server {
                  listen 80 default_server;
                  listen [::]:80 default_server;

                  root /var/www/html;

                  index index.php index.html index.htm index.nginx-debian.html;

                  server_name _;

                  location / {
                          # First attempt to serve request as file, then
                          # as directory, then fall back to displaying a 404.
                          try_files $uri $uri/ =404;
                          proxy_pass http://worker;
                  }

                  location ~ \.php$ {
                      include snippets/fastcgi-php.conf;
                      fastcgi_pass 127.0.0.1:9000;

                  }

                  location ~ /\.ht {
                          deny all;
                  }
          }
