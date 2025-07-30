# Mount lustre in a container
## host system specifics in this test
- rhel 9.6 running kernel 5.14.0-570.30.1.el9_6.x86_64

## example mount on host
`mkdir -p /tmp/test`
`mount -t lustre -o defaults,_netdev 12.34.56.78:/test /tmp/test`

## build image
`podman build --tag centos9 --file Containerfile --network=host .`

## create container
`podman run -itd --name centos9 --user 1234:1234 -v /tmp/test:/tmp/test localhost/centos9`
`podman exec -it centos9 bash`
