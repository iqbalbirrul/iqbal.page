---
title: 'Git: Change git remote URL'
date: '2021-02-08 12:38:21'
tags:
- git
---

Masuk ke repository terlebih dahulu, kemudian gunakan perintah berikut:

```
$ git remote -v
```
```
$ git remote set-url origin https://github.com/USERNAME/REPOSITORY.git
```
```
$ git remote -v
# Verify new remote URL
> origin  https://github.com/USERNAME/REPOSITORY.git (fetch)
> origin  https://github.com/USERNAME/REPOSITORY.git (push)
```

> Sc: archive [kuro.zone](http://kuro.zone)
