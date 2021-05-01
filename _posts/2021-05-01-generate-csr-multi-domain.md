---
title: Generate CSR Multi-Domain
date: '2021-05-01 23:43:54'
tags:
- ssl
---

#### Contoh

Contoh domain yang akan digunakan:

> - `*.iqbal.page`
> - www.iqbal.id
> - secure.iqbal.id

#### Proses

Salin konfigurasi openssl

```
cp /etc/ssl/openssl.cnf /var/www/certs/iqbal.page.cnf
```

Buka file `iqbal.page.cnf`, cari baris dibawah ini lalu uncomment

```
req_extensions = v3_req
```

Setelahnya tambahkan beberapa konfigurasi berikut dibawah baris `[ v3_req ]`

```
subjectAltName = @alt_names

[ alt_names ]
DNS.1 = www.iqbal.id
DNS.2 = secure.iqbal.id
```

Selesai.

#### Generate

Masih didalam directory `certs`, lakukan generate privkey.

```
openssl genrsa -out iqbal.page.key 2048
```

Kemudian generate CSR dengan perintah berikut:

```
openssl req -new -key iqbal.page.key -out iqbal.page.csr -config iqbal.page.cnf
```

> option `-config` harus ditambahkan, jika tidak maka CSR hanya berlaku untuk 1 common name.
> pada kolom common name saat generate, masukan domain utama, contoh: `*.iqbal.page`

![generate csr](/assets/images/images-new/csr-generate.png)

Verify CSR

```
openssl req -in iqbal.page.csr -noout -text
```

Hasilnya sebagi berikut:

![csr check](/assets/images/images-new/csr-preview.png)
