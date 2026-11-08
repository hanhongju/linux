zypper modifyrepo --disable --all
echo   '
[nju-oss]
enabled=1
autorefresh=1
baseurl=https://mirror.nju.edu.cn/opensuse/tumbleweed/repo/oss/
gpgcheck=1
[nju-non-oss]
enabled=1
autorefresh=1
baseurl=https://mirror.nju.edu.cn/opensuse/tumbleweed/repo/non-oss/
type=rpm-md
gpgcheck=1
'   >   /etc/zypp/repos.d/nju.repo
zypper  refresh
zypper  install --no-confirm    brasero rhythmbox smplayer libreoffice hashdeep gparted qbittorrent cmake krita gimp trojan R-base  \
                                gcc gcc-c++ gcc-fortran harfbuzz-devel fribidi-devel freetype2-devel fontconfig-devel               \
                                libxml2-devel libcurl-devel libjpeg62-devel libpng16-compat-devel libtiff-devel net-tools
zypper  update  --no-confirm
ss      --processes  --listening  --numeric  --tcp




# 新电脑安装软件 @ openSUSE Tumbleweed
# 参考文献 https://zhuanlan.zhihu.com/p/609450361
# 源列表 https://mirror.nju.edu.cn/mirrorz-help/opensuse/
