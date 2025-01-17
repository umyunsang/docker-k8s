---
title: Full example
weight: 10
---

As an example of how to use all of MetalLB's options, consider an
ecommerce site that runs a production environment and multiple
developer sandboxes side by side. The production environment needs
public IP addresses, but the sandboxes can use private IP space,
routed to the developer offices through a VPN.

Additionally, because the production IPs end up hardcoded in various
places (DNS, security scans for regulatory compliance...), we want
specific services to have specific addresses in production. On the
other hand, sandboxes come and go as developers bring up and tear down
environments, so we don't want to manage assignments by hand.

We can translate these requirements into MetalLB. First, we define two
address pools, and set BGP attributes to control the visibility of
each set of addresses:

```yaml
# Rest of config omitted for brevity
bgp-communities:
  # Our datacenter routers understand a "VPN only" BGP community.
  # Announcements tagged with this community will only be propagated
  # through the corporate VPN tunnel back to developer offices.
  vpn-only: 1234:1
address-pools:
- # Production services will go here. Public IPs are expensive, so we leased
  # just 4 of them.
  name: production
  protocol: bgp
  addresses:
  - 42.176.25.64/30

- # On the other hand, the sandbox environment uses private IP space,
  # which is free and plentiful. We give this address pool a ton of IPs,
  # so that developers can spin up as many sandboxes as they need.
  name: sandbox
  protocol: bgp
  addresses:
  - 192.168.144.0/20
  bgp-advertisements:
  - communities:
    - vpn-only
```

In our Helm charts for sandboxes, we tag all services with the
annotation `metallb.universe.tf/address-pool: sandbox`. Now, whenever
developers spin up a sandbox, it'll come up on some IP address within
192.168.144.0/20.

For production, we set `spec.loadBalancerIP` to the exact IP address
that we want for each service. MetalLB will check that it makes sense
given its configuration, but otherwise will do exactly as it's told.
