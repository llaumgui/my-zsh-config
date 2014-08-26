Setup
-----

* First installl  [Oh My Zsh](https://github.com/robbyrussell/oh-my-zsh):
~~~
sudo mkdir /opt/robbyrussell
cd /opt/robbyrussell
sudo git clone git://github.com/robbyrussell/oh-my-zsh.git
~~~
* Install my configuration:
~~~
sudo mkdir /opt/llaumgui
cd /opt/llaumgui
sudo git clone git://github.com/llaumgui/my-zsh-config.git
~~~
* Deploy configuration:
~~~
sudo cp /etc/zshrc /etc/zshrc.back
sudo cp /etc/zshenv /etc/zshenv.back
sudo cat /opt/llaumgui/my-zsh-config/etc/zshrc > /etc/zshrc
sudo cat /opt/llaumgui/my-zsh-config/etc/zshenv.dist >> /etc/zshenv
~~~
* Enjoy !
