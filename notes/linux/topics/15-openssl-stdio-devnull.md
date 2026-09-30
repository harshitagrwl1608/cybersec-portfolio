# OpenSSL `s_client`, Standard Streams, Pipes, and `/dev/null`

## 1. OpenSSL

OpenSSL is a cryptographic toolkit. The `s_client` utility provides a generic TLS client and is commonly used to inspect and troubleshoot TLS servers.

## 2. `openssl s_client`

Basic form:

```bash
openssl s_client -connect example.com:443
```

This connects to the host and port and performs a TLS handshake. After a successful connection, input typed into the terminal can be sent to the peer.

For HTTPS-style testing, an HTTP request can be typed after the TLS session is established, for example:

```text
GET / HTTP/1.1
Host: example.com
Connection: close

```

A more precise description than “secure netcat” is: **a diagnostic TLS client**. It can be interactive, but unlike netcat it speaks TLS and exposes TLS/session information.

## 3. Standard streams

Linux processes conventionally start with three standard file descriptors:

| FD | Name | Typical role |
|---:|---|---|
| 0 | `stdin` | input |
| 1 | `stdout` | normal output |
| 2 | `stderr` | diagnostic/error output |

Example:

```bash
echo "hello"
```

prints through stdout (`1`).

## 4. Pipes

```bash
command1 | command2
```

By default:

```text
command1 stdout (1)
        |
        v
       pipe
        |
        v
command2 stdin (0)
```

Stderr (`2`) is not automatically passed through the pipe.

## 5. `/dev/null`

`/dev/null` is a special device that discards data written to it and behaves as an immediate end-of-file source when read.

Examples:

```bash
command > /dev/null
command 2> /dev/null
command >/dev/null 2>&1
```

The last form discards both stdout and stderr.

## 6. Why `/dev/null` is useful

It is commonly used when output is deliberately unneeded, e.g. in scripts or tests where only the exit status matters.
> **Verification status:** The commands and behavioral descriptions in this file were checked against current/official documentation where practical. Where a handwritten example differs from current behavior, the corrected behavior is stated explicitly so this file can be used independently.

