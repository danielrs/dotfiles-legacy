## DanielRS' dotfiles

### Before reading:

We will refer to each folder in the root directory of the repository as a "dotfile"

### What's included?

Configuration files and scripts, check each dotfile to see what's included in each one of them.

### How are the folders structured?

The root folder contains the dotfiles. The root folder contains two scripts:

1. **bootstrap-install.sh**

	Iterates over each dotfile and executes its installation script (if any)

2. **bootstrap-login.sh**

	Executed at each login. Iterates over each dotfile and executes its login script (if any)

#### dotfile

Each dotfile can *optionally* contain the following files/folders:

1. **bootstrap-install**

	Should install the dotfile

2. **bootstrap-login**

	Executes any commands that the dotfile may need (setting environment variables, etc)

3. **scripts/**

	A folder that can contain scripts that are added to environment PATH *if* present

The structure of other files is not predefined.

### How to install?

Clone the repository, `cd` into it, and run the install scripts:

```
$ cd ~/
$ git clone https://github.com/DanielRS/dotfiles.git .dotfiles
$ cd .dotfiles
$ ./bootstrap-install.sh
```

After that log out and log back in.

---

**Note**: Any of the structre is subject to change.
