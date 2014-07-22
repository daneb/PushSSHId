### A Mass Deploy Tool for SSH ID (ssh-copy-id)

A simple gem to allow the admin to deploy a mass subset of keys to multiple machines mirroring the functionality of ssh-copy-id.

PS. To ignore Key Generation use -g

```
Dane-Balias-MacBook:PushSSHId danebalia$ ruby pushId.rb -g
Connecting to 172.16.1.2 with User -> daneb.....
daneb@172.16.1.2's password:
Connecting to 172.16.1.3 with User -> dane.....
dane@172.16.1.3's password:
Done
```
