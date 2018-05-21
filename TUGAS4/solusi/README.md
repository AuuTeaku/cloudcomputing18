## Penyelesaian
1. Menyiapkan 3 VM dengan ketentuan, 2 worker dengan OS Ubuntu 16.04 dan 1 DB Server dengan OS Debian
Untuk 
2. Membuat folder ansible dan masuk folder ansible
3. Membuat file hosts, isinya sebagai berikut:
[worker]
worker1 ansible_host=10.151.36.28 ansible_ssh_user=cloud ansible_become_pass=raincloud123!
worker2 ansible_host=10.151.36.29 ansible_ssh_user=cloud ansible_become_pass=raincloud123!
4. melakukan install software yang dibutuhkan pada masing-masing worker:

        - Nginx
        - PHP 7.2
        - Composer
        - Git
5. Jalankan langkah-langkah berikut untuk worker1 dan worker2
- Membuat playbook bernama install.yml, dengan syntax sebagai berikut:
gedit install.yml
- Buka install.yml dan menulis script sebagai berikut:

      - hosts: worker
        tasks:
          - name: Install git-nginx-curl
            become: yes
            apt: name={{ item }} state=latest update_cache=true
            with_items:
              - nginx
              - git
              - curl
          - name: Clone git
            git:
              dest: "{{ /var/www/laravel }}
              repo: https://github.com/udinIMM/Hackathon.git
              force: yes
- Membuat playbook bernama php.yml dan menulis pada php.yml dengan script berikut:
              
        - host: worker
          tasks:
            - name: PHP | Install PHP 7.2
              become: yes
              apt: pkg=php7.2 state=latest
              tags: ['common']
              
  dan jalankan syntax berikut:
  
      ansible-playbook -i hosts php.yml -k
  
 - Membuat folder "scripts" dan membuat file "composer.sh" di dalam foldernya untuk menulis script untuk menginstall composer, serta isi dengan script berikut:

       #!/bin/sh
       EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
       php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
       ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")
       if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
       then
         >&2 echo 'ERROR: Invalid installer signature'
         rm composer-setup.php
         exit 1
       fi

       php composer-setup.php --quiet
       RESULT=$?
       rm composer-setup.php
       exit $RESULT
        
- membuat folder "temp" dan membuat file konfigurasi nginx bernama "nginx.conf" dan mengisikan script sebgaai berikut:
      
      server {
        listen 80 default_server;
        listen [::]:80 default_server;
    
        root {{ /var/www/laravel/public }};

        index index.php;

        server_name {{ inventory_hostname }};

        location / {
          try_files $uri $uri/ =404;
        }

        location ~ \.php$ {
          try_files $uri /index.php =404;
          fastcgi_split_path_info ^(.+\.php)(/.+)$;
          fastcgi_pass unix:/var/run/php/php7.2-fpm.sock;
          fastcgi_index index.php;
          fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        include fastcgi_params;
        }

        error_log /var/log/nginx/{{ worker1 }}_error.log;
        access_log /var/log/nginx/{{ worker1 }}_access.log;
        }  
