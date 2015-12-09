# Vim Config

Vim config stolen from @neall.

## Setup

You will want a fresh `.vim` folder and `.vimrc`. Enter the following commands:

```
$ cd ~/
$ rm -rf .vim
$ rm .vimrc
```

Now, pull down this repo and rename it:

```
$ git clone git@github.com:secade/vimfiles.git
$ mv vimfiles .vim
```

Now we want to create a symlink so that vim will pick up the appropriate file in place of `.vimrc`:

```
$ ln -s .vim/vimrc .vimrc
```

Lets check to make sure it was created appropriately:

```
$ ls -la
```

should return: `.vimrc -> .vim/vimrc` in the printout.

Now enter the directory:

```
$ cd .vim
```

We want to prepare our submodules:

```
$ git submodule init
$ git submodule update
```

This should initiate all the submodules that are needed to run this config.
