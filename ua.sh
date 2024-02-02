#!/bin/bash

# Скрипт встановлення української локалізації ігор на MacOS
# v 1.1 by ExcellProj and MATRIXFELLO
# Актуальність бази - 01.02.2024

BLUE='\033[0;36m'
YEL='\033[0;33m'
PURPLE='\033[0;35m'
RED='\033[0;31m'
NC='\033[0m'

work_folder="$HOME/Downloads/LOC_UA240891" # Створення робочої папки до якої буде завантаженно файли і яка буде видалена після закінчення встановлення

# Це щось типу доступної бази локалізацій ігор для встановлення, де:
# gameDes - повна назва гри
# gameIds - короткий варіант назви гри, так званий ID гри, який використовують для вибору гри при підчас встановлення
# fileIds - посилання на завантаження файлів з Google Drive
gameDes=("AER Memories of Old" "Firewatch" "Evoland Legendary Edition" "Hollow Knight" "BioShok Remastered" "Outlast + DLC" "Bastion" "Titan Souls" "SteamWorld Dig 2" "This War of Mine" "Mount & Blade: Warband")
gameIds=("aer" "firewatch" "evoland_le" "hollow_knight" "bioshok_re" "outlast" "bastion" "titan_souls" "swd2" "twom" "mb_warband")
fileIds=("1-PJVIg09M8s2uXxSDZZUQYRHoG-7s_UQ" "16syl-lfrfxh2vUqOLu5Gbjj0gjCOjz9Y" "1SNLzafwJM7IS9sR_dIQL3LFLhdM3X47s" "1xEFWMe8YwzxmjXUNoKzJmlRnfvSRTW75" "1uSNraR4mEDrysgqIZx9iQp-P_2P35exg" \
    "13tK5UNolMGVCkncJJZkuZo67W9IBlyqt" "1LSXp2ItAalkUGeh52FfwxIC8QdC1JWos" "14RrcyKKqFLej-oN49bmcRKFSRkGkDDQg" "12aprhDHseCHNrnWNqSW671zNjjYoLgmM" "1ItrAwYKDNbxMkpyfSKQS7a5PxeHAe0Rt" \
    "1sitQs37mzJZ5X4wfTr9cc7BrJswt1mzv")

printf "${YEL}Вітаю! Цей скрипт допоможе встановити українську локалізацію${BLUE}\nБудь ласка упевніться, що Ви зробили перший запуск гри.\n\
Введіть ID гри (вказано в інструкції) або ${PURPLE}list${BLUE}, щоб побачити список доступних ID => Назва гри: \n"

while true; do
    read -p "$(printf "${PURPLE}>") " gameId

    if [ "${gameId}" == "exit" ]; then
        printf "${BLUE}Вихід${NC}\n"
        exit 0

    elif [ "${gameId}" == "list" ]; then
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
        printf "${NC}${RED}Гру не знайдено! Впишіть ${PURPLE}list${RED}, щоб переглянути список доступних ID та спробуйте ще раз:${BLUE}\n"	
    fi
done 
printf "${BLUE}Створення робочого каталогу ${YEL}${work_folder}${NC}\n${BLUE}Розпочинаємо встановлення...${NC}\n"
mkdir "${work_folder}"

curl -L "https://drive.usercontent.google.com/download?id=${fileId}&export=download&confirm=y" -o "${work_folder}/localization_ua.zip"

tar -xf "${work_folder}/localization_ua.zip" -C "${work_folder}" --strip-components=1

cd "${work_folder}"
# Тут використовується файл info, де вказані інструкції, що і куди треба скопіювати
grep -E 'file_[0-9]+|link_[0-9]+|del_[0-9]+' info | while IFS= read -r line; do
    if [[ $line == file_* ]]; then
        file="${line#*=}"
    elif [[ $line == link_* ]]; then
        link="${line#*=}"

        # Перевірити і замінити ~ на $HOME в посиланні
        if [[ $link == "~"* ]]; then
            link="$HOME${link:1}"
        fi

        if [[ -n "$file" && -n "$link" && -e "$file" && -d "$link" ]]; then
            # Перевіряємо чи надходить тека з файлами, чи імʼя файлу
            if [[  $file == */ ]]; then
                cp -r "$file"* "$link"
            else
                cp -r "$file" "$link"
            fi
             printf "${BLUE}Скопійовано ${PURPLE}$file${NC}${BLUE} до ${YEL}$link\n"
        else
            printf "${RED}Помилка: ${PURPLE}%s${NC}${BLUE} або ${YEL}%s  ${BLUE}не існує${NC}\n" "$file" "$link"
       fi
# Блок видалення файлів, працюватиме, якщо це зазначено інструкціями в файлі info
   elif [[ $line == del_* ]]; then
        IFS=',' read -r -a dels <<< "${line#*=}"
        for del in "${dels[@]}"; do
            deIndex="${line#del_}" # Отримуємо індекс del_* (наприклад, 1 з del_1)
            deIndex="${deIndex//[^0-9]/}"
            delink_var="delink_${deIndex}" # Отримуємо відповідний індекс delink_*
            if [[ -f "info" ]]; then # Зчитуємо значення delink_* з файлу info
                delink="$(grep -E "^$delink_var" info | cut -d'=' -f2)"
                delink="${delink//\~/$HOME}"  # Замінюємо ~ на $HOME

                if [[ -n "$del" && -n "$delink" && -e "$delink" && -d "$delink" ]]; then
                    rm -r "$delink/$del"
                    printf "${BLUE}Файл видалено: ${YEL}$delink/$del${NC}\n"
                else
                    printf "${RED}Помилка: ${PURPLE}%s${NC}${BLUE} або ${YEL}%s  не існує${NC}\n" "$del" "$delink"
                fi
            else
                printf "${RED}Помилка: файл ${PURPLE}info${RED} не існує${NC}\n"
            fi
        done
    fi
done
printf "${BLUE}Встановлення закінчено!\nВидалення завантажених файлів локалізації та робочого каталогу ${YEL}${work_folder}${NC}${BLUE}...\nУспіх!\n"
rm -r "${work_folder}"
printf "\n\n\n${RED}-♡--♡--♡-${BLUE}Приємної гри! ${YEL}≽^•⩊•^≼ ${RED}-♡--♡--♡-${NC}\n\n\n"
