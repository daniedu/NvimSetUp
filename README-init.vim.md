
## Simplifying NeoVim Setup on Windows using init.vim

Here's a simplified guide to get NeoVim running with essential plugins:

**1. Install Node.js:**

-   Download and install the latest Node.js from  [https://nodejs.org/en/download](https://nodejs.org/en/download).
-   Verify the installation by typing  `node -v`  in a command prompt.

**2. Install NeoVim:**

-   Open a command prompt as administrator.
-   Run the following command:  `choco install neovim`

This will install the latest NeoVim release for Windows directly through Choco, removing the need for manual download and path configuration.

**3. Install the "plug.vim" Plugin Manager:**

-   Open a command prompt as administrator.
-   Run the following  command:

``` bash
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $HOME/vimfiles/autoload/plug.vim -Force`
```

##   
NeoVim File and Folder Structure( init.vim )

Here's the expected file and folder structure after following the simplified NeoVim setup guide:

```
C:\Users\<username>\AppData\Local\nvim
└───plugged
│       │--- (plugins)
└───init.vim
```

**Explanation:**

-   `C:\Users\<username>\AppData\Local\nvim`: This is the default NeoVim configuration directory.
-   `plugged`: This folder contains all your installed NeoVim plugins. Each plugin will have its own subfolder within  `plugged`.
-   `init.vim`: This file contains your NeoVim configuration settings, including the  `plug#begin`  and  `plug#end`  blocks for managing plugins.
-   `…`: This represents additional plugins you might install, each with its own subfolder within  `plugged`.

**5. Configure NeoVim:**

-   You can further customize NeoVim by editing  `init.vim`.
-   Many online resources and tutorials provide plugin and setting configurations.

**Enjoy using NeoVim!**
