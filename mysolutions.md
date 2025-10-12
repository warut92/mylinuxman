<link rel="stylesheet" href="https://cdn.simplecss.org/simple.min.css">

<style>
img {
  width: 200px;
}
</style>

# ปัญหาที่กระผมอาจจะพบบ่อย ๆ
อาจจะไม่บ่อย แต่ก็ต้องมีบ้าง

## การติดตั้งระบบปฏิบัติการลินุกซ์แจกจ่าย **[Xubuntu](https://xubuntu.org/)**
การติดตั้ง Linux ที่สามารถบูตได้ทางแฟรชไดรฟ์ผ่านทาง Terminal
1. `df` หาที่อยู่ของแฟรชไดรฟ์
1. ยกเลิกการเชื่อมต่อของแฟรชไดรฟ์ `sudo umount /ที่/อยู่`
1. ติดตั้งผ่านคำสั่ง `sudo dd bs=4M if=/ที่อยู่/ของ/ไฟล์ISO of=/ที่อยู่ของ/แฟรชไดรฟ์ status=progress oflag=sync` เสร็จ! 

[web ที่มา](https://vitux.com/how-to-create-a-bootable-usb-stick-from-the-ubuntu-terminal/)

## การตั้งค่าแบบแบ่งพาร์ติชันเอง 
[ยังไม่ได้เขียน]

---
### เกิดปัญหา โฟลเดอร์ในไดร์ฟไม่สามารถลบ เปลี่ยนชื่อ ย้าย ได้ 
> เนื่องมาจาก dual boot ปิด Windows ไม่สมบูรณ์

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
คือการนำฟอนต์ไปไว้ใน /usr/share/fonts/truetype/thai/ (ใช้สิทธิ์ root)

(หากไม่มี dir /thai ก็ให้สร้างมาก่อนด้วย  mkdir)

หรือสร้างโฟลเดอร์ที่ /.fonts

## ติดตั้งโปรแกรม ด้วยไฟล์ `.deb` _ซึ่งมีหลายไฟล์มาก_ (เช่น LibreOffice)

- ไปที่ไดเรกทอรี่ที่มีไฟล์ `.deb` แล้ว 

`sudo dpkg -i *.deb`
---

### [VMware Workstation](https://en.wikipedia.org/wiki/VMware_Workstation) โปรแกรมจำลองเครื่องเสมือนจริง
  - ดาว์นโหลดไฟล์ `.bondle` จากเว็บไซต์ [vmware](https://www.vmware.com/asean/products/workstation-player/workstation-player-evaluation.html) เปิด terminal `sudo apt-get update` และ `sudo apt install gcc build-essential` ไปที่ไฟล์ที่ดาว์โหลด `chmod +x filename.bundle` ติดตั้งด้วย `sudo ./filename.bundle`

---

### ติตตั้ง wine ด้วย termianl
`sudo apt install wine64`
    
ใช้ติดตั้ง LINE ได้ผล[?]

---

## การลบโปรแกรมด้วยเทอร์มินอล
1. ดูรายชื่อโปรแกรมที่ติดตั้งแล้ว 
`dpkg --list`
2. ตัวอย่างเช่นลบโปรแกรม Gimp 
`sudo apt-get --purge remove gimp` (`--purge` = ลบไฟล์คอนฟิกูเรชันทั้งหมด)  
`sudo apt-get remove gimp` (ไม่ลบไฟล์คอนฟิกูเรชัน)
3. ลบโปรแกรมแล้วที่ไม่ได้ใช้แล้ว (เพกเกจเกี่ยวเนื่อง) `sudo apt-get autoremove`

---

### เปลี่ยน DNS Server
`cd /etc` 
    
`sudo nano resolv.conf`

---
## เทอร์มินอลเบื้องต้น
[chmod](https://poundxi.com/%E0%B8%AD%E0%B8%98%E0%B8%B4%E0%B8%9A%E0%B8%B2%E0%B8%A2%E0%B8%84%E0%B8%B3%E0%B8%AA%E0%B8%B1%E0%B9%88%E0%B8%87-chmod-%E0%B8%9A%E0%B8%99-linux/)
