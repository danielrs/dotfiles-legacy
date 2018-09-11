## Install required drivers

```
sudo mhwd -a pci free 0300
```

## Services to enable

Some services need to be enabled after installing the packages:

```
sudo systemctl enable bluetooth
sudo systemctl enable devmon@${USER}
sudo systemctl enable NetworkManager
sudo systemctl enable ntpd
sudo systemctl enable tlp
```

## Installing docker

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