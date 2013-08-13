# redsync 

[![Build Status](https://travis-ci.org/mirstack/redsync.png?branch=master)](https://travis-ci.org/mirstack/redsync)

**Redis backed synchronization.**

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

    $ ./configure --prefix=/usr/local
    $ make deps
    $ make install
    
Run `install-man` instead of `install` if you want to have man pages installed as well.
    
## Usage

The tool is very simple and done in UNIX way. It's meant to be glued with existing
tools like `tail` and `echo` in order to work. For example, to start new pull server
subscribed to specified channel run:

    $ redpulld example.com 6379 hello

This will connect to Redis PUB/SUB running at `example.com` on standard port `6379`
and subscribe to `hello` channel. Now to notify that subscriber, run:

    $ echo "hello this is my message" | redpush example.com 6379
    
This one will send `this is my message` packet to `hello` channel, which further will
notify all the subscribers. You can connect `redpush` with whatever other tool, as it
takes packet to send from standard input. Accepted format must be always:

    CHANNEL MESSAGE\n
    
Each packet has only one line.

### Security and authentication

There's none! This tool is meant to be as simple as possible and is used internally
within well protected virtual private cloud, thus it doesn't deal with any kind of
authentication. Redis instance that works as a broker is also protected by not being
accessible from the outside world.

## Hacking

If you wanna hack on `redsync` just clone the repo and play with the code. 

### Testing

You can run tests with `test` target, but before you must start local redis server
on default port `6379`. When your server is up, run the following command:

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
