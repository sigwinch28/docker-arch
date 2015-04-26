LANG=C.UTF-8

# packages to ignore for space savings
PKGIGNORE=(
    cryptsetup
    device-mapper
    dhcpcd
    iproute2
    jfsutils
    linux
    lvm2
    man-db
    man-pages
    mdadm
    nano
    netctl
    openresolv
    pciutils
    pcmciautils
    reiserfsprogs
    s-nail
    systemd-sysvcompat
    usbutils
    vi
    xfsprogs
)
IFS=','
PKGIGNORE="${PKGIGNORE[*]}"
unset IFS

# Pacman Keys
pacman-key --init
pacman-key --populate archlinux

# Mirrors
/docker/mirrors.pl /etc/pacman.d/mirrorlist

# System upgrade
pacman --noconfirm -Syu

# Installation packages
pacman --noconfirm -S expect

# Partial base install
expect <<EOF
	set send_slow {1 .1}
	proc send {ignore arg} {
		sleep .1
		exp_send -s -- \$arg
	}
	set timeout 60

	spawn pacman -S base --needed --ignore $PKGIGNORE
	expect {
		-exact "anyway? \[Y/n\] " { send -- "n\r"; exp_continue }
		-exact "(default=all): " { send -- "\r"; exp_continue }
		-exact "installation? \[Y/n\]" { send -- "y\r"; exp_continue }
	}
EOF

# Locales
echo "en_GB.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen

# Clean pacman
expect <<EOF
	set send_slow {1 .1}
	proc send {ignore arg} {
		sleep .1
		exp_send -s -- \$arg
	}
	set timeout 60

	spawn pacman -Scc
	expect {
		-exact "ALL files from cache? \[y/N\] " { send -- "y\r"; exp_continue }
		-exact "unused repositories? \[Y/n\] " { send -- "y\r"; exp_continue }
	}
EOF
