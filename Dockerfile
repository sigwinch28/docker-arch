FROM scratch

MAINTAINER Joe Harrison <joehazzers@gmail.com>

ADD "root.x86_64/" "/"

ADD "mirrorlist" "/etc/pacman.d/mirrorlist"

ADD "install.sh" "/tmp/"

RUN ["/usr/bin/bash","/tmp/install.sh"]

