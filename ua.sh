#!/bin/bash

#Скрипт встановлення української локалізації ігор на MacOS
#v 1.0 by ExcellProj and MATRIXFELLO
#Актуальність бази - 18.01.2024

BLUE='\033[0;36m'
YEL='\033[0;33m'
PURPLE='\033[0;35m'
RED='\033[0;31m'
NC='\033[0m'

work_folder="$HOME/Downloads/LOC_UA240891" # Створення робочої папки до якої буде завантаженно файли і яка буде видалена після закінчення встановлення

#Це щось типу доступної бази локалізацій ігор для встановлення, де:
#gameDes - повна назва гри
#gameIds - короткий варіант назви гри, так званий ID гри, який використовують для вибору гри при підчас встановлення
#fileIds - посилання на завантаження файлів з Google Drive
gameDes=("AER Memories of Old" "Firewatch")
gameIds=("aer" "firewatch")
fileIds=("1-PJVIg09M8s2uXxSDZZUQYRHoG-7s_UQ" "16syl-lfrfxh2vUqOLu5Gbjj0gjCOjz9Y")

printf "${YEL}Вітаю! Цей скрипт допоможе встановити українську локалізацію${BLUE}\nБудь ласка упевніться, що Ви зробили перший запуск гри.\n\
Введіть ID гри (вказано в інструкції) або list, щоб побачити список доступних ID => Назва гри: \n"

while true; do
    read -p "$(printf "${PURPLE}>") " gameId

    if [ "${gameId}" == "list" ]; then
    	printf "${BLUE}Доступний список ID ігор:${RED}\n"
    	for ((i=0; i<${#gameIds[@]}; i++)); do
    		games="${gameIds[$i]}"
    		descrip="${gameDes[$i]}"
    	printf "%s => %s\n" "${games}" "${descrip}"
    done
    	continue
    fi
    index=-1

    for i in "${!gameIds[@]}"; do
        if [ "${gameIds[$i]}" == "$gameId" ]; then
            index=$i
            break
        fi
    done	

    if [ "$index" -ne -1 ]; then
        fileId="${fileIds[$index]}"
        break
    else	
        printf "${NC}${RED}Гру не знайдено! Впишіть list, щоб переглянути список доступних ID та спробуйте ще раз${BLUE}\n"	
    fi
done 
printf "${BLUE}Створення робочого каталогу ${YEL}${work_folder}${NC}\n${BLUE}Розпочинаємо встановлення...${NC}\n"
mkdir "${work_folder}"

curl -L "https://drive.usercontent.google.com/download?id=${fileId}&export=download&confirm=y" -o "${work_folder}/localization_ua.zip"

unzip -j "${work_folder}/localization_ua.zip" -d "${work_folder}"

cd "${work_folder}"
# Тут використовується файл info, де вказані інструкції, що і куди треба скопіювати
grep -E 'file_[0-9]+|link_[0-9]+' info | while IFS= read -r line; do
    if [[ $line == file_* ]]; then
        file="${line#*=}"
    elif [[ $line == link_* ]]; then
        link="${line#*=}"

        # Перевірити і замінити ~ на $HOME в посиланні
        if [[ $link == "~"* ]]; then
            link="$HOME${link:1}"
        fi

        if [[ -n "$file" && -n "$link" && -e "$file" && -d "$link" ]]; then
            #Перевіряємо чи надходить тека з файлами, чи імʼя файлу
            if [[  $file == */ ]]; then
              cp -r "$file"* "$link"
            else
              cp -r "$file" "$link"
            fi
           printf "Скопійовано $file до $link\n"
        else
            printf "${RED}Помилка: %s або %s  не існує${NC}\n" "$file" "$link"
        fi
    fi
done

printf "${BLUE}Встановлення закінчено!\nВидалення завантажених файлів локалізації та робочого каталогу ${YEL}${work_folder}${NC}${BLUE}...\nУспіх!\n"
rm -r "${work_folder}"
printf "${RED}-♡--♡--♡-${BLUE}Приємної гри! ${YEL}≽^•⩊•^≼ ${RED}-♡--♡--♡-${NC}\n"
