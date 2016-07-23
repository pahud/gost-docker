# gost-docker

visit [ginuerzh/gost](https://github.com/ginuerzh/gost) for usage details



# examples

create shadowsocks server and client

```
// shadowsocks server
docker run -d -p 443:443  pahud/gost-docker gost -logtostderr -v 4 -L=ss://aes-128-cfb:123456@:443

// shadowsocks client
docker run -d -p 8080:8080 pahud/gost-docker gost -logtostderr -v 4 -L=:8080 -F=ss://aes-128-cfb:123456@<server_ip>:443

// try with cURL
curl -x 127.0.0.1:8080 https://myip.today
```


