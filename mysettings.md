<link rel="stylesheet" href="https://cdn.simplecss.org/simple.min.css">

<style>
img {
  width: 200px;
}
</style>
[[หน้าหลัก]](index.md)

## การตั้งค่าครั้งแรกของผม

### ติดตั้งฟอนต์ภาษาไทย Thai font

`sudo apt install fonts-thai-tlwg`

#### การติดตั้งแป้นพิมพ์ Manoonchai

`wget https://github.com/hiohlan/kiimo/raw/main/output/Manoonchai/Manoonchai_xkb --output-document=Manoonchai_xkb`

`xkbcomp Manoonchai_xkb`

`sudo cp ./Manoonchai_xkb /usr/share/X11/xkb/symbols/`

`setxkbmap -layout 'us,Manoonchai_xkb' -option 'grp:win_space_toggle'`

[web: manoonchai.com](https://manoonchai.com/)\
คุณสามารถเปลี่ยน option ได้จาก [List of all setxkbmap configuration options (including models/layout/etc)](https://gist.github.com/jatcwang/ae3b7019f219b8cdc6798329108c9aee)

 ไฟล์ variant ส่วนหนึ่งของ keyboard ภาษาไทยที่มีอยู่เดิม >> [my-k-layout](https://github.com/warut92/myklayout)     
       