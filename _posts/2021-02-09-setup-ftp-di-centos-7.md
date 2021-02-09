---
title: Setup FTP di CentOS 7
tags:
- linux
- ftp
date: '2021-02-09 14:45:14'
---

#### Install  VSFTPD
```
yum update -y
``` 
```
yum install vsftpd -y
```
```
systemctl start vsftpd
systemctl enable vsftpd
```

#### Konfigurasi VSFTPD

```
cp /etc/vsftpd/vsftpd.conf /etc/vsftpd/vsftpd.conf.default
```

Edit file `/etc/vsftpd/vsftpd.conf` dan sesuaikan dengan konfigurasi berikut:
```
anonymous_enable=NO
```
```
local_enable=YES
```
```
write_enable=YES
```
```
chroot_local_user=YES
allow_writeable_chroot=YES
```

##### Tambah user list

Masih dengan mode edit file `/etc/vsftpd/vsftpd.conf`,  sesuaikan dengan konfigurasi berikut:

```
userlist_enable=YES
```
```
userlist_file=/etc/vsftpd/user_list
```
```
userlist_deny=NO
```

```
systemctl restart vsftpd
```

Tambah user:
```
adduser user1
```
```
passwd user1
```

Masukan user baru ke list user ftp:

```
echo “testuser” | sudo tee –a /etc/vsftpd/user_list
```

#### Testing

```
~]# ftp
ftp> open IP_ADDRESS_or_HOSTNAME
```
![ftp](/assets/ftp-cli-test1.png)

Semoga bermanfaat.
