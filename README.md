# Incus static/portable binaries build helper
`sincus` is a Makefile-based [Incus](https://github.com/lxc/incus) static binaries build helper. It works by creating a sane environment (through debootstrap), installing all necessary build tools and downloading & compiling all Incus C/C++ dependencies statically. The Incus repository is then mirrored, and Golang binaries statically built against the aforementioned static libraries.

## Usage
Just type the following commands at the shell prompt (on an Ubuntu system):

    $ git clone https://github.com/pyke369/sincus
    $ cd sincus
    $ sudo make build

The resulting static binaries (stripped and compressed) can be found in the `sincus` directory.
```
$ ls -l sincus
-rwxr-xr-x 1 root root  2732684 May  9 10:00 fuidshift
-rwxr-xr-x 1 root root  6433640 May  9 10:00 incus
-rwxr-xr-x 1 root root 11264408 May  9 10:00 incus-agent
-rwxr-xr-x 1 root root  4773968 May  9 10:00 incus-benchmark
-rwxr-xr-x 1 root root 20503208 May  9 10:00 incusd
-rwxr-xr-x 1 root root  5286288 May  9 10:00 incus-migrate
-rwxr-xr-x 1 root root  4163476 May  9 10:00 incus-simplestreams
-rwxr-xr-x 1 root root  4754096 May  9 10:00 incus-user
-rwxr-xr-x 1 root root  7402956 May  9 10:00 lxc-to-incus
-rwxr-xr-x 1 root root  4776916 May  9 10:00 lxd-to-incus
```

They may be copied to any remote system without worrying about dependencies.

## License
MIT - Copyright (c) 2024 Pierre-Yves Kerembellec
