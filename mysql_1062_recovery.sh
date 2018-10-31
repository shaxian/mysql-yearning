#!/bin/bash
mysql=/usr/local/mysql/bin/mysql
sock=/data/mysql/mysql.sock
passwd=123456

while true
do
    SQL_THREAD=
    LAST_ERROR=
    duplicate=
    DATABASE=
    TABLE=

     -uroot -p -S  -e 'show slave status\G' | grep HA_ERR_FOUND_DUPP_KEY
    if [ 0 -eq 1 ]
    then
        if [ "" == No ] && [ "" == 1062 ]
        then
            FILED=
             -uroot -p -S  -e "delete from . where ="
             -uroot -p -S  -e "start slave sql_thread"
        else
            echo "====================== ok ========================"
             -uroot -p -S  -e 'show slave status\G' | egrep 'Slave_.*_Running'
            echo "====================== ok ========================"
            break
        fi
    fi
done

