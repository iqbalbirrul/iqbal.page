---
title: Cara Install NodeJS di Linux Ubuntu 16.04
date: '2017-06-02 05:33:00 +0000'
draft: false
tags:
- ubuntu
- nodejs
author: iqbal
---

Singkat cerita, NodeJS adalah sebuah framework Javascript yang dapat dijalankan di server dan dapat mengelola maupun mengolah request data dari client.

![NodeJS](https://earth-id-jkt-1.bal.web.id/assets/gambar/2017/nodejs-img.png)

Tentu saja prosedur pengolahan maupun pengembangan NodeJS tidak sama dengan server side programming pada umumnya seperti PHP atau pun ASP. Prosedur dan pengolahan antara NodeJS dan bahasa pemrograman web lain akan saya bahas pada artikel lain.
Berikut cara installasi nya:

Install menggunakan nvm.

<pre>
curl https://raw.github.com/creationix/nvm/master/install.sh | sh
</pre>

atau

<pre>
wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh
</pre>

Tutup terminal kemudian buka kembali Terminal dan masukan perintah berikut untuk menginstall NodeJS.

<pre>
nvm install stable
</pre>

Untuk lebih mudah melakukan installasi, bisa mendownload installer sesuai dengan sistem operasi kalian pada website [NodeJS](https://nodejs.org)

Selesai, Semoga bermanfaat :D.
