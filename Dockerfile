FROM scratch

ENV year 2015
ENV month 04
ENV mirror http://mirrorservice.org/sites/ftp.archlinux.org/iso

MAINTAINER Joe Harrison <joehazzers@gmail.com>

ADD ${mirror}/${year}.${month}.01/archlinux-bootstrap-${year}.${month}.01-x86_64.tar.gz /archlinux-bootstrap.tar.gz

ADD files/ /docker

RUN ["/docker/tar","-I","/docker/gzip","-xf","archlinux-bootstrap.tar.gz","-X","/docker/exclude","--strip-components=1"]

RUN ["/usr/bin/bash","/docker/install.sh"]

