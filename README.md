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
          <b>end</b> //diuncomment<br><br>
 6. buatlah file script bernama bootstrap.sh, isilah script sesuai yang dibutuhkan<br>
 7. tambahkan config pada Vagrantfile sehingga menjadi seperti berikut:<br><br>
      <b>config.vm.provision "shell", path: "bootstrap.sh"</b><br>
      <b>end</b>
      <br>
      <br>
      
# MENJAWAB PERTANYAAN<br>
1. Buat vagrant virtualbox dan buat user 'awan' dengan password 'buayakecil'.<br>
<b>JAWABAN</b><br>
	a. tambahkan script pada bootsrap.sh untuk menambahkan user 'awan' dan password 'buayakecil' seperti berikut:<br><br>
    		<b>useradd awan -p $(echo buayakecil | openssl passwd -1 -stdin)</b><br><br>
	b. jangan lupa untuk menyalakan vagrant dengan perintah sebagai berikut:<br><br>
		<b>vagrant up</b><br><br>
	c. reload script bootsrap.sh dengan perintah sebagai berikut:<br><br>
		<b>vagrant reload –provision</b><br><br>
	hasilnya sebagai berikut:<br>
	![1](/image/1c.JPG) <br>
	d. untuk mengecek, masuk vagrant dengan perintah sebagai berikut:<br><br>
		<b>vagrant ssh</b><br>
	e. untuk login masukkan perintah su awan dan masukkan <br>
	<br>password: buayakecil, seperti berikut:
 	![2](/image/1e.JPG) <br>
<br>2. Buat vagrant virtualbox dan lakukan provisioning install Phoenix Web Framework <br>
	Untuk menginstall Phoenix Web Framework, kita perlu menginstall beberapa hal terlebih dahulu :<br><br>
	a. Elixir 1.4 atau setelahnya<br>
	Phoenix ditulis di Elixir. Sebelum menginstall elixir, kita perlu menginstall Hex. Hex adalah dependency yang akan 		dibutuhkan dalam Phoenix.<br>
	Command untuk menginstall Hex adalah sebagai berikut :<br><br>
		<b>Mix local.hex</b><br><br>
	Setelah itu, install Erlang untuk mendapatkan semua paket. Command nya adalah sebagai berikut :<br><br>
	<b>wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && sudo dpkg -i erlang-solutions_1.0_all.deb</b><br>
	![3](/image/2b.JPG) <br>
	<b>sudo apt-get install -y esl-erlang</b><br>
	<b>sudo apt-get install -y elixir</b><br><br>
	b. Setelah berhasil menginstall elixir, untuk memastikan elixir telah terinstall maka silahkan masuk ke virtual machine <b>(vagrant ssh)</b> dan ketik command berikut :<br><br>
		<b>Elixir -v</b><br>
	Akan muncul output seperti gambar berikut :
 	c. akhirnya kita akan menginstall phoenix. Untuk menginstall phoenix, ketikkan command berikut :
		mix archive.install https://github.com/phoenixframework/archieves/raw/master/phx_new.ez
 	![4](/image/2c.JPG) <br>
3. Buat vagrant virtualbox dan lakukan provisioning install:<br>
<b>  a. php</b><br>
untuk menginstall php, cukup mengetikkan command dibawah ini :<br>
	<b>sudo apt-get install -y php5 php5-fpm php5-cgi</b><br>
  b. mysql<br><br>
  c. composer <br><br>
untuk menginstall php, cukup mengetikkan command dibawah ini :<br><br>
	<b>sudo apt-get install -y curl php5-cli<br>
	sudo php composer-setup.php –install- dir=/usr/local/bin –filename=composer<br>
	curl -sS https://getcomposer.org/installer | php</b><br><br>
  d. nginx<br>
untuk menginstall php, cukup mengetikkan command dibawah ini :<br>
	<b>sudo apt-get install -y nginx</b>
	hasilnya adalah sebagai berikut :<br>
	![5](/image/3d.JPG)
setelah melakukan provioning, clone https://github.com/fathoniadi/pelatihan-laravel.git pada folder yang sama dengan vagrantfile di   komputer host. Setelah itu sinkronisasi folder pelatihan-laravel host ke vagrant ke /var/www/web dan jangan lupa install vendor laravel agar dapat dijalankan. Setelah itu setting root document nginx ke /var/www/web. webserver VM harus dapat diakses pada port 8080 komputer host dan mysql pada vm dapat diakses pada port 6969 komputer host<br><br>

4. Buat vagrant virtualbox dan lakukan provisioning install:<br>
  a. Squid proxy<br>
	untuk install squid proxy, ketik command berikut :<br>
	<b>sudo apt-get install -y squid</b>
  b. Bind9<br>
	unutk menginstall bind9, ketik command berikut :<br>
	<b>sudo apt-get install -y bind9</b>
	hasilnya adalah sebagai berikut :
 	![6](/image/4b.JPG)
