#!/bin/bash
again='y'
while [ $again == 'Y' ] || [ $again == 'y' ];
do
clear
echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
echo " ATUR VBOX BACKUP & RESTORE MANAGEMEN  ";
echo "           Version 0.1.2               ";
echo "      Progammer : Kurniawan            ";
echo "  E-mail : trainingxcode@gmail.com     ";
echo "                 MENU                  ";
echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
echo "1. Cek backup VM di vbox               ";
echo "2. Cek keberadaan VM di vbox           ";
echo "3. Backup semua VM di vbox             ";
echo "4. Hapus semua backup VM               ";
echo "5. Hapus semua VM di vbox              ";
echo "6. Restore semua VM di vbox            ";
echo "7. Exit                                ";
echo "+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+";
read -p "Masukkan Pilihan Anda antara 1 hingga 7: " choice;
echo "";
case $choice in
1)  echo -n "Masukkan nama user: "
    read namauser
    if [ -z "$(sudo ls -A /home/$namauser/backupvm/*)" ]; then
    echo "Belum ada backup VM"
    else
    echo "Sudah ada backup VM"
    fi
    ;;
2)  echo -n "Masukkan nama user: "
    read namauser
    if [ -z "$(ls -l /home/$namauser/VirtualBox\ VMs/testing/*)" ]; then
    echo "Tidak ada VM di linux"
    else
    echo "Ada VM di linux"
    fi
    ;;
3)  echo -n "Masukkan nama user: "
    read namauser
    if [ -z "$(ls -l /home/$namauser/VirtualBox\ VMs/testing/*)" ]; then
    echo "VM ada tidak ada"
    else
    echo "VM ada dan backup dilakukan"
    mkdir /home/$namauser/backupvm
    sudo cp -ar /home/$namauser/VirtualBox\ VMs/* /home/$namauser/backupvm
    fi
    ;;
4)  echo -n "Masukkan nama user: "
    read namauser
    if [ -z "$(ls -A /home/$namauser/backupvm/*)" ]; then
    echo "Tidak ada backup"
    else
    echo "Backup dihapus"
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
    echo "Tidak ada backup VM, tidak bisa dihapus"
    else
    echo "Backup VM ada dan VM dilakukan penghapusan"
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
    	  echo "Tidak ada VM maka restore dilakukan"
          sudo cp -ar /home/$namauser/backupvm/* /home/$namauser/VirtualBox\ VMs/     	     
	  else
    	  echo "Masih ada VM tidak bisa direstore, silahkan hapus dulu VM baru direstore (Menu pilihan nomor 5)"
          fi    
    fi
    ;;   
7)    exit
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

    read namauser
    if [ -z "$(ls -A /home/$namauser/backupvm/*)" ]; then
    echo "Tidak ada backup"
    else
    echo "Backup dihapus"
    sudo rm -r /home/$namauser/backupvm/* 
    fi
    ;;   
5)  echo -n "Masukkan nama user: "
    read namauser
    if [ -z "$(ls -A /home/$namauser/backupvm/*)" ]; then
    echo "Tidak ada backup VM, tidak bisa dihapus"
    else
    echo "Backup VM ada dan VM dilakukan penghapusan"
    sudo rm -r /home/$namauser/VirtualBox\ VMs/*
    fi
    ;;
6)  echo -n "Masukkan nama user: "
    read namauser
    if [ -z "$(ls -A /home/$namauser/backupvm/*)" ]; then
    echo "Tidak dapat direstore karena tidak ada backup"
    else
	  if [ -z "$(ls -A /home/$namauser/VirtualBox\ VMs/*)" ]; then
    	  echo "Tidak ada VM maka restore dilakukan"
          sudo cp -ar /home/$namauser/backupvm/* /home/$namauser/VirtualBox\ VMs/     	     
	  else
    	  echo "Masih ada VM tidak bisa direstore, silahkan hapus dulu VM baru direstore (Menu pilihan nomor 5)"
          fi    
    fi
    ;;   
7)    exit
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
