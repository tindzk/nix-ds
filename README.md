# Nix for Data Science
As Ubuntu's LTS releases usually do not ship the latest versions, it becomes challenging to set up a clean environment for Data Science. Nix provides us with an easy-to-use alternative without needing to interfere with the host system.

Here, we build a Python 3.5 environment with packages commonly used for Data Science. The packages are defined in `default.nix` instead of using Python's package manager (`pip`).

## Nix
First off, install Nix:

```bash
$ bash <(curl https://nixos.org/nix/install)
$ source ~/.nix-profile/etc/profile.d/nix.sh
```

Finally, add the following line to your shell profile (e.g. `~/.profile`):
```bash
source ~/.nix-profile/etc/profile.d/nix.sh
```

## Building the environment
Clone this repository, change the working directory to it and run the following command:

```bash
$ nix-build
```

Now, instead of using the host's Python tools, you can use the ones from `result/bin/`:

```bash
$ result/bin/python3
$ result/bin/ipython notebook
```

## See also
* [https://www.domenkozar.com/2014/01/02/getting-started-with-nix-package-manager/ Getting started with Nix package manager]
* [http://datakurre.pandala.org/2015/10/nix-for-python-developers.html Nix for Python developers]