# Vicharak Debian/Ubuntu APT Repository

This repository contains the Linux packages for Vicharak Debian and
Ubuntu based systems.

## Installation

To install Vicharak APT onto your ARM64 Debian/Ubuntu distro, run the following
commands:

```bash
wget -qO - https://apt.vicharak.in/debian/pgp-key.public | sudo apt-key add -
```

or

```bash
curl -sSL https://apt.vicharak.in/debian/pgp-key.public | sudo apt-key add -
```

Then add the following line to your `/etc/apt/sources.list` file:

```text
deb https://apt.vicharak.in/debian/ stable main
```

Then run the following commands:

```bash
sudo apt update
```

## Packages

The following packages are available in this repository:

* [vicharak-config](https://github.com/vicharak-in/vicharak-config)
* [vicharak-firmware](https://github.com/vicharak-in/vicharak-firmware)
* [vicharak-kernel-image](https://github.com/vicharak-in/linux-kernel)
* [vicharak-kernel-headers](https://github.com/vicharak-in/linux-kernel)
* [vicharak-kernel-libc](https://github.com/vicharak-in/linux-kernel)
* [vicharak-u-boot](https://github.com/vicharak-in/u-boot-vicharak)

## License

The packages in this repository are licensed under the [MIT License](LICENSE).
