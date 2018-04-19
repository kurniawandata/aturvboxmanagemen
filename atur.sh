#!/bin/bash
again='y'
while [ $again == 'Y' ] || [ $again == 'y' ];
do
clear
echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
echo " ATUR VBOX BACKUP & RESTORE MANAGEMEN  ";
echo "           Version 0.1.1               ";
echo "      Progammer : Kurniawan            ";
echo "  E-mail : trainingxcode@gmail.com     ";
echo "                 MENU                  ";
echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
echo "1. Cek backup VM di vbox               ";
echo "2. Cek keberadaan VM di vbox           ";
echo "3. Backup semua VM di vbox             ";
echo "4. Hapus semua backup VM               ";
echo "5. Hapus semua VM di vbox              ";
echo "6. Restore VM backup tanpa menimpa     ";
echo "7. Restore VM dengan menimpa           ";
echo "8. Exit                                ";
echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
read -p "Masukkan Pilihan Anda antara 1 hingga 8: " choice;
echo "";
case $choice in
1)  echo -n "Masukkan nama user: "
    read namauser
    if [ -z "$(sudo ls -A /home/$namauser/backupvm/*)" ]; then
    echo "Terdeteksi belum ada backup VM"
    else
    echo "Terdeteksi sudah ada backup VM"
    fi
    ;;
2)  echo -n "Masukkan nama user: "
    read namauser
    if [ -z "$(ls -l /home/$namauser/VirtualBox\ VMs/testing/*)" ]; then
    echo "Terdeteksi tidak ada VM di linux"
    else
    echo "Terdeteksi ada VM di linux"
    fi
    ;;
3)  echo -n "Masukkan nama user: "
    read namauser
    if [ -z "$(ls -l /home/$namauser/VirtualBox\ VMs/testing/*)" ]; then
    echo "VM ada tidak ada"
    else
    echo "VM terdeteksi ada dan backup dilakukan"
    echo "Backup 100% telah dilakukan"
    mkdir /home/$namauser/backupvm
    sudo cp -ar /home/$namauser/VirtualBox\ VMs/* /home/$namauser/backupvm
    fi
    ;;
4)  echo -n "Masukkan nama user: "
    read namauser
    if [ -z "$(ls -A /home/$namauser/backupvm/*)" ]; then
    echo "Tidak ada backup"
    else
    echo "Backup telah dihapus"
    sudo rm -r /home/$namauser/backupvm/* 
    fi
    ;;   
5)  read -p "Apakah anda yakin akan menghapus semua VM? y/n :" -n 1 -r
    echo 
    if [[ ! $REPLY =~ ^[Nn]$ ]]
    then
    echo -n "Masukkan nama user: "
    read namauser
    if [ -z "$(ls -A /home/$namauser/backupvm/*)" ]; then
    echo "Tidak terdeteksi ada backup VM, tidak bisa dihapus"
    else
    echo "Backup VM terdeteksi ada dan VM dilakukan penghapusan"
    echo "Penghapusan VM 100% telah dilakukan"
    sudo rm -r /home/$namauser/VirtualBox\ VMs/*
    fi
    fi
    ;;

6)  echo -n "Masukkan nama user: "
    read namauser
    if [ -z "$(ls -A /home/$namauser/backupvm/*)" ]; then
    echo "Tidak dapat direstore karena tidak ada backup"
    else
	  if [ -z "$(ls -A /home/$namauser/VirtualBox\ VMs/*)" ]; then
    	  echo "Tidak ada VM terdeteksi maka restore dilakukan"
          echo "Restore VM 100% telah dilakukan"
          sudo cp -ar /home/$namauser/backupvm/* /home/$namauser/VirtualBox\ VMs/     	     
	  else
    	  echo "Masih ada VM tidak bisa direstore, silahkan hapus dulu VM baru direstore (Menu pilihan nomor 5). Jika ingin menimpa pilih pilihan nomor 7."
          fi    
    fi
    ;;   

7)  read -p "Apakah anda yakin akan restore dengan menimpa? y/n :" -n 1 -r
    echo 
    if [[ ! $REPLY =~ ^[Nn]$ ]]
    then
    echo -n "Masukkan nama user: "
    read namauser
    if [ -z "$(ls -A /home/$namauser/backupvm/*)" ]; then
    echo "Tidak ada backup VM, tidak bisa direstore"
    else
    echo "Backup VM terdeteksi ada dan tetap restore dengan menimpa"
    echo "Restore VM dengan menimpa 100% telah dilakukan"
    sudo cp -ar /home/$namauser/backupvm/* /home/$namauser/VirtualBox\ VMs/
    fi
    fi
    ;;

8)    exit
    ;;
*)    echo "Maaf, menu tidak ada"
esac
echo ""
echo "ATUR VBOX BACKUP & RESTORE MANAGEMEN"
echo "Oleh Kurniawan - trainingxcode@gmail.com. xcode.or.id"
echo ""
echo -n "Kembali ke menu? [y/n]: ";
read again;
while [ $again != 'Y' ] && [ $again != 'y' ] && [ $again != 'N' ] && [ $again != 'n' ];
do
echo "Masukkan yang anda pilih tidak ada di menu";
echo -n "Kembali ke menu? [y/n]: ";
read again;
done
done
