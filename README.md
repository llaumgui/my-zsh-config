# My Zsh Config
My custom Oh My Zsh configuration.

## Install
*My Zsh Config* install *Oh My Zsh* in a system directory to be used by all users instead user's home directory.
* First installl  [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh):
```bash
sudo mkdir /opt/robbyrussell
cd /opt/robbyrussell
sudo git clone git://github.com/robbyrussell/oh-my-zsh.git
chown -R root:wheel oh-my-zsh
chmod -R g+w oh-my-zsh
```
* Install my configuration:
```bash
sudo mkdir /opt/llaumgui
cd /opt/llaumgui
sudo git clone git://github.com/llaumgui/my-zsh-config.git
chown -R root:wheel oh-my-zsh
chmod -R g+w oh-my-zsh
```
* Deploy configuration:
```bash
sudo cp /etc/zshrc /etc/zshrc.back
sudo cp /etc/zshenv /etc/zshenv.back
sudo cat /opt/llaumgui/my-zsh-config/etc/zshrc > /etc/zshrc
sudo cat /opt/llaumgui/my-zsh-config/etc/zshenv.dist >> /etc/zshenv
```
* Enjoy !

## Setup
Just edit */etc/zshenv* for global settings or edit your personal *~/.zshrc* file for a per user configuration.

### Upgrade
*My Zsh Config* override the *Oh My Zsh* upgrade script. You upgrade *My Zsh Config* and *Oh My Zsh* in same time.

By default auto update is disabled (*DISABLE_AUTO_UPDATE*), to enable it: just put this line in your personnal *~/.zshrc*:
```bash
zsh -f $ZSH/tools/check_for_upgrade.sh
```