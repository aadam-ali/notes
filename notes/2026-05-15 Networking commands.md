---
title: Networking commands
date: 2026-05-15
tags: [networking]
---
## Check connectivity to host

```bash
ping <hostname|ip-address>
```

## Check DNS resolution

```bash
dig <hostname> [<type>]
dig [@<nameserver>] <hostname> [<type>]

nslookup [-type=<type>] <hostname> [<nameserver>]
```

## Reverse DNS lookup

```bash
dig -x <ip-address>

nslookup -type=PTR <ip-address>
```

## Check open ports on host

```bash
ss --processes --listening --numeric --tcp

netstat --program --listening --numeric --tcp
```

## Check if port open on upstream

```bash
nc --verbose -z <hostname> <port>
```

## Inspect network traffic

```bash
tcpdump --interface any -nn host <hostname>
tcpdump --interface any -nn port <port>
```
