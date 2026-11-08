# 虚拟机不能复制命令手动安装 apt -y install open-vm-tools-desktop
echo   'Types: deb
URIs: https://mirrors.sustech.edu.cn/ubuntu
Suites: noble noble-updates noble-backports noble-security
Components: main restricted universe multiverse
Signed-By: /usr/share/keyrings/ubuntu-archive-keyring.gpg
'       >     /etc/apt/sources.list.d/ubuntu.sources
apt     update   &&   apt   -y   install   wget
wget    -c    https://mirrors.nju.edu.cn/CRAN/bin/linux/ubuntu/marutter_pubkey.asc        -P   /etc/apt/trusted.gpg.d/
wget    -c    https://www.virtualbox.org/download/oracle_vbox_2016.asc                    -P   /etc/apt/trusted.gpg.d/
wget    -c    https://packages.microsoft.com/keys/microsoft.asc                           -P   /etc/apt/trusted.gpg.d/
# 官方源中的 r-base 版本较低，会造成错误
echo    'deb https://mirrors.sustech.edu.cn/CRAN/bin/linux/ubuntu noble-cran40/'                       >    /etc/apt/sources.list.d/cran40.list
echo    'deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian/ noble contrib'            >    /etc/apt/sources.list.d/virtualbox.list
echo    'deb [arch=amd64,arm64,armhf] https://packages.microsoft.com/repos/code/ stable main'          >    /etc/apt/sources.list.d/vscode.list
apt     update   &&   DEBIAN_FRONTEND=noninteractive   apt   -y   install   \
                      brasero build-essential calibre cifs-utils cmake code curl dirmngr \
                      firefox gimp gparted handbrake hashdeep krita krita-l10n libcurl4-openssl-dev \
                      libfribidi-dev libharfbuzz-dev libmagick++-dev libpcre3 libpcre3-dev libreoffice \
                      libreoffice-help-zh-cn libreoffice-l10n-zh-cn libssl-dev net-tools openssl p7zip-full \
                      qbittorrent r-base rhythmbox samba smplayer software-properties-common steam \
                      thunderbird trojan usb-creator-gtk virtualbox wget zlib1g-dev
dpkg    -a    --configure




site=alihk.hanhongju.com
echo '
{"run_type"    : "client"
,"local_addr"  : "127.0.0.1"
,"local_port"  : 4000
,"remote_addr" : "www.example.com"
,"remote_port" : 443
,"password"    : ["fengkuang"]
,"ssl"         : {"sni"  : "www.example.com"
                 ,"alpn" : ["http/1.1"]
                 }
}
'           >                                             /etc/trojan/config.json
sed         -i        "s/www.example.com/$site/g"         /etc/trojan/config.json
systemctl   enable    trojan
systemctl   restart   trojan
apt         update   &&   DEBIAN_FRONTEND=noninteractive   apt   -y   full-upgrade
ubuntu-drivers   autoinstall
apt   -y   autoremove
echo   '
https://github.com/2dust/v2rayN/releases/download/7.9.3/v2rayN-linux-64.deb
https://github.com/balena-io/etcher/releases/download/v2.1.0/balena-etcher_2.1.0_amd64.deb
https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.deb
https://github.com/Eugeny/tabby/releases/download/v1.0.223/tabby-1.0.223-linux-x64.deb
https://www.softmaker.net/down/softmaker-freeoffice-2024_1224-01_amd64.deb
https://download.virtualbox.org/virtualbox/7.0.16/Oracle_VM_VirtualBox_Extension_Pack-7.0.16.vbox-extpack
https://download1.rstudio.org/electron/jammy/amd64/rstudio-2025.05.0-496-amd64.deb
'       >      download.txt
xargs   --max-args 1        --max-procs 10        --arg-file download.txt        \
curl    --location          --continue-at -       --socks5-hostname 127.0.0.1:4000      --output-dir   ./     --remote-name
DEBIAN_FRONTEND=noninteractive   apt   -y   install   \
        ./v2rayN-linux-64.deb   ./WeChatLinux_x86_64.deb   ./balena-etcher_2.1.0_amd64.deb  \
        ./tabby-1.0.223-linux-x64.deb    ./rstudio-2025.05.0-496-amd64.deb                  \
        ./softmaker-freeoffice-2024_1224-01_amd64.deb
VBoxManage extpack install --replace --accept-license=33d7284dc4a0ece381196fda3cfe2ed0e1e8e7ed7f27b9a9ebc4ee22e24bd23c Oracle_VM_VirtualBox_Extension_Pack-7.0.16.vbox-extpack
netstat    -plnt




# 新电脑安装软件 @ Ubuntu 24.04 LTS
# 源列表 https://mirror.nju.edu.cn/mirrorz-help/ubuntu/
