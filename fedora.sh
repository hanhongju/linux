dnf-3 config-manager --set-disabled '*'
echo '
[fedora]
name=Fedora $releasever - $basearch
baseurl=https://mirrors.sustech.edu.cn/fedora/releases/$releasever/Everything/$basearch/os/
enabled=1
countme=1
metadata_expire=7d
repo_gpgcheck=0
type=rpm
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False
'  >   /etc/yum.repos.d/fedora.repo
echo '
[updates]
name=Fedora $releasever - $basearch - Updates
baseurl=https://mirrors.sustech.edu.cn/fedora/updates/$releasever/Everything/$basearch/
enabled=1
countme=1
repo_gpgcheck=0
type=rpm
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-$releasever-$basearch
skip_if_unavailable=False
'  >   /etc/yum.repos.d/fedora-updates.repo
dnf check-update
dnf -y install brasero rhythmbox smplayer net-tools libreoffice hashdeep gparted samba qbittorrent cifs-utils thunderbird     \
               dirmngr cmake calibre krita gimp trojan R libxml2-devel libcurl-devel libpng-devel libtiff-devel libjpeg-devel \
               harfbuzz-devel fribidi-devel fontconfig-devel freetype-devel




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
dnf    -y   upgrade
echo   '
https://vscode.download.prss.microsoft.com/dbazure/download/stable/ddc367ed5c8936efe395cffeec279b04ffd7db78/code-1.98.2-1741788968.el8.x86_64.rpm
https://github.com/Eugeny/tabby/releases/download/v1.0.223/tabby-1.0.223-linux-x64.rpm
https://dldir1v6.qq.com/weixin/Universal/Linux/WeChatLinux_x86_64.rpm
https://www.softmaker.net/down/softmaker-freeoffice-2024-1224.x86_64.rpm
https://download1.rstudio.org/electron/rhel9/x86_64/rstudio-2024.12.1-563-x86_64.rpm
https://github.com/balena-io/etcher/releases/download/v2.1.0/balena-etcher-2.1.0-1.x86_64.rpm
'       >      download.txt
xargs   --max-args 1        --max-procs 10        --arg-file download.txt        \
curl    --location          --continue-at -       --socks5-hostname 127.0.0.1:4000      --remote-name
dnf     -y     install      ./code-1.98.2-1741788968.el8.x86_64.rpm  ./tabby-1.0.223-linux-x64.rpm \
                            ./WeChatLinux_x86_64.rpm ./softmaker-freeoffice-2024-1224.x86_64.rpm   \
                            ./rstudio-2024.12.1-563-x86_64.rpm ./balena-etcher-2.1.0-1.x86_64.rpm
netstat -plnt




# 新电脑安装软件 @ Fedora 41
# 镜像站 https://mirror.nju.edu.cn/mirrorz-help/fedora/
