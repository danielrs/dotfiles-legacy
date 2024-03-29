## Installation

Run the install script:

    ./install

## Post-install

* Install Graphics Driver
* Configure Redshift so it autostarts (startup apps, etc).

### Uninstall and Disable Grub

If you are using a different bootloader (such as rEFInd). You can uninstall grub:

```
sudo apt-get purge --auto-remove grub*
```

Aditionally, some updates are gonna try to install it again during some
dist-upgrades, make sure to disable grub temporarily by using:

```
sudo apt-mark hold grub* grub*:i386
```

### Development tools installation

#### JDK

Install the default one (OpenJDK):

```
sudo apt-get install default-jdk
```

Or Oracle JDK:
https://launchpad.net/~webupd8team/+archive/ubuntu/java

#### nvm

https://github.com/creationix/nvm

Manual install is as follows:

```
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/creationix/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
) && . "$NVM_DIR/nvm.sh"
```

Remember to add the source to one of your bash files for automatic sourcing at login:

```
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
```

#### SDKMAN!

http://sdkman.io/install.html

Install to custom location:

```
export SDKMAN_DIR="$HOME/.sdkman" && (
  curl -s "https://get.sdkman.io" | bash
)
```

#### Go

https://golang.org/doc/install

If it was installed to a custom location, add `GOROOT` to the environment
variables along with the `bin` folder:

```
export GOROOT="$HOME/.golang"
export PATH="$GOROOT/bin:$PATH"
```

#### Rust

https://www.rustup.rs/

```
curl https://sh.rustup.rs -sSf | sh
```

#### Haskell

https://docs.haskellstack.org/en/stable/README/

```
curl -sSL https://get.haskellstack.org/ | sh
```

#### Amazon Web Services tools

Using Python 3 venv:

```
python3 -m venv ~/.awscli-venv
source ~/.awscli-venv/bin/activate
pip install --upgrade pip
pip install --upgrade awscli awsebcli
```

#### Docker and Docker compose

https://docs.docker.com/engine/installation/linux/ubuntu/
https://docs.docker.com/compose/install/

Change docker storage folder:

http://stackoverflow.com/questions/24309526/how-to-change-the-docker-image-installation-directory

Or for systemd:

https://docs.docker.com/engine/admin/systemd/

#### KVM (Android SDK Avd)

Detailed instructions [here](https://help.ubuntu.com/community/KVM/Installation).

```
sudo apt-get install qemu-kvm libvirt-bin ubuntu-vm-builder bridge-utils
```

And add user to the kvm and libvirtd groups:

```
sudo usermod -a -G kvm [USER_NAME]
sudo usermod -a -G libvirtd [USER_NAME]
```

### Restore public SSH keys from private keys

Copy the private key to the `~/.ssh` repo and set the permissions to `400`. Then use
the following command to generate a public key from a private one:

```
ssh-keygen -y -f [PRIVATE-KEY] > [PUBLIC-KEY]
```

### Enable SSD Optimizations

Set the swappiness and enable TRIM. Check the link for more information:

https://www.leaseweb.com/labs/2013/07/5-crucial-optimizations-for-ssd-usage-in-ubuntu-linux/

### VPN

Use network manager to set OpenVPN profiles. It is compatible with the kernel killswitch provided by the ufw script in these dotfiles.

Check here:
https://www.privateinternetaccess.com/forum/discussion/18003/openvpn-step-by-step-setups-for-various-debian-based-linux-oss-with-videos-ubuntu-mint-debian

### Troubleshooting

#### URxvt

The default .desktop entry can be changed to get a better behaviour from urxvt.
Edit the file `/usr/share/applications/rxvt-unicode.desktop` and make the
following changes:

* Change the `Icon` value to `utilities-terminal` for a better icon.
* Create the new key-value pair `StartupWMClass=urxvt`. this will enable DEs
to associate any urxvt instance with the desktop file.
