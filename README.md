# gost-docker

**gost-docker** is a docker wrapping of [ginuerzh/gost](https://github.com/ginuerzh/gost) with the image size of only 15MB.  All you need to do is prepare a docker host and *docker run* on it.

Visit  [ginuerzh/gost](https://github.com/ginuerzh/gost) for details.



# Docker Installation

You can install docker daemon with the following command:

```
curl -s https://get.docker.com | sh
```

and start docker daemon like this in CentOS or Amazon Linux

```
service docker start
```

or like this in ubuntu or debian Linux

```
/etc/init.d/docker start
```



# Examples

create shadowsocks server and client

```
// shadowsocks server
docker run -d -p 443:443  pahud/gost-docker gost -logtostderr -v 4 -L=ss://aes-256-cfb:123456@:443

// shadowsocks client(running with --net=host is recommended)
// please note this will share the networking interface with the host
// and -L=:8080 will listen on *ALL* interfaces on this host, 
// use -L=127.0.0.1:8080 if you want to listen on localhost only
docker run -d -p 8080 --net=host pahud/gost-docker gost -logtostderr -v 4 -L=:8080 -F=ss://aes-256-cfb:123456@<server_ip>:443

// try with cURL
curl -x 127.0.0.1:8080 https://myip.today
```



create http_proxy on loalhost of Mac OS X, tunneling to remote shadowsocks server and make it always restart unless stopped manually.

```
docker run --restart=unless-stopped -d -p 8080:8080 pahud/gost-docker gost -logtostderr -v 4 -L=:8080 -F=ss://aes-256-cfb:<password>@<ss_host>:<ss_port>
```





## aws-cli with https_proxy

```
// let aws-cli go via HTTPS_PROXY
# alias the aws cmd or set in your ~/.bash_profile
$ alias aws='HTTPS_PROXY=http://127.0.0.1:8080 /usr/local/bin/aws'
```



## docker pull via http_proxy in centos7

add the following line in **[Service]** directive in ***/usr/lib/systemd/system/docker.service***

```
Environment='http_proxy=127.0.0.1:8080'
```

reload and make sure the config is active

```
# sudo systemctl daemon-reload
# sudo systemctl show docker --property Environment
Environment=http_proxy=127.0.0.1:8080
```

restart docker daemon

```
$ sudo service docker restart
```

(remember to start the gost-docker in server mode again, as restarting docker will stop all running docker containers)

try docker pull again like this

```
docker pull ubuntu
```

and this should be working now.

[Let me know](https://github.com/pahud/gost-docker/issues) if you have more working examples.
