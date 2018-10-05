### Install required drivers

```
sudo mhwd -a pci free 0300
```

### Disable computer bell

Some computers produce annoying sounds using the built-in bell, disable it by adding `blacklist pcspkr` to `/etc/modprobe.d/blacklist.conf'.

### Services to enable

Some services need to be enabled after installing the packages:

```
sudo systemctl enable bluetooth
sudo systemctl enable devmon@${USER}
sudo systemctl enable NetworkManager
sudo systemctl enable ntpd
sudo systemctl enable tlp
```

### Installing docker

It is sometimes helpful to change the docker directory to somewhere else
(like to a drive with more space). Change the following line at
`/etc/docker/daemon.json`:

```
{
    //...
    "graph": "/mnt/docker",
    //...
}
```

### Minikube + KVM


```
sudo pacman -Sy
sudo pacman -S libvirtd qemu-headless ebtables dnsmasq
sudo systemctl enable libvirtd.service
sudo systemctl enable virtlogd.service
sudo pacman -S docker-machine
yaourt -S minikube-bin kubectl-bin
yaourt -S docker-machine-driver-kvm2
```
