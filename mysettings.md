<link rel="stylesheet" href="https://cdn.simplecss.org/simple.min.css">

<style>
img {
  width: 200px;
}
</style>
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
 
#### การติดตั้งภาพพื้นหลังผ่านทางบรรทัดคำสั่ง
 
`feh --no-fehbg --bg-fill ภาพพื้นหลังที่ชอบ.jpg`

#### ขยายขนาดของ url bar firefox

พิมพ์ในช่อง URL

`about:config`

`toolkit.legacyUserProfileCustomizations.stylesheets` เปลี่ยนจาก fasle เป็น true

พิมพ์ในช่อง URL

`about:support`
ค้นหา "Profile Folder" จากนั้นเปิดโฟลเดอร์แล้วสร้าง

 └── chrome/
       └── userChrome.css
       
ใน userChrome.css ให้ใส่ข้อความ

```
#urlbar {
  --urlbar-min-height: 40px !important; /* default is ~32px */
}

#urlbar-input {
  font-size: 25px !important;
}

* {
  font-size: 25px !important;
}
```       
       