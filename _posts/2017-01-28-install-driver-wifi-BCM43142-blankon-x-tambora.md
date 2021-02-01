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

<pre>
# Debian 8 "Jessie"
deb http://httpredir.debian.org/debian/ jessie main contrib non-free
</pre>

Lalu update dan install `linux-image`, `linux-header` dan `broadcom-sta-dkms`

<pre>
apt-get update
apt-get install linux-image-$(uname -r|sed 's,[^-]*-[^-]*-,,') linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') broadcom-sta-dkms
</pre>

Kemudian unload modul yang bermasalah

<pre>
modprobe -r b44 b43 b43legacy ssb brcmsmac bcma
</pre>

dan load modul `wl`

<pre>
modprobe wl
</pre>

![successful](https://earth-id-jkt-1.bal.web.id/assets/gambar/2017/wlan.png)

Selesai, semoga bermanfaat.
