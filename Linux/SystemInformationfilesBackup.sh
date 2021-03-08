 ```bash
    #!/bin/bash
    [# Free memory output to a free_mem.txt file
    free -h >  /home/backups/freemem/free_mem.txt
    # Disk usage output to a disk_usage.txt file
    du -sh > /home/backups/diskuse/disk_use.txt
    # List open files to a open_list.txt file
    lsof > /home/backups/openlist/open_list.txt
     # Free disk space to a free_disk.txt file
     df -h > /home/backups/freedisk/free_disk.txt]
 ```