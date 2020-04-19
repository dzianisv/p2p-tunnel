![Go](https://github.com/dzianisv/p2p-tunnel/workflows/Go/badge.svg)

# Flow

`ssh` --- `connect()`---> `p2p-tunnel client` ---- negotiation ----> `p2p-tunnel server` -- `connect()` --> `ssh`

# Backend protocol

- RTCDataChannel/WebRTC: https://github.com/pions/webrtc
- signaling server: https://nobo-signaling.appspot.com/

  src: [signaling/gae](https://github.com/nobonobo/p2p-tunnel/signaling/gae)

# Usage

## server side

```sh
KEY=$(p2p-tunnel newkey)
p2p-tunnel server -key=$KEY -addr=127.0.0.1:22
```

share $KEY value to client side

## client side

```sh
p2p-tunnel client -key=$KEY -addr=127.0.0.1:2222
```

## client side other terminal

```sh
$ ssh -p 2222 127.0.0.1
```