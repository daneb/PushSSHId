### A Mass Deploy Tool for SSH ID (ssh-copy-id)

A simple tool to allow the admin to deploy a mass subset of keys to multiple machines mirroring the functionality of ssh-copy-id.

#### Simple Example

```
Dane-Balias-MacBook:PushSSHId danebalia$ ruby pushId.rb
Generating public/private rsa key pair.
Enter file in which to save the key (/Users/danebalia/.ssh/id_rsa):
```

#### PS. To ignore Key Generation use -g

```
Dane-Balias-MacBook:PushSSHId danebalia$ ruby pushId.rb -g
Connecting to 172.16.1.2 with User -> daneb.....
daneb@172.16.1.2's password:
Connecting to 172.16.1.3 with User -> dane.....
dane@172.16.1.3's password:
Done
```
Now a simple ssh (no password) and you in:

```
Dane-Balias-MacBook:.ssh danebalia$ ssh -l dane 172.16.1.2
dane@172.16.1.2's password:

Dane-Balias-MacBook:.ssh danebalia$ ssh -l daneb 172.16.1.2
Linux raspberrypi 3.12.22+ #691 PREEMPT Wed Jun 18 18:29:58 BST 2014 armv6l

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Fri Jun 20 13:47:45 2014 from 172.16.1.1
daneb@raspberrypi ~ $
```
