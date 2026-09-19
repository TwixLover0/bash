#!/bin/bash
LOG_FILE="/home/svino11/update_log.txt"
if pamac upgrade --no-confirm > "$LOG_FILE" 2>&1; then
 echo "[$(date)] Обновления установлены успешно!" >> "$LOG_FILE" 
else
 echo "Ошибка!!Проверьте файл" >> "$LOG_FILE"
fi

