apt  update
apt  install -y    pandoc curl
mkdir        -p    ~/fhs_epub
cd                 ~/fhs_epub
curl         -sL   "https://refspecs.linuxfoundation.org/FHS_3.0/fhs-3.0.html"   -o   fhs_3.0.html


python3 -c '
import re
with open("fhs_3.0.html", "r", encoding="utf-8") as f:
    html = f.read()
html = re.sub(r"<div class=\"titlepage\">.*?<div class=\"abstract\">", "<div class=\"abstract\">", html, count=1, flags=re.S)
html = re.sub(r"<dl[^>]*>", "<ul style=\"list-style-type:none; padding-left:1.5em; margin:0.2em 0;\">", html)
html = html.replace("</dl>", "</ul>")
html = re.sub(r"<dt[^>]*>", "<li style=\"margin-bottom:0.3em;\">", html)
html = html.replace("</dt>", "</li>")
html = re.sub(r"<dd[^>]*>", "", html)
html = html.replace("</dd>", "")
with open("fhs_clean.html", "w", encoding="utf-8") as f:
    f.write(html)
'


echo '
a, a:link, a:visited {
    text-decoration: none !important;        /* 把链接的下划线去掉 */
    color: #0066cc !important;               /* 设置成蓝色字体 */
}
ul   {list-style-type: none !important;}     /* 去除目录列表默认的圆点符号 */
' > custom.css


pandoc fhs_clean.html \
  -o fhs_3.0.epub \
  --css=custom.css \
  --metadata title="Filesystem Hierarchy Standard 3.0" \
  --epub-title-page=false \
  --split-level=1




# 将fhs 3.0 转换为电子书epub格式
