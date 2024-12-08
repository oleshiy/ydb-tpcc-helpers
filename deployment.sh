i=0; for DISK in "/dev/vdb" "/dev/vdc" "/dev/vdd"; do i=$((i+1)); sudo parted ${DISK} mklabel gpt -s; sudo parted -a optimal ${DISK} mkpart primary 0% 100%; sudo parted ${DISK} name 1 ydb_disk_ssd_0$i; sudo partx --u ${DISK}; done

for i in 1 2 3; do sudo LD_LIBRARY_PATH=/opt/ydb/lib /opt/ydb/bin/ydbd admin bs disk obliterate /dev/disk/by-partlabel/ydb_disk_ssd_0$i; done