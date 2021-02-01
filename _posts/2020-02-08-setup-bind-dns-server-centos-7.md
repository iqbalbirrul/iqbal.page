---
title: Setup Bind DNS Server CentOS 7
date: '2020-02-08 23:28:04 +0700'
draft: false
tags:
- dns
- centos
- bind9
author: iqbal
---

DNS, stands for Domain Name System, translates hostnames or URLs into IP addresses. For example, if we type **red.my.id** in browser, the DNS server translates the domain name into its associated ip address. Since the IP addresses are hard to remember all time, DNS servers are used to translate the hostnames like **red.my.id** to `104.xx.xx.xxx`. So it makes easy to remember the domain names instead of its IP address.

![DNS Server](https://earth-id-jkt-1.bal.web.id/assets/gambar/2019/dns.png)

----

## DNS Server Installation

### Requirements

#### Operating System

<pre>
Operating System     : CentOS 7 minimal server
Hostname             : dns01.dapur.my.id
IP Address           : 117.53.44.164
</pre>

Domain name ex : **dapur.my.id**
##### Private Name Server

<pre>
IPv4 Glue records for dapur.my.id
ns1.dapur.my.id.	43200	IN	A	117.53.44.164
ns2.dapur.my.id.	43200	IN	A	117.53.44.164

There are no IPv6 Glue records for dapur.my.id
</pre>

##### Install and configure Bind DNS Server

##### Install Bind DNS Server

<pre>
yum update -y
yum install bind bind-utils -y
</pre>

#### Configure Bind DNS Server

Edit file `/etc/named.conf`

<pre>
mv /etc/named.conf /etc/named.conf-backup
vim /etc/named.conf
</pre>

Add the following lines:

<pre>
options {
        listen-on port 53 { 127.0.0.1; 117.53.44.164; };
        directory "/var/named";
        dump-file "/var/named/data/cache_dump.db";
        statistics-file "/var/named/data/named_stats.txt";
        memstatistics-file "/var/named/data/named_mem_stats.txt";

        allow-query { 127.0.0.1; 117.53.44.164; any; };
        allow-query-cache { 127.0.0.1; 117.53.44.164; any ;};
        };

logging {
        channel default_debug {
                file "data/named.run";
                severity dynamic;
                };
        };

zone "dapur.my.id" {
                type master;
                file "/var/named/dapur.fwd";
                };
</pre>

#### Create Zone file

Create forward and reverse zone files which we mentioned in the ''/etc/named.conf'' file.

#### Create DNS Zone

Create `dapur.fwd` file in the `/var/named` directory.

Add the following lines:

<pre>
$TTL 86400
@       IN      SOA      ns1.dapur.my.id. root.dapur.my.id.(
                                2019100914      ;Serial
                                3600            ;Refresh
                                1800            ;Retry
                                604800          ;Expire
                                86400           ;Minimum TTL
)

@       IN      NS      ns1.dapur.my.id.
@       IN      NS      ns2.dapur.my.id.

@       IN      A       117.53.44.164
ns1     IN      A       117.53.44.164
ns2     IN      A       117.53.44.164

www     IN      CNAME   dapur.my.id.
</pre>

#### Check configuration file

Check DNS default configuration file:

<pre>
named-checkconf /etc/named.conf
</pre>

If it returns nothing, the configuration file is valid.

Check zone file:

<pre>
named-checkzone dapur.my.id /var/named/dapur.fwd
</pre>

Sample output: 

<pre>
zone dapur.my.id/IN: loaded serial 2019100914
OK
</pre>

#### Start DNS server

<pre>
systemctl start named
systemctl enable named
systemctl status named
</pre>

***

### Test DNS Server

<pre>
dig dapur.my.id
</pre>

Sample output:

<pre>
[root@dns01 ~]# dig dapur.my.id

; <<>> DiG 9.11.4-P2-RedHat-9.11.4-9.P2.el7 <<>> dapur.my.id
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 16079
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 1

;; OPT PSEUDOSECTION:
; EDNS: version: 0, flags:; udp: 4096
;; QUESTION SECTION:
;dapur.my.id.                   IN      A

;; ANSWER SECTION:
dapur.my.id.            86400   IN      A       117.53.44.164

;; Query time: 3 msec
;; SERVER: 43.224.19.110#53(43.224.19.110)
;; WHEN: Wed Oct 09 12:06:56 WIB 2019
;; MSG SIZE  rcvd: 56
</pre>

<pre>
nslookup dapur.my.id
</pre>

Sample output:

<pre>
Server:         43.224.19.110
Address:        43.224.19.110#53

Non-authoritative answer:
Name:   dapur.my.id
Address: 117.53.44.164
</pre>

To make sure DNS is resolved, you can use a website like **https://intodns.com** or **https://whatsmydns.com**.
