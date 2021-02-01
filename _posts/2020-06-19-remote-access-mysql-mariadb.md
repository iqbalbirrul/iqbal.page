---
title: Remote Access MySQL atau MariaDB
date: '2020-06-19 22:54:07 +0700'
draft: false
comments: true
tags:
- mysql
- mariadb
author: iqbal
---

## Konfigurasi

Konfigurasi MariaDB dengan merubah bind address dari `127.0.0.1` menjadi `0.0.0.0`, kemudian restart service.

<pre>
root@db:~# vim /etc/mysql/mariadb.conf.d/50-server.cnf

###
# Instead of skip-networking the default is now to listen only on
# localhost which is more compatible and is not less secure.
bind-address            = 0.0.0.0
###

root@db:~# systemctl restart mariadb
</pre>

Cek ketersediaan port database:

<pre>
root@db:~# netstat -tulpn | grep 3306
tcp        0      0 0.0.0.0:3306            0.0.0.0:*               LISTEN      3675/mysqld         
</pre>

Buat user MySQL/MariaDB:

<pre>
root@db:~# mysql -u root -p
Enter password: 
</pre>
<pre>
MariaDB [(none)]> use mysql

Database changed
MariaDB [mysql]> CREATE USER 'username'@'CLIENT_IP' IDENTIFIED BY 'password';
Query OK, 0 rows affected (0.00 sec)
</pre>

Cek privileges dari user tersebut:

<pre>
select * from user where user='username' \G
</pre>

![Privileges 1](https://earth-id-jkt-1.bal.web.id/assets/gambar/2020/mariadb/remote-access/mariadb-privileges1.png)

User tersebut belum mendapatkan hak akses. Tambahkan hak akses terlebih dahulu pada user tersebut.

<pre>
MariaDB [mysql]> GRANT ALL ON *.* to 'username'@'CLIENT_IP';
MariaDB [mysql]> update user SET Grant_priv='Y'  WHERE User = 'kilat';
</pre>

Cek kembali privileges dari user tersebut.

<pre>
select * from user where user='username' \G
</pre>

![Privileges 2](https://earth-id-jkt-1.bal.web.id/assets/gambar/2020/mariadb/remote-access/mariadb-privileges2.png)

Sekarang user tersebut sudah mendapatkan hak akses penuh pada MySQL/MariaDB.

### Percobaan

Tes koneksi ke database menggunakan telnet:

<pre>
$ telnet IP_DATABASE 3306
</pre>

![Testing 1](https://earth-id-jkt-1.bal.web.id/assets/gambar/2020/mariadb/remote-access/mariadb-testing1.png)

Tes login ke MySQL/MariaDB:

<pre>
$ mysql -h IP_DATABASE -u username -p
</pre>

![Testing 2](https://earth-id-jkt-1.bal.web.id/assets/gambar/2020/mariadb/remote-access/mariadb-testing2.png)

Selesai.
