#!/bin/bash
#set -x
#v 1.0
BLUE='\033[1;36m'
NC='\033[0m'

work_folder="$HOME/TEST/LOC"
#work_folder="$HOME/Downloads/LOC_UA240891"
#Список ID ігор та посилань 
gameDes=("AER" "God" "DOTA2")
gameIds=("g_aer" "g_god" "g_dota")
fileIds=("1-PJVIg09M8s2uXxSDZZUQYRHoG-7s_UQ" "yfuyre7647t" "dotaayyayay")

printf "Вітаю! Цей скрипт допоможе встановити українську локалізацію${BLUE}\n"

while true; do
    read -p "Введіть ID гри (вказано в інструкції) або list, щоб побачити список доступних ID: " gameId

    if [ "${gameId}" == "list" ]; then
    	printf "Доступний список ID ігор:\n"
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
        printf "${NC}Гру не знайдено! Впишіть list, щоб переглянути список доступних ID та спробуйте ще раз${BLUE}\n"	
    fi
done 

mkdir "${work_folder}"
curl -L "https://drive.usercontent.google.com/download?id=${fileId}&export=download&confirm=y" -o "${work_folder}/localization_ua.zip"

unzip -j "${work_folder}/localization_ua.zip" -d "${work_folder}"

printf "Файли локалізації розпаковані\nРозпочинаємо встановлення...${NC}\n"

cd "${work_folder}"

grep -E 'file_[0-9]+|link_[0-9]+' info | while IFS= read -r line; do
    if [[ $line == file_* ]]; then
        file="${line#*=}"
    elif [[ $line == link_* ]]; then
        link="${line#*=}"

        # Перевірити і замінити ~ на $HOME в посиланні
        if [[ $link == "~"* ]]; then
            link="$HOME${link:1}"
        fi

        if [[ -n $file && -n $link && -e $file && -d $link ]]; then
            cp "$file" "$link"
            echo "Скопійовано $file до $link"
        else
            echo "Помилка: $file або $link не існує"
        fi
    fi
done

printf "Видалення завантажених файлів локалізації...\n"
rm -r "${work_folder}"