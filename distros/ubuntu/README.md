## Installation

Run the install script:

    ./install

And don't forget to:

* Install your graphics driver.
* Configure Redshift so it autostarts (startup apps, etc).

## 3rd Party Installations

### Java

While OpenJDK is good for Java development, some frameworks still work better with Oracle JDK.

### Enable SSD Optimizations

Set the swappiness and enable TRIM. Check the link for more information:

https://www.leaseweb.com/labs/2013/07/5-crucial-optimizations-for-ssd-usage-in-ubuntu-linux/

### VPN

Use network manager to set OpenVPN profiles. It is compatible with the kernel killswitch provided by the ufw script in these dotfiles.
