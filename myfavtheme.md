<link rel="stylesheet" href="https://cdn.simplecss.org/simple.min.css">

# ธีมและไอคอนที่ชอบ
## ไอคอน
   ติดตั้งที่ `~/urs/share/icons` หรือ `~/.icons`
## ธีม
   ติดตั้งที่ `~/urs/share/themes` หรือ `~/.themes`

![minios+my fav theme](img/mytheme.png)
- [Papirus Icon](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/blob/master/install.sh)
- [Afterglow-Cursors](https://github.com/yeyushengfan258/Afterglow-Cursors)
- [Default-optimized](https://github.com/Edsploration/default-optimized)
- [Font JetBrains](https://www.jetbrains.com/lp/mono/)

## ไอคอนอื่น ๆ

- [Uniform](https://www.gnome-look.org/p/1012468)

## Thai font

`sudo apt install fonts-thai-tlwg`

### การติดตั้งแป้นพิมพ์ Manoonchai

    wget https://github.com/hiohlan/kiimo/raw/main/output/Manoonchai/Manoonchai_xkb --output-document=Manoonchai_xkb

และ

    sudo cp ./Manoonchai_xkb /usr/share/X11/xkb/symbols/

และ

    setxkbmap -layout 'us,Manoonchai_xkb' -option 'grp:win_space_toggle'

  คุณสามารถเปลี่ยน option ได้จาก [List of all setxkbmap configuration options (including models/layout/etc)](https://gist.github.com/jatcwang/ae3b7019f219b8cdc6798329108c9aee)

 ไฟล์ variant ส่วนหนึ่งของ keyboard ภาษาไทยที่มีอยู่เดิม >> [my-k-layout](https://github.com/warut92/myklayout)