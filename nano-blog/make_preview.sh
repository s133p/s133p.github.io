#!/bin/bash

cat ~/Desktop/nano-blog/void_header.html > ~/Desktop/nano-blog/index.html

echo "<div class='toc'>" >> ~/Desktop/nano-blog/index.html;
echo "<h1> TOC </h1>" >> ~/Desktop/nano-blog/index.html;
for i in `ls -tU ~/Desktop/nano-blog/posts/*.md`; do
    echo $i | sed -e "s/.*\/\(.*\.md\)/<a href='#\1'>\1<\/a><br \/>/g" >> ~/Desktop/nano-blog/index.html;
done
echo "</div>" >> ~/Desktop/nano-blog/index.html;

for i in `ls -tU ~/Desktop/nano-blog/posts/*.md`; do
    echo $i | sed -e "s/.*\/\(.*\.md\)/<div class='content' id='\1'>/g" >> ~/Desktop/nano-blog/index.html;
    markdown $i >> ~/Desktop/nano-blog/index.html;
    echo "</div>" >> ~/Desktop/nano-blog/index.html;
done
