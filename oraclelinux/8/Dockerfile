FROM oraclelinux:8
MAINTAINER Bert Van Vreckem <bert.vanvreckem@gmail.com>
ENV container docker

# Install systemd -- See https://hub.docker.com/_/centos/
# FIX: systemctl: error while loading shared libraries: libsystemd-shared-239.so: cannot open shared object file: No such file or directory
# yum -y install systemd-239-13.0.1.el8.i686
RUN \
    yum -y install systemd-239-13.0.1.el8.i686 ; \
    (cd /lib/systemd/system/sysinit.target.wants/ || exit; for i in *; do [ "$i" = systemd-tmpfiles-setup.service ] || rm -f "$i"; done); \
    rm -f /lib/systemd/system/multi-user.target.wants/*; \
    rm -f /etc/systemd/system/*.wants/*; \
    rm -f /lib/systemd/system/local-fs.target.wants/*; \
    rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
    rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
    rm -f /lib/systemd/system/basic.target.wants/*; \
    rm -f /lib/systemd/system/anaconda.target.wants/*; \
    systemctl mask dev-mqueue.mount dev-hugepages.mount \
      systemd-remount-fs.service sys-kernel-config.mount \
      sys-kernel-debug.mount sys-fs-fuse-connections.mount \
      systemd-logind.service getty.service getty.target; \
    yum -y upgrade; \
    rpm -i https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm; \
    yum -y install git tar sudo ansible libselinux-python3 iproute python3-netaddr; \
    yum clean all; \
    sed -i -e 's/^\(Defaults\s*requiretty\)/#--- \1/'  /etc/sudoers; \
    echo -e '[local]\nlocalhost ansible_connection=local' > /etc/ansible/hosts; \
    echo -e '[defaults]\nretry_files_enabled = False' > /etc/ansible/ansible.cfg


VOLUME ["/sys/fs/cgroup"]
CMD ["/usr/sbin/init"]
