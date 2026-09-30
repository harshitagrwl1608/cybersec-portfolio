# Netcat (`nc`)

## 1. What `nc` does

`nc` / **netcat** can create TCP or UDP connections and listeners. It can be used to send or receive raw data, test services, transfer data, and probe ports.

It is not inherently encrypted. If you need confidentiality, use an appropriate encrypted transport such as SSH/TLS.

Basic client form:

```bash
nc host port
```

## 2. Connect to a service

```bash
nc example.com 80
```

For a plain HTTP/1.0 request:

```text
GET / HTTP/1.0
Host: example.com

```

The server may return an HTTP response.

## 3. Listen for a connection

A common OpenBSD netcat form is:

```bash
nc -l 3000
```

The listener waits for a client to connect.

## 4. Simple message exchange

Server:

```bash
nc -l 3000
```

Client:

```bash
nc server.example 3000
```

Anything typed into the client can be sent to the server and vice versa while the connection is open.

## 5. File transfer

A simple local lab pattern is:

**Receiver / listener:**

```bash
nc -l 3000 > received.txt
```

**Sender:**

```bash
nc receiver.example 3000 < file.txt
```

The exact listener flags vary slightly between netcat implementations, so check `nc -h` on the installed version.

## 6. Port scanning

```bash
nc -zv host 20-30
```

- `-z` — scan/listen without sending application data.
- `-v` — verbose output.

This can report reachable/open ports, but it does not replace a full service/version scanner.

## 7. Communication model

```mermaid
flowchart LR
    A[Client nc] <-->|TCP/UDP raw data| B[Server nc/listener]
```

## 8. Security note

Because plain `nc` does not provide encryption by itself, data sent over an unprotected connection can potentially be observed or altered. Use it mainly for controlled testing, troubleshooting, or intentionally unencrypted protocols.
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

