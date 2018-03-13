# cloudcomputing18

Untuk menjawab semua soal di bawah, kita harus membuat virtual machine. berikut langkah-langkahnya:
1. membuat folder bernama minion dengan script sebagai berikut:<br><br>
    <b>mkdir minion</b>
2. masuk ke dalam folder minion, dengan script sebagai berikut:<br><br>
    <b>cd minion</b>
3. inisialisasi vagrant, dengan script sebagai berikut:<br><br>
    <b>vagrant init</b>
   <br>akan terdapat file Vagrantfile
4. download virtual box dengan script sebagai berikut:<br><br>
    <b>vagrant box add hashicorp/precise64</b>
   <br>pilih 2 untuk install virtual box dan tunggu hingga proses selesai.
5. config Vagrantfile sebagai berikut:<br>
    a. ganti
        <b>config.vm.box = "base"</b><br>
       menjadi<br>
        <b>config.vm.box = "hashicorp/precise64"</b><br><br>
    b. ganti bagian Vagrantfile menjadi script dibawah ini untuk menentukan resource memori dan mengatur core cpu:<br><br>
          <b>config.vm.provider "virtualbox" do |vb|</b> //diuncomment<br>
        <b># Display the VirtualBox GUI when booting the machine</b><br>
        <b># vb.gui = true</b><br>
        <b># Customize the amount of memory on the VM:</b><br>
 	        <b>vb.memory = "1024"</b>   //diuncomment<br>
 	        <b>vb.cpus = 2</b>  //diuncomment<br>
          <b>end</b> //diuncomment<br>
 6. buatlah file script bernama bootstrap.sh, isilah script sesuai yang dibutuhkan<br>
 7. tambahkan config pada Vagrantfile sehingga menjadi seperti berikut:<br><br>
      <b>config.vm.provision "shell", path: "bootstrap.sh"</b><br>
      <b>end<b>
      <br>
      <br>
      
      <h2>MENJAWAB PERTANYAAN</h2><br>
1. Buat vagrant virtualbox dan buat user 'awan' dengan password 'buayakecil'.<br>
<b>JAWABAN</b><br>
	a. tambahkan script pada bootsrap.sh untuk menambahkan user 'awan' dan password 'buayakecil' seperti berikut:<br><br>
    		<b>useradd awan -p $(echo buayakecil | openssl passwd -1 -stdin)</b><br>
	b. jangan lupa untuk menyalakan vagrant dengan perintah sebagai berikut:<br><br>
		<b>vagrant up</b><br>
	c. reload script bootsrap.sh dengan perintah sebagai berikut:<br><br>
		<b>vagrant reload –provision</b><br>
	hasilnya sebagai berikut:<br>
	![1](/images/1c.jpg)
	d. untuk mengecek, masuk vagrant dengan perintah sebagai berikut:
		vagrant ssh
	e. untuk login masukkan perintah su awan dan masukkan password: buayakecil, seperti berikut:
 
2. Buat vagrant virtualbox dan lakukan provisioning install Phoenix Web Framework 
	Untuk menginstall Phoenix Web Framework, kita perlu menginstall beberapa hal terlebih dahulu :
	a. Elixir 1.4 atau setelahnya
		Phoenix ditulis di Elixir. Sebelum menginstall elixir, kita perlu menginstall Hex. Hex adalah dependency yang akan 			dibutuhkan dalam Phoenix.
	Command untuk menginstall Hex adalah sebagai berikut :
		Mix local.hex
	Setelah itu, install Erlang untuk mendapatkan semua paket. Command nya adalah sebagai berikut :
	wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb
	sudo apt-get install -y esl-erlang
sudo apt-get install -y elixir

	b. Setelah berhasil menginstall elixir, untuk memastikan elixir telah terinstall maka silahkan masuk ke virtual machine (vagrant 		ssh) dan ketik command berikut :
		Elixir -v
	Akan muncul output seperti gambar berikut :
 	c. akhirnya kita akan menginstall phoenix. Untuk menginstall phoenix, ketikkan command berikut :
		mix archive.install https://github.com/phoenixframework/archieves/raw/master/phx_new.ez
 
3. Buat vagrant virtualbox dan lakukan provisioning install:
  a. php
untuk menginstall php, cukup mengetikkan command dibawah ini :
	sudo apt-get install -y php5 php5-fpm php5-cgi
  b. mysql
  c. composer
untuk menginstall php, cukup mengetikkan command dibawah ini :
	sudo apt-get install -y curl php5-cli
	sudo php composer-setup.php –install- dir=/usr/local/bin –filename=composer
	curl -sS https://getcomposer.org/installer | php
  d. nginx
untuk menginstall php, cukup mengetikkan command dibawah ini :
	sudo apt-get install -y nginx
	hasilnya adalah sebagai berikut :
setelah melakukan provioning, clone https://github.com/fathoniadi/pelatihan-laravel.git pada folder yang sama dengan vagrantfile di   komputer host. Setelah itu sinkronisasi folder pelatihan-laravel host ke vagrant ke /var/www/web dan jangan lupa install vendor laravel agar dapat dijalankan. Setelah itu setting root document nginx ke /var/www/web. webserver VM harus dapat diakses pada port 8080 komputer host dan mysql pada vm dapat diakses pada port 6969 komputer host

4. Buat vagrant virtualbox dan lakukan provisioning install:
  a. Squid proxy
	untuk install squid proxy, ketik command berikut :
	sudo apt-get install -y squid
  b. Bind9
	unutk menginstall bind9, ketik command berikut :
	sudo apt-get install -y bind9
	hasilnya adalah sebagai berikut :
 
