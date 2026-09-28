# OSI-Based Network Troubleshooting

The troubleshooting approach for this study block uses the OSI model as a framework. The correct starting point depends on the symptoms and available evidence.

| Layer | Name | What to investigate | Example checks |
|---:|---|---|---|
| 7 | Application | Application/service behavior | App logs, HTTP status, service state |
| 6 | Presentation | Encoding, encryption, translation | TLS/certificate behavior, encoding |
| 5 | Session | Session establishment/maintenance | Authentication/session behavior |
| 4 | Transport | TCP/UDP, ports, reliability | Port reachability, TCP connection |
| 3 | Network | IP addressing, routing | IP config, gateway, routes, ping |
| 2 | Data Link | Ethernet/Wi-Fi, MAC, switching | Link state, VLAN, association |
| 1 | Physical | Cable, power, radio/link | Cable, port, LEDs, signal |

## Top-down example

```text
Application fails
      ↓
Check application/service
      ↓
Check session/authentication
      ↓
Check TCP/UDP and ports
      ↓
Check IP/routing
      ↓
Check LAN/Wi-Fi/VLAN
      ↓
Check physical connectivity
```

## Bottom-up example

Useful when there is evidence of a physical or link problem:

```text
Physical
   ↓
Data Link
   ↓
Network
   ↓
Transport
   ↓
Session
   ↓
Presentation
   ↓
Application
```

## Divide-and-conquer example

Suppose one computer cannot access a website:

```text
1. Can the machine reach its local gateway?
2. Can it reach a known external IP?
3. Can it resolve the hostname?
4. Can it establish a TCP connection?
5. Does the application work?
```

Each answer narrows the search area.

## Important caution

The OSI model is a troubleshooting framework, not a requirement to test every layer every time. Use symptoms and evidence to prioritize tests.
