# Mount lustre in a container
## host system specifics in this test
- `rhel 9.6` running kernel `5.14.0-570.30.1.el9_6.x86_64`

## note the container lustre version in `Containerfile`
- `lustre-client-2.15.7-1.el9.x86_64`

## mount a test on host
```sh
mkdir -p /tmp/test`
mount -t lustre -o defaults,_netdev 12.34.56.78:/test /tmp/test`
```

## build image
```sh
podman build --tag centos9 --file Containerfile --network=host .
```

## create container
```sh
podman run -itd --name centos9 --user 1234:1234 -v /tmp/test:/tmp/test localhost/centos9`
podman exec -it centos9 bash
ls -al /tmp/test
```
