---
title: Install Driver WiFi BCM43142 BlankOn X Tambora
date: '2017-01-28 16:05:00 +0000'
draft: false
tags:
- blankon
- driver
- wifi
author: iqbal
---

Langsung saja buka `sources.list` dan tambahkan repository berikut :

```bash
# Debian 8 "Jessie"
deb http://httpredir.debian.org/debian/ jessie main contrib non-free
```

Lalu update dan install `linux-image`, `linux-header` dan `broadcom-sta-dkms`

```bash
apt-get update
apt-get install linux-image-$(uname -r|sed 's,[^-]*-[^-]*-,,') linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') broadcom-sta-dkms
```

Kemudian unload modul yang bermasalah

```bash
modprobe -r b44 b43 b43legacy ssb brcmsmac bcma
```

dan load modul `wl`

```
modprobe wl
```

![successful](https://earth-id-jkt-1.bal.web.id/assets/gambar/2017/wlan.png)

Selesai, semoga bermanfaat.
