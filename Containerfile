FROM quay.io/centos/centos:stream9

# enable epel repository
RUN dnf config-manager --set-enabled crb \
    && dnf -y install https://dl.fedoraproject.org/pub/epel/epel{,-next}-release-latest-9.noarch.rpm

RUN dnf -y upgrade --refresh

WORKDIR /tmp/

RUN curl "https://downloads.whamcloud.com/public/lustre/lustre-2.15.7/el9.6/client/RPMS/x86_64/lustre-client-dkms-2.15.7-1.el9.noarch.rpm" -o lustre-client-dkms-2.15.7-1.el9.noarch.rpm
RUN curl "https://downloads.whamcloud.com/public/lustre/lustre-2.15.7/el9.6/client/RPMS/x86_64/lustre-client-2.15.7-1.el9.x86_64.rpm" -o lustre-client-2.15.7-1.el9.x86_64.rpm

RUN ls -alh

RUN dnf -y install \
    libblkid-devel \
    libmount-devel \
    libnl3-devel \
    libyaml-devel \
    dkms \
    /tmp/lustre-client-dkms-2.15.7-1.el9.noarch.rpm \
    /tmp/lustre-client-2.15.7-1.el9.x86_64.rpm

RUN dnf clean all && rm -rf /tmp/lustre*
