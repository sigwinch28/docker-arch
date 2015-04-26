FROM scratch

MAINTAINER Joe Harrison <joehazzers@gmail.com>

ADD "http://mirrorservice.org/sites/ftp.archlinux.org/iso/2015.04.01/archlinux-bootstrap-2015.04.01-x86_64.tar.gz" "/archlinux-bootstrap.tar.gz"

ADD "files/" "/docker"

RUN ["/docker/tar","-I","/docker/gzip","-xf","archlinux-bootstrap.tar.gz","-X","/docker/exclude","--strip-components=1"]

RUN ["/usr/bin/bash","/docker/install.sh"]

