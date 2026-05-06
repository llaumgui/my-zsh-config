# My Zsh Config

[![Author][ico-bluesky]][link-bluesky]
[![Software License][ico-license]](LICENSE)

My custom Oh My Zsh configuration.

## Install

*My Zsh Config* install *[Antidote](https://antidote.sh/)* in a system directory to be used by all users instead user's home directory.

* First installl Antidote:

```bash
sudo mkdir /opt/mattmc3
cd /opt/mattmc3
sudo git clone https://github.com/mattmc3/antidote.git
```

* Install my configuration:

```bash
sudo mkdir /opt/llaumgui
cd /opt/llaumgui
sudo git clone https://github.com/llaumgui/my-zsh-config.git
```

* Deploy configuration:

```bash
sudo cp /etc/zshrc /etc/zshrc.back
sudo cat /opt/llaumgui/my-zsh-config/zshrc > /etc/zshrc
mkdir ~/.zsh
cat /opt/llaumgui/my-zsh-config/zsh_plugins.txt > ~/.zsh/plugins.txt
cat /opt/llaumgui/my-zsh-config/p10k.zsh > ~/.p10k.zsh
```

* Enjoy !

## Setup

Just edit */etc/zshenv* for global settings or edit your personal *~/.zshrc* file for a per user configuration.

[ico-bluesky]: https://img.shields.io/static/v1?label=Author&message=llaumgui&color=208bfe&logo=bluesky&style=flat-square
[link-bluesky]: https://bsky.app/profile/llaumgui.kulakowski.fr
[ico-version]: https://img.shields.io/docker/v/llaumgui/httpd?sort=semver&color=%2496ed&logo=docker&style=flat-square
[ico-license]: https://img.shields.io/github/license/llaumgui/my-zsh-config?style=flat-square
