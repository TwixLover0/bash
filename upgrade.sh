#! /bin/bash
LOG_FILE="/home/svino11/update_log.txt"

echo "[$(date +%F)] НАЧАЛО  ОБНОВЛЕНИЯ" >> "$LOG_FILE"

rm -f /var/lib/pacman/db.lck

echo "[$(date +%T)] Обновление зеркал" >> "$LOG_FILE"
pacman-mirrors --fasttrack 5 >> "$LOG_FILE" 2>&1

echo "[$(date +%T)] Принудительное обновление" >> "$LOG_FILE" 
if pacman -Syy --noconfirm >> "$LOG_FILE" 2>&1;then

echo "[$(date +%T)] Обновление системы" >> "$LOG_FILE"
if pacman -Syu --noconfirm --overwrite "*" >> "$LOG_FILE" 2>&1;then
echo "[$(date '+%Y-%m-%d %H:%M:%S')] ОБНОВЛЕНИЕ ЗАВЕРШЕНО УСПЕШНО" >> "$LOG_FILE"
else
echo "[$(date '+%Y-%m-%d %H:%M:%S')] ОШИБКА!ПАКЕТЫ НЕ ОБНОВЛЕНЫ" >> "$LOG_FILE" 
fi

echo "[$(date '+%Y-%m-%d %H:%M:%S')] ОБНОВЛЕНИЕ AUR" >> "$LOG_FILE"
if runuser -l svino11 -c "yay -Sua  --noconfirm"  >> "$LOG_FILE" 2>&1;then
echo "[$(date '+%Y-%m-%d %H:%M:%S')] ОБНОВЛЕНИЕ ЗАВЕРШЕНО УСПЕШНО" >> "$LOG_FILE"
else
echo "[$(date '+%Y-%m-%d %H:%M:%S')] ОШИБКА!ПАКЕТЫ НЕ ОБНОВЛЕНЫ" >> "$LOG_FILE"
fi

echo "[$(date +%F)] КОНЕЦ ОБНОВЛЕНИЯ" >> "$LOG_FILE"
fi
