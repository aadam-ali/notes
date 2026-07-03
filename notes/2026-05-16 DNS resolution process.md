---
title: DNS resolution process
date: 2026-05-16
tags: [networking]
---
## Components

**Stub Resolver**

The resolver running on a client. At a minimum it must be able to foward
requests to a recursive resolver, and may cache results.

**Recursive Resolver**

A recursive resolver will either return a cached result or send requests
through the DNS hierarchy to answer the original query.

**Root Nameserver**

Root nameservers receive queries from recursive resolvers and direct
them to the TLD server for the given domain extension (.com, .net etc.).

**TLD (top-level domain) Nameserver**

TLD nameservers contain information for second-level domains (a.com but
not b.a.com) with a given extension, they return the authoritative
nameserver for a domain.

**Authoritative Nameserver**

Authoritative nameservers contain the DNS records for a zone. These
are named in the `NS` record for a domain.

## Process

1. Stub resolver queries recursive resolver (if cache misses)
2. Recursive resolver queries root server for TLD server (if cache
   misses)
3. Root server returns TLD server
4. TLD server returns authoritative server
5. Authoritative server returns IP / value (including authoritative
   nameservers for delegated subdomains)

Related:
* <https://www.rfc-editor.org/rfc/rfc1123#section-6.1.3.1>
* <https://datatracker.ietf.org/doc/html/rfc9499>
