---
title: Migrasi ke Platform Hexo
date: '2017-09-07 23:11:00 +0000'
draft: false
tags:
- hexo
- github
- nodejs
author: iqbal
---

Sebelumnya, saya adalah pengguna layanan Blogger.com, setelah beberapa bulan saya membeli layanan Shared Hosting dan berMigrasi ke Platform Wordpress Self-Host.

![Hexo.io](https://earth-id-jkt-1.bal.web.id/assets/gambar/2017/hexo.png)

Namun saya kurang puas, karena saya harus membeli Layanan dengan spesifikasi yang tinggi untuk sebuah situs Wordpress yang powerfull hehe.
Saya memutuskan untuk bermigrasi ke Platform Hexo, sebuah Framework blog sederhana tapi POWERFULL yang didukung oleh NodeJs. Baca juga:
- [Cara Install NodeJS di Linux Ubuntu 16.04](/cara-install-nodejs-di-linux-ubuntu-16.04)
- [Membuat Blog dengan Framework Hexo di GitHub](/membuat-blog-dengan-framework-hexo-di-github)

Saya memigrasikan artikel saya di Wordpress ke Hexo dengan menggunakan perintah:

```bash
$ npm install hexo-migrator-wordpress --save
$ hexo migrate wordpress <source>
```
Lalu saya edit menggunakan plugin yang sudah dibuat oleh Hexo agar bisa mengolah konten melalui GUInya, yaitu dengan menginstall plugin `hexo-admin`.

```bash
$ npm install --save hexo-admin
$ hexo server -d
```
Kemudian buka `localhost:4000/admin/` dan saya pun mulai mengedit konten yang sudah saya migrasikan, dari mulai mengganti tautan yang rusak, memindahkan gambar yang masih ngehost di hostinnya, dan lain-lain.

![https://iqbalbirrul.com](https://earth-id-jkt-1.bal.web.id/assets/gambar/2017/hexo-localhost-1.png)

Gambar diatas adalah tampilan dari situs ini.

Sekian dan terima kasih :).
