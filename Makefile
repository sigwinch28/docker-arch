YEAR=2015
MONTH=04

ARCH=x86_64
TAG=archlinux:$(YEAR).$(MONTH)

MIRROR_URL=http://mirrorservice.org/sites/ftp.archlinux.org
ISO_PATH=$(MIRROR_URL)/iso/$(YEAR).$(MONTH).01
BOOTSTRAP=archlinux-bootstrap-$(YEAR).$(MONTH).01-$(ARCH).tar.gz

ROOT_DIR=root.$(ARCH)/

.PHONY: all clean container

default: all

all: container

clean:
	-chmod u+w $(ROOT_DIR)/etc/ca-certificates/extracted/cadir/*
	-rm -rf $(ROOT_DIR)
	-rm -rf $(BOOTSTRAP)

$(BOOTSTRAP):
	curl -O -J -L $(ISO_PATH)/$@

$(ROOT_DIR): | $(BOOTSTRAP)
	tar -zxvf $(BOOTSTRAP)

container: Dockerfile install.sh mirrorlist $(ROOT_DIR)
	docker build --tag=$(TAG) --file=Dockerfile .

