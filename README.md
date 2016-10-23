## DanielRS' dotfiles

### Before reading:

These are my *personal* **dotfiles**, they *may* or *may not* work for you.

We will refer to each folder in the root directory of the repository as a **dotfile**

### What's included?

Configuration files and scripts, check each **dotfile** to see what's included in each one of them.

### How are the folders structured?

The root folder contains the **dotfiles** and the script `dotpkg` for installing the dotfiles. The command:

`dotpkg install`

Iterates over each **dotfile** and executes its installation script (if any). And the command:

`dotpkg login`

Executes after each login; it iterates over each **dotfile** and adds the  `bin` folder (if present) to the `PATH`.

#### dotfile

Each **dotfile** can *optionally* contain another `dotpkg` script, and a `bin` folder:

1. **dotpkg**
	A script for performaning any required preparations before installation. This script is also responsible for creating the appropiate symlinks.

2. **bin/**

	A folder that can contain scripts and executables that are added to environment PATH by `dotpkg login`.

The structure of other files is not predefined.

### How to install?

**Backup** *any of your files, the install script will overwrite any conflicting configuration!*

Clone (or download) the repository, `cd` into it, and run the install scripts:

```
$ cd ~/
$ git clone https://github.com/DanielRS/dotfiles.git .dotfiles
$ cd .dotfiles
$ ./dotpkg install
```

After that log out and log back in.

### Current setup
http://imgur.com/fTHe2ds

![setup screenshot][screenshot]

---

**Note**: Any of the structre is subject to change.

[screenshot]: http://imgur.com/fTHe2ds.png
