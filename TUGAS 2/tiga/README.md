# Biasanya pada saat membuat website, data user yang sedang login disimpan pada session. Sesision secara default tersimpan pada memory pada sebuah host. Bagaimana cara mengatasi masalah session ketika kita melakukan load balancing?

Berdasarkan sumber yang kami peroleh, maka mengatasi session ketika kita melakukan load balancing adalah solusinya dengan mensetting load balancing menggunakan basis sticky sessions, bukan dengan basis per-packet.

Jadi metode load-balancing yang diperlukan adalah sticky load-balancing berdasarkan group transaction. Sticky berarti menempel. Beberapa transaksi yang saling berkaitan harus menempel (dikirimkan) pada server yang sama.

Sticky load-balancing adalah hal yang biasa dilakukan apalagi pada load-balancing trafik HTTP dan pengelompokan tujuan biasanya didasarkan pada:

- Alamat IP pengirim
- Session pengguna/cookies yang informasinya biasa terdapat pada HTTP header
- Bagian (parameter) yang ada di request URL

Jadi yang dibutuhkan bukanlah load-balancing sederhana dengan algoritma round-robin.


*Source :: http://ejlp.blogspot.co.id/2008/09/aplikasi-load-balancer-gratis.html*
