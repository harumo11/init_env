# init environment

## opt

- doxygen-bootstrapped
- opencv 
- opencv-contirve

## essential packages

```sh
sudo apt install build-essential cmake cmake-gui doxygen doxygen-gui libboost-all-dev git
```

## Console font

Terminal -> Preference
Profile -> Edit

1. General -> Text Appearance -> Custom font -> 13
2. Scrolling -> Limit scrollback -> check out

## vpn

| ITEM            | SETTING           |
| --------------- | ----------------- |
| connection name | tut_vpn           |
| Gateway         | gw.vpn.tut.ac.jp/ |

## vim

use **neovim** insted of vim.

read how to install in [public document](https://github.com/neovim/neovim/wiki/Installing-Neovim) , if you want to use youcompleteme.

- **vundle** (Not dein package manager)

- youcompleteme

- ycm-generator

- neosnippet

- neosnippet-snipets

- DoxygenToolKit

- lightline

### YouCompleteMe

In order to std header completion for cpp. put following command into your ycm_extra_conf.py

**You don't have to use some customized ycm-extra-conf.py. Just add path with "'-I/opt/ros/modeloic/include/"**

```
BASE_FLAGS = [
         '-Wall',
         '-Wextra',
         '-Werror',
         '-Wno-long-long',
         '-Wno-variadic-macros',
         '-fexceptions',
         '-ferror-limit=10000',
         '-DNDEBUG',
         '-std=c++14',
         '-xc++',
         '-I/usr/lib/',
         '-I/usr/include/',
         '-I/opt/ros/melodic/include/'
         ]

```




### caps lock -> ESC

```sh
setxkbmap -option caps:swapescape
```

### Compiler
Use LLVM Clang (Faster than GCC)
```
  sudo apt install llvm clang
```
Change compiler from GCC to Clang, write following setting in your .bashrc
```
export CXX=clang++
alias make='make -j'
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
xinput --list --shotr
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

## Keep screen on

1. Setting Brightness & Lock
2. Turn screen off : Never

## Move HOME directory and change name

set path to the HOME directories into the config file.

```sh
vim ~/.config/user-dirs.dirs
```

## Enable workspace

1. All setting
2. Setting Appearance
3. Enable workspace

## Show Menu Bar in window

1. All setting
2. Appearance
3. Show the menus for a window -> In the window's title bar

## Qt

Look Qt public web pages.

## OpenCV 4.x

Take opencv and contrive packages form **GITHUB**.

set where is a source code : `~/opt/opencv/`

set where is a build the binaries : `~/opt/opencv/build/`

| SWITCH            | ON/OFF                       |
| ----------------- | ---------------------------- |
| WITH_TBB          | ON                           |
| WITH_V4L          | ON                           |
| WITH_QT           | ON                           |
| EXTRA_MODULE_PATH | ~/opt/opencv_contrib/modules |

## chrono

chrono is a physics simlator lib for c++. It's designed modern library.

get the source code from master branch

```sh
git clone https://github.com/projectchrono/chrono/tree/master
```

Download and compile Irrlicht library upper v.1.8.2

```
cd ~/opt/irrlicht-1.8.2/source/Irrlicht
make sharedlib
sudo make install
```

```
cd ~/opt/irrlicht-1.8.2/source/Irrlicht
make sharedlib
sudo make install
```

Compile chrono

```
cd ~/opt/chrono
mkdir build
cd build
cmake-gui ../
```

set the path of **build** directory.
On cmake-gui, set the path as fellows.
Where to build the binaries -> /home/robot/opt/chrono/build

press configure
set two modules as below.

- ENEBLE_MODULEIRRLICHT
- ENEBLE_MODULE_POSTPROCESS

press configure
and if nessesarry.

- Set the CH_IRRLICHTDIR = ~/opt/irrlicht-1.8.2/
- Set the CH_IRRLICHTLIB = ~/opt/irrlicht-1.8.2/lib/Linux/Irrlicht.so

press configure
press generate

```
make 
sudo make install
```

if get **relocation R_X86_64_32S** error.
you should get really new irrlicht library

### Nvidia proprietary driver(GPGPU and DeepLearning)

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

