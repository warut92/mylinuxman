<style>
img {
  width: 200px
}
</style>

# ระบบ

## การติดตั้งระบบปฏิบัติการลินุกซ์แจกจ่าย **[Xubuntu](https://xubuntu.org/)**
* การติดตั้ง Linux ที่สามารถบูตได้ทางแฟรชไดรฟ์ผ่านทาง Terminal
* `df` หาที่อยู่ของแฟรชไดรฟ์
* ยกเลิกการเชื่อมต่อของแฟรชไดรฟ์ `sudo umount /ที่/อยู่`
* ติดตั้งผ่านคำสั่ง `sudo dd bs=4M if=/ที่อยู่/ของ/ไฟล์ISO of=/ที่อยู่ของ/แฟรชไดรฟ์ status=progress oflag=sync` เสร็จ! [ที่มา](https://vitux.com/how-to-create-a-bootable-usb-stick-from-the-ubuntu-terminal/)
* การตั้งค่าแบบแบ่งพาร์ติชันเอง 
* โฟลเดอร์ในไดร์ฟไม่สามารถลบ เปลี่ยนชื่อ ย้าย >> เนื่องมาจาก dual boot ปิด Windows ไม่สมบูรณ์

---

## เมื่อลืมรหัสผ่าน
วิธีการแก้ไขโดยไม่ต้องติดตั้ง os ใหม่ (เข้าโดยการแก้ใน recovery mode)
1. reboot 
2. รีบกด esc หรือ Shift เพื่อเข้าสู่หน้าของ grub
3. เลือก advance > recovery > root
4. Enter พิมพ์ ls /home เพื่อดูชื่อ root
5. จากนั้น พิมพ์ passwd เพื่อกรอกรหัสใหม่
6. reboot

---

## การติดตั้งฟอนต์ในระบบ
คือการนำฟอนต์ไปไว้ใน /usr/share/fonts/ truetype/thai/ (ใช้สิทธิ์ root)

(หากไม่มี dir /thai ก็ให้สร้างมาก่อนด้วย  mkkdir)


## ติดตั้งโปรแกรม
### LibreOffice ด้วยไฟล์ `.deb` _ซึ่งมีหลายไฟล์มาก_

- ไปที่ไดเรกทอรี่ที่มีไฟล์ `.deb` แล้ว 

      sudo dpkg -i *.deb
---

### [VMware Workstation](https://en.wikipedia.org/wiki/VMware_Workstation) โปรแกรมจำลองเครื่องเสมือนจริง
  - ดาว์นโหลดไฟล์ `.bondle` จากเว็บไซต์ [vmware](https://www.vmware.com/asean/products/workstation-player/workstation-player-evaluation.html) เปิด terminal `sudo apt-get update` และ `sudo apt install gcc build-essential` ไปที่ไฟล์ที่ดาว์โหลด `chmod +x filename.bundle` ติดตั้งด้วย `sudo ./filename.bundle`

---

### โปรแกรมแตกไฟล์ 
- .rar โปรแกรม [unrar](https://linuxhint.com/extract_rar_files_ubuntu/)

- .zip

        unzip {file name}

- .tar

        tar -xf {file name}

---

### ติตตั้ง wine ด้วย termianl
    sudo apt install wine64
    
ใช้ติดตั้ง LINE ได้ผล

---

### ติดตั้ง gnome-disk-utility 

    sudo apt-get update -y 
  
และ
  
    sudo apt-get install -y gnome-disk-utility

---

### terminal ตรวจสอบความร้อนแบต+การทำงานของพัดลม

    sensors

---

### โปรแกรม [screenkey](https://www.thregr.org/~wavexx/software/screenkey/)

![](https://www.thregr.org/~wavexx/software/screenkey/screenkey.gif)

---

### การติดตั้งแป้นพิมพ์ Manoonchai

    wget https://github.com/hiohlan/kiimo/raw/main/output/Manoonchai/Manoonchai_xkb --output-document=Manoonchai_xkb

และ

    sudo cp ./Manoonchai_xkb /usr/share/X11/xkb/symbols/

และ

    setxkbmap -layout 'us,Manoonchai_xkb' -option 'grp:win_space_toggle'

  คุณสามารถเปลี่ยน option ได้จาก [List of all setxkbmap configuration options (including models/layout/etc)](https://gist.github.com/jatcwang/ae3b7019f219b8cdc6798329108c9aee)

 ไฟล์ variant ส่วนหนึ่งของ keyboard ภาษาไทยที่มีอยู่เดิม >> [my-k-layout](https://github.com/warut92/myklayout)

---

### [DWM](https://dwm.suckless.org/)
* dwm status bar แบบง่าย [dwm-bar](https://github.com/joestandring/dwm-bar)
---
### โปรแกรม 2 หน้าจอ
การตั้งค่า 2 หน้าจอใช้ `randr` จัดการแบบ 
หรือผ่านทาง termianl `xrandr`

---

## การลบโปรแกรมด้วยเทอร์มินอล
* ดูรายชื่อโปรแกรมที่ติดตั้งแล้ว 
  
    `dpkg --list`

* ตัวอย่างเช่นลบโปรแกรม Gimp 
`sudo apt-get --purge remove gimp` (`--purge` = ลบไฟล์คอนฟิกูเรชันทั้งหมด)  
`sudo apt-get remove gimp` (ไม่ลบไฟล์คอนฟิกูเรชัน)
* ลบโปรแกรมแล้วที่ไม่ได้ใช้แล้ว (เพกเกจเกี่ยวเนื่อง) `sudo apt-get autoremove`

---

### เปลี่ยน DNS Server
    cd /etc 
    
    sudo nano resolv.conf 

---
## เทอร์มินอลเบื้องต้น
* [chmod](https://poundxi.com/%E0%B8%AD%E0%B8%98%E0%B8%B4%E0%B8%9A%E0%B8%B2%E0%B8%A2%E0%B8%84%E0%B8%B3%E0%B8%AA%E0%B8%B1%E0%B9%88%E0%B8%87-chmod-%E0%B8%9A%E0%B8%99-linux/)