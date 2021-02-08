---
title: Couldn't set permissions on cross-process lock
date: '2021-02-08 12:32:32'
tags:
- apache
---

Apache Error Permission

```
[emerg] (22)Invalid argument: Couldn't set permissions on cross-process lock; check User and Group directives
```

Untuk melakukan pembenahan, coba tambahkan baris berikut pada `/etc/apache2/apache2.conf` atau `/etc/httpd/conf/httpd.conf`.

```
User www-data
Group www-data
```

User group disesuaikan dengan default dari sistem operasi yang digunakan.

> Sc: archive [kuro.zone](http://kuro.zone)
