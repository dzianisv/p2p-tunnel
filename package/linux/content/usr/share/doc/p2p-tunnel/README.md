# Configuration

## The server peer configuration
```sh
cp /usr/share/doc/p2p-tunnel/ssh.server /etc/p2p-tunnel/
# Edit the configuration file, put a key. The key can be generated by `p2p-tunnel newkey`
vi /etc/p2p-tunnel
systemctl enable p2p-tunnel@ssh.server
systemctl start p2p-tunnel@ssh.server
systemctl status p2p-tunnel@ssh.server
```

## The client peer configuration
```sh
cp /usr/share/doc/p2p-tunnel/ssh.client /etc/p2p-tunnel/
# Edit the configuration file, put the key that was used for the server peer configuration
vi /etc/p2p-tunnel
systemctl enable p2p-tunnel@ssh.client
systemctl start p2p-tunnel@ssh.client
systemctl status p2p-tunnel@ssh.client
```