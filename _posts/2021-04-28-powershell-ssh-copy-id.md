---
title: Powershell ssh-copy-id
date: '2021-04-28 15:08:19'
tags:
- ssh
- powershell
---

```
type $env:USERPROFILE\.ssh\id_rsa.pub | ssh user@domain.com "cat >>.ssh/authorized_keys"
```
