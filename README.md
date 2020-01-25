# Terminal setting
## zsh/oh-my-zsh
```bash
sudo apt install zsh git fonts-powerline
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" # installs oh-my-zsh
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

Change .zshrc
```bash
ZSH_THEME="powerlevel9k/powerlevel9k"
```


## vim/tmux
### vim setup
```bash
sudo apt install vim vim-gnome tmux
sudo apt install xclip # for clipboard share
sudo apt install ctags # for tagbar
sudo apt install build-essential cmake python3-dev clangd-9 # for YouCompleteMe
sudo apt install php # for tagbar-markdown
sudo apt install latexmk # for vimtex
sudo apt install tilda # terminal that I use
```
* Copy .vimrc, .tmux.conf, .tmux.conf.local to your home directory
* Install vim-plug 
```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
- Launch vim and run :PlugInstall

#### YouCompleteme
```bash
cd ~/.vim/plugged/YouCompleteMe
python3 install.py --clangd-completer
```

#### vimtex
- In vim, type :VimtexCompile or press <F5> to make pdf file


### tmux plugin manager 
```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
- prefix + I: install new plugins and refress tmux 
- prefix + U: update plugins

## cifs-utils for smb
```bash
sudo apt install cifs-utils
```

## pandoc
```bash
sudo apt install pandoc texlive
```
- Anaconda also has pandoc
- Running pandoc
    - You can run the command below or press <F5> in vim.
```bash
pandoc inputfilename.md -s -o outputfilename.pdf
```


## trash-cli
```bash
sudo apt install trach-cli
```




# Gnome setting
## Gnome-tweak-tool
```bash
sudo apt install gnome-tweak-tool
```
- Keyboard & Mouse > Additional Layout Options
- Korean Hangul/Hanj keys: Right Alt as Hangul, right Ctrl as Hanja
- Keyboard & Mouse > Mouse > Middle Click Paste: False
- Power > Suspend when laptop lid is closed: Off
- Top Bar > Battery Percentage: On
- Top Bar > Clock > Data: On
- Top Bar > Clock > Seconds: On

```bash
sudo vi /etc/systemd/logind.conf
```
- #HandleLidSwitch=suspend > HandleLidSwitch=ignore

## Settings
- Background: Black
- Dock: Iconsize 24
- Privacy: Screen Lock: Off
- Privacy: Connectivity Checking: Off
- Devices > Keyboard > Home folder: Super+E
- Devices > Mouse & Touchpad > Mouse > Mouse Speed: Max
- Devices > Mouse & Touchpad > Touchpad > Touchpad Speed: Max

## Korean
- Run 'Language Support'
- Install / Remove Languages... > Korean
- Setting > Region & Language
- Add Keyboard 'Korean (Hangul)'
- Delete English
- IBusHangul Setup > Hangul > Hangul Toggle Key > Add
    - Hangul 
    - Delete others


## Gnome extensions
```bash
sudo apt-get install chrome-gnome-shell
```
- https://extensions.gnome.org/
    - OpenWeather
    - Dash to Panel


## Install using Ubuntu Software
- Libreoffice
- VLC
- Inkscape
- Blender
- P7Zip: for files larger than 2GB
- Slack
- GIMP


## Firefox
### Login
### Preferences
- General > Play DRM-controlled content: True
- Search > Default Search Engine: DuckDuckGo
- Search > Default Search Engine > Provide search suggestions: False
- Privacy & Security > Firefox Data Collection and Use > Allow Firefox to send technical and interaction data to Mozilla: False

```bash
sudo apt install libavcodec-extra
```
- Codec for video

### Enable backspace
Type **about:config** in the address bar of Firefox and search for **browser.backspace_action**. Change its value from **2** to **0** and now you can use Backspace to go back in history.


## Dropbox
- Go to 'https://www.dropbox.com/install-linux'
- Download deb file
- Open with 'Software Install (default)'

## Anaconda
- Download sh file from anaconda
```bash
sh ./Anaconda3_2019.07-Linux-x86_64.sh
conda install -c conda-forge jupyterlab
conda install tensorflow
pip install gym
```

## Mendeley
- https://www.mendeley.com/download-desktop/
- Download for Ubuntu and Kubuntu 16.04 LTS, 17.04 and Debian Stretch 9 > 64bit

## Matlab
- https://www.mathworks.com
- Download zip file
- Unzip file
```bash
sudo sh install
```

## FreeCAD
```bash
sudo add-apt-repository ppa:freecad-maintainers/freecad-stable
sudo apt-get update
sudo apt-get install freecad
```

## VPN
- Download Pulse Secure VPN Client from 'https://vpn.janelia.org'
```bash
sudo dpkg -i ps-pulse-linux-9.0r3.0-b923-ubuntu-debian-64-bit-installer.deb # or just use installer
/usr/local/pulse/PulseClient_x86_64.sh install_dependency_packages
sudo apt install net-tools
```
- It will not work without the last line

## Arduino
- Download Arduino sketch from website
    - https://www.arduino.c/download_handler.php?f=/arduino-1.8.10-linux64.tar.xz
- Unzip file
```bash
./install.sh
```

- Download Teensyduino 1.48 and udev rule file
    - https://www.pjrc.com/teensy/td_download.html

    - https://www.pjrc.com/teensy/49-teensy.rules
    - https://www.pjrc.com/teensy/td_148/TeensyduinoInstall.linux64

```bash
sudo cp 49-teensy.rules /etc/udev/rules.d/
sudo chmod +x ./TeensyduinoInstall.linux64
./TeensyduinoInstall.linux64
```

