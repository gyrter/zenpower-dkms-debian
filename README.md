# Zenpower driver (DKMS version) for Debian

This is a Debian DKMS package version of the latest code of [Zenpower3 module for AMD CPU](https://git.exozy.me/a/zenpower3)

This repo was inspired by [e1000e-dkms](https://github.com/koljah-de/e1000e-dkms-debian)

---

## Prerequisites
**Dependency:** dkms

You should have installed: linux-headers dkms build-essential
```
apt install linux-headers-$(uname -r) dkms build-essential
```

---

## Install and build the deb package

To install the deb package run:
```
dpkg -i zenpower-dkms_<x.x.x>_all.deb
```

To remove the driver run:
```
apt purge zenpower-dkms
```

To build a deb package from source run:
```
dpkg-deb --build zenpower-dkms
```

---

## Install and build the DKMS kernel module only

If you want to use the DKMS kernel module only (works with all Linux distributions) run:
```
cp -r zenpower-dkms/usr/src/zenpower-<x.x.x> /usr/src/
dkms add -m zenpower -v <x.x.x>
dkms build -m zenpower -v <x.x.x>
dkms install -m zenpower -v <x.x.x>
```

To remove the DKMS kernel module only (works with all Linux distributions) run:
```
dkms remove -m zenpower -v <x.x.x> --all
```

---

## Use zenpower instead of k10temp

Because zenpower is using same PCI device as k10temp, you have to disable k10temp first.

1. Check if k10temp is active. `lsmod | grep k10temp`
2. Unload k10temp `sudo modprobe -r k10temp`
3. (optional*) blacklist k10temp: `sudo bash -c 'sudo echo -e "\n# replaced with zenpower\nblacklist k10temp" >> /etc/modprobe.d/blacklist.conf'`
4. Activate zenpower `sudo modprobe zenpower`

**If k10temp is not blacklisted, you may have to manually unload k10temp after each restart.**

---

## Changelog

**Changelog for 0.2.1**

* Clone master from upstream
* Patch dkms.conf
