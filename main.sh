#!/bin/bash
fname=``
mdimgh="![]("
gitrawold="https:\/\/raw.githubusercontent.com\/valetzx\/AutoWebSnap\/main\/"
gitrawnew="https:\/\/raw.githubusercontent.com\/valetzx\/websnap-autoaction\/main\/"
gitraw="https:\/\/alist.learnonly.xyz\/d\/!网页快照\/"
mdimgb=")"

find save -type f -name "*.png" > name.md
sed "/./{s/^/![]($gitraw&/;s/$/&$mdimgb/}" name.md > index.md

sed -i '1 i\{% gallery %}' index.md
sed -i '/{% gallery %}/i\\' index.md
sed -i 's/\(\/save\)//g' index.md

sed -i '1 i\---' index.md
sed -i '1 i\top_img: https://bing.icodeq.com ' index.md
sed -i '1 i\swiper_cover: ' index.md
sed -i '1 i\swiper_desc: ' index.md
sed -i '1 i\swiper_index: 996' index.md
sed -i '1 i\type: "gallery" ' index.md
sed -i '1 i\date: 2022/05/06 ' index.md
sed -i '1 i\title: 网页快照' index.md
sed -i '1 i\---' index.md

sed -i '$a\{% endgallery %}'  index.md
