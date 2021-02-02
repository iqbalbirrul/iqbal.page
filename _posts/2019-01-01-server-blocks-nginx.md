---
title: Server Block Nginx
date: '2019-01-01 08:59:48 +0700'
draft: false
tags:
- nginx
- web server
author: iqbal
---

![Nginx Logo | https://dwglogo.com](https://earth-id-jkt-1.bal.web.id/assets/gambar/2019/nginx-logo.png)

Berikut contoh konfigurasi server block Nginx:

```bash
server {
  listen 80;
  listen [::]:80;

  server_name say.iqbal.es;
  root /var/www/say.iqbal;

  index index.html index.php;
}
```

Server block jika menggunakan php-fpm:

```bash
server {
 listen 89;
 listen [::]:89;

 server_name _;
 root /var/www/whois;

 index index.php;

 location ~* \.php$ {
 fastcgi_pass unix:/run/php/php-fpm.sock;
 include	fastcgi_params;
 fastcgi_param	SCRIPT_FILENAME	$document_root$fastcgi_script_name;
 fastcgi_param	SCRIPT_NAME	$fastcgi_script_name;
  }
}
```

Jika menggunakan SSL, berikut contoh konfigurasinya:


```bash
server {
  listen 80;
  listen [::]:80;

  server_name say.iqbal.es;
  return 301 https://$server_name$request_uri;
}
server {
        listen 443;
        server_name say.iqbal.es;
        root /var/www/say.iqbal;

        index index.html index.php;

        ssl on;
        ssl_certificate     /etc/letsencrypt/live/say.iqbal.es/fullchain.pem;
        ssl_certificate_key /etc/letsencrypt/live/say.iqbal.es/privkey.pem;
        ssl_session_timeout 15m;
        ssl_protocols SSLv3 TLSv1;
        ssl_ciphers ALL:!ADH:!EXPORT56:RC4+RSA:+HIGH:+MEDIUM:+LOW:+SSLv3:+EXP;
        ssl_prefer_server_ciphers on;
}
```

Dan ini untuk konfigurasi Nginx sebagai Reverse Proxy:

```bash
server {
  listen 80;
  listen [::]:80;

  server_name k.iqbal.es;

  location / {
      proxy_pass http://k.iqbal.es:6969;
  }
}
```

Semoga bermanfaat :3

Sumber : [https://www.nginx.com](https://www.nginx.com/resources/wiki/start/topics/examples/server_blocks/)
