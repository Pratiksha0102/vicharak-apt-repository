# Vicharak Debian/Ubuntu APT Repository

This repository contains the Linux packages for Vicharak Debian and
Ubuntu based systems.

## Installation

To install Vicharak APT onto your ARM64 Debian/Ubuntu distro, run the following
commands:

```bash
wget -qO - http://apt.vicharak.in/pgp-key.public | sudo apt-key add -
```

or

```bash
curl -sSL http://apt.vicharak.in/pgp-key.public | sudo apt-key add -
```

Then add the apt repository to your `/etc/apt/sources.list` file:

```bash
echo "deb http://apt.vicharak.in stable main" | sudo tee -a /etc/apt/sources.list
```

Then run the following commands:

```bash
sudo apt update
```

## Packages

The following packages are available in this repository:

* [vicharak-config](http://github.com/vicharak-in/vicharak-config)
* [vicharak-firmware](http://github.com/vicharak-in/vicharak-firmware)
* [vicharak-kernel-image](http://github.com/vicharak-in/linux-kernel)
* [vicharak-kernel-headers](http://github.com/vicharak-in/linux-kernel)
* [vicharak-kernel-libc](http://github.com/vicharak-in/linux-kernel)
* [vicharak-u-boot](http://github.com/vicharak-in/u-boot-vicharak)

## License

The packages in this repository are licensed under the [MIT License](LICENSE).
