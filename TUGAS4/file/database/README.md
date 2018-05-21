## Debian 9 sebagai Database Server

- Repository Config dengan menjalankan perintah berikut
        
       $ wget https://dev.mysql.com/get/mysql-apt-config_0.8.6-1_all.deb
       $ ls
       mysql-apt-config_0.8.6-1_all.deb
       
       # apt install gdebi-core

- Install MySQL Server dengan syntax sebagai berikut:

      # apt update
      # apt install mysql-server
      
- Konfirmasi installation

      # mysql -p

