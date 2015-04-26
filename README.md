# docker-arch
## The power of shipping shipping containers in shipping ships through arches... today!

An Arch Linux container for Docker built entirely using the bootstrap archives
provided by the Arch Linux project, without requiring explicit root access
that other methods which use pacstrap require. Only docker access is
required.

## Rationale

Other methods for creating base images typically require some external tool.
For Arch Linux, this typically involves the use of `pacstrap` and
`arch-chroot` which typically root access on the machine to operate. On top
of this, they generally require some external build script.

This image is an attempt to create a base Arch Linux image entirely via a
Dockerfile (based upon the `base/scratch` empty image). Unfortunately, as
Docker currently does not support extracting archives from URLs directly, I
had to include binary copies of `gzip` and `tar` to extract the archive to
the appropriate location.

I was planning on using busybox (so I would only require a single executable)
but unfortunately busybox's tar implementation does not have an essential
available option from GNU's tar: `--strip-components`, nor does busybox's
`exclude` option have any effect.

I need to work on compacting the image (or wait for Docker to include some
sort of "squash" or "commit" system to flatten the image and reduce its
size.

The upside is that this image can be automatically built on docker registries,
and has no large binaries (or binaries likely to change) committed to the
repository.

## Requirements

* docker
* curl
* tar (+gzip)
* make (not sure about GNU dependencies, though)

## License & Copyright

### Author

Copyright 2015 Joe Harrison

This work is licensed under the MPL 2.0. See LICENSE for details.

### Trademarks

Arch Linux and Docker are trademarks of their respective owners.

### Binary Software

Binary copies of GNU tar and GNU gzip have been included within the files/
directory. These are statically compiled copies of unmodified source code.
Source for these applications is available from [https://www.gnu.org/](GNU).

The binaries have also been compressed with UPX.

Please consult the version and usage information of these binaries for their
license details.
