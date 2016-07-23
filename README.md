# gost-docker

visit [ginuerzh/gost](https://github.com/ginuerzh/gost) for usage details





# examples

create shadowsocks server and client

```
// shadowsocks server
docker run -ti -p 8338:8338 --rm pahud/gost-docker gost -logtostderr -v 4 -L=ss://aes-128-cfb:123456@:8338

// shadowsocks client
docker run -ti  -p 8080:8080  --rm pahud/gost-docker gost -logtostderr -v 4 -L=:8080 -F=ss://aes-128-cfb:123456@<server_ip>:8338
```


