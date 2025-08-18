# init environment

## essential packages

- essential

```sh
sudo apt install build-essential cmake cmake-gui doxygen doxygen-gui libboost-all-dev git neovim
```

- [optional] latest clang

  ```shell
  sudo apt install clang-15 clang-tools-15
  ```
  



## Console font[mint]

Terminal -> Preference
Profile -> Edit

1. General -> Text Appearance -> Custom font -> 13
2. Scrolling -> Limit scrollback -> check out



## vim

use **neovim** instead of vim.


### caps lock -> ESC[ubuntu]

```sh
setxkbmap -option caps:swapescape
```

or install Gnome tweak tool. Linux mint can edit key with OS default tool.

### Compiler

Change compiler from GCC to Clang, write following setting in your .bashrc
```
export CXX=clang++
alias make='make -j'
```

### Lazyvim

- change `s` keymap to default functionality

  - go to `.config/nvim/lua/plugins/`

  - make `keymap.lua`

  - copy following config
    ```
    return {
      {
        "folke/flash.nvim",
        keys = {
          { "s", mode = { "n", "x", "o" }, false },
        },
      },
    }
    ```

    

## Input Method

**Use fcitx + mozc. If you want to use Alt change**

1. install mozc
  ```
  sudo apt isntall mozc
  ```

2. Fix non-complete language setting

3. Type following command
  ```
  im-config -n fcitx
  ```

4. reboot

5. use fcitx-configtool to set Alt-change
    in linuxmint, keyboard -> layout -> option



## Disable trackpad and Mouse faster

1. Setting Mouse & Touchpad
2. Mouse faster
check id of trackpoint

```
xinput --list --short
```

check id of speed in trackpoint
and here, 13 is id which you check avobe.

```
xinput --list-props 13
```

set speed
here, 13 is trackpoint id, 327 is speed id and 0.85 is a speed
```
input --set-prop 13 327 0.85
```

3. Touchpad off

4. Terminal cursor repeat speed
keyboard -> typing -> repeat delay shortest & repeat speed fastest

### Another trackpoint speed config

If you use Ubuntu20.04(Linux mint uma) on Thinkpad X1 Carbon gen 6
you can find configuration file of trackpoint

```
sudo vim /usr/share/libinput/50-system-lenovo.quirks
```

You can change following value

```
[Trackpoint Override]
MatchUdevType=pointingstick
MatchName=*TPPS/2 Elan TrackPoint*
AttrTrackpointMultiplier=2.0  # Higher is Faster
```

After rebooting, configuration is applied.


## Keep screen on

1. Setting Brightness & Lock

2. Turn screen off : Never

   

### Nvidia proprietary driver(GPGPU and DeepLearning)

see [driver_and_cuda](https://developer.nvidia.com/cuda-downloads?target_os=Linux&target_arch=x86_64&Distribution=Ubuntu&target_version=24.04&target_type=deb_network) or retrieve `ubuntu cuda install`.

Don't forget you need nvidia driver and cuda.

see [here](http://gihyo.jp/admin/serial/01/ubuntu-recipe/0454?page=2)
when reboot, **you mast enroll the key**.
After installation, try following command.

```shell
nvidia-smi
```

And then, If you find no error, the installation is complete successfully.

### Vimix theme

Download from gnome vimix, Vimix-dark, Vimix-icons and install.
Install gnome-tweak-tools.
Set Appearance/Themes/Applications -> Vimix-Dark
Set Appearance/Themes/Icons -> Vimix 



## Time data (ntp)

Certain environment provides wrong time server, Although I don't know correct solution, displaying correct data time is possible using following command.

```
timedatectl set-timezone UTC
```



## Github

### ssh

```
cd ~/.ssh
ssh-keygen -t rsa # tyep ENTER key three times
```

upload the key into [GitHub](https://github.com/settings/ssh)



### config

```
git config --global user.email "you@example.com"
git config --global user.name "Your Name"
```



## Other software

- joplin (snap package)
- vscode 
