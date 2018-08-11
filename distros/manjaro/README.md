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
