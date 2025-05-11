#!/bin/bash

if ! command -v sendemail &> /dev/null; then
    echo "Ошибка: утилита sendemail не установлена. Установите её командой: sudo apt install sendemail libio-socket-ssl-perl libnet-ssleay-perl"
    exit 1
fi

CONFIG_FILE="$(dirname "$0")/disk_alert.conf"
if [ ! -f "$CONFIG_FILE" ]; then
    echo "Ошибка: файл конфигурации $CONFIG_FILE не найден."
    exit 1
fi
source "$CONFIG_FILE"

ALERT=70

df -H | grep -vE '^Filesystem|tmpfs|cdrom|loop|udev' | awk '{ print $5 " " $1 }' | while read -r output; do
    usep=$(echo "$output" | awk '{ print $1}' | cut -d'%' -f1)
    partition=$(echo "$output" | awk '{ print $2 }')

    if [ "$usep" -ge "$ALERT" ]; then
        SUBJECT="🚨 Alert: Disk Usage $usep% on $partition"
        MESSAGE="Внимание!\n\nНа разделе $partition заканчивается место: $usep% занято.\n\nХост: $(hostname)\nДата: $(date '+%Y-%m-%d %H:%M:%S')"

        sendemail -f "$FROM_EMAIL" \
                  -t "$TO_EMAIL" \
                  -u "$SUBJECT" \
                  -m "$MESSAGE" \
                  -s "$SMTP_HOST:$SMTP_PORT" \
                  -xu "$SMTP_USER" \
                  -xp "$SMTP_PASS" \
                  -o tls=yes

        if [ $? -eq 0 ]; then
            echo "Уведомление отправлено успешно."
        else
            echo "Ошибка при отправке уведомления."
        fi
    fi
done
