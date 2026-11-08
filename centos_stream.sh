dnf config-manager --set-disabled '*'
echo '
[baseos]
name=CentOS Stream $releasever - BaseOS
baseurl=https://mirror.nju.edu.cn/centos-stream/$releasever-stream/BaseOS/$basearch/os
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=1
[appstream]
name=CentOS Stream $releasever - AppStream
baseurl=https://mirror.nju.edu.cn/centos-stream/$releasever-stream/AppStream/$basearch/os
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-centosofficial-SHA256
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=1
'  >   /etc/yum.repos.d/centos.repo
echo '
[extras-common]
name=CentOS Stream $releasever - Extras packages
baseurl=https://mirror.nju.edu.cn/centos-stream/SIGs/$releasever-stream/extras/$basearch/extras-common
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-SIG-Extras-SHA512
gpgcheck=1
repo_gpgcheck=0
metadata_expire=6h
countme=1
enabled=1
'  >   /etc/yum.repos.d/centos-addons.repo
dnf check-update
dnf -y install brasero samba cifs-utils thunderbird dirmngr cmake libxml2-devel libcurl-devel libpng-devel libtiff-devel libjpeg-devel \
               harfbuzz-devel fribidi-devel fontconfig-devel freetype-devel









