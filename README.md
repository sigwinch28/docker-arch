# docker-arch
## The power of shipping shipping containers in shipping ships through arches... today!

An Arch Linux container for Docker built entirely using the bootstrap archives
provided by the Arch Linux project, without requiring explicit root access
that other methods which use pacstrap require. Only docker access is
required.

## Requirements

* docker
* curl
* tar (+gzip)
* make (not sure about GNU dependencies, though)

## TODO

* signature + checksum verification on downloaded bootstrap archive
* automatic date detection fallback
* set variables as defaults only in Makefile
* use mirrorlist from bootstrap archive rather than a manually supplied one
    (no `sed` available before install of `base`, so `perl` should be used
    for regexes)

## License & Copyright

Copyright 2015 Joe Harrison

This work is licensed under the MPL 2.0. See LICENSE for details.

Arch Linux and Docker are trademarks of their respective owners.
