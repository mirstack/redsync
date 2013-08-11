# redsync - Redis backed synchronization.

Package provides `redpush` and `redpulld` tools that can be used to quickly and easily
synchronize number of nodes. Provided tools run at top of Redis' PUB/SUB channels.

## Installation

To install `redsync` go to [releases][releases] page and pick latest package. Download
it and unpack with desired prefix:

    $ unzip -d /usr/local redsync-*.zip

[releases]: https://github.com/mirstack/redsync/releases

### Installing from source

To install package from sources you need to have few dependencies installed first. Install
**python 2.6 or higher**, **pip 1.0 or higher** and **bash 4.0 or higher** on your machine,
then run the following:

    $ make deps
    $ ./configure --prefix=/usr/local
    $ make install
    
## Usage

...

## Hacking

If you wanna hack on `redsync` just clone the repo and play with the code. You can run tests
with `test` target:

    $ make test

### Releasing

To build a new release use bundled make target called `pack`:

    $ make pack

It will wrap the binary and other needed files into a zip archive and save
it to `pkg/redsync-x.y.z-{os}-{arch}.zip`.

## Contribute

1. Fork the project.
2. Write awesome code (in a feature branch).
3. Test, test, test...!
4. Commit, push and send Pull Request.
