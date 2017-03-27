## Installation

Run the install script:

    ./install

## Post-install

* Install your graphics driver.
* Configure Redshift so it autostarts (startup apps, etc).

### 3rd party packages

Not available in ubuntu by default:

* Oracle Java: https://launchpad.net/~webupd8team/+archive/ubuntu/java
* Atom: https://launchpad.net/~webupd8team/+archive/ubuntu/atom
* Google Chrome: https://www.google.com/chrome/browser/desktop/

### Development tools installation

### nvm

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

#### KVM (Android SDK Avd)

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
