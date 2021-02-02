---
title: Cara Install Aplikasi Atom di Linux Mint Via PPA [32bit + 64bit]
date: '2016-02-26 02:46:00 +0000'
draft: false
tags:
- atom
author: iqbal
---

Atom adalah sebuah Aplikasi teks editor seperti halnya Notepad++ di _Windows._  Atom sendiri adalah Aplikasi yang bersifat Cross Platform yang artinya bisa dijalankan dibeberapa sistem operasi seperti Linux dan Mac OsX.

Atom tidak bisa didownload dalam versi 32 bit, terkecuali kita Install manual lewat terminal linux kita :).

![Atom](https://earth-id-jkt-1.bal.web.id/assets/gambar/2016/atom.png)

Pertama tambahkan repository berikut :

```bash
sudo add-apt-repository ppa:webupd8team/atom
```

Kemudian ketikan

```bash
sudo apt-get update
```

Setelah update selesai tingggal langkah terakhir yaitu install Atom-nya dengan cara seperti biasa yakni :

```bash
sudo apt-get install atom
```

Tunggu hingga Installasi selesai, jika sudah selesai buka Atom di `Menu > Pengembang > Atom`.

Ini dia penampakan Aplikasi Atom

![Atom](https://earth-id-jkt-1.bal.web.id/assets/gambar/2016/atom_1.png)

Semoga bermanfaat :) .
