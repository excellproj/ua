**Спроба спростити встановлення украЇнської локалізації в іграх на MacOS**  
**Це перші кроки. Скрипт написаний так, щоб працював у всіх користувачів `MacOS` однаково(я спродіваюся). Скрипт використовує оболонку `bash`**  
**Тестувалося на `MacOS Sonoma` ~~14.2.1~~ `14.3`**  
**Принцип роботи наступний:**  
Скрипт завантажує з `Google Drive` архів з файлами локалізації гри, яку обрав користувач медотов вводу `ID гри`(щоб переглянути список доступних ігор можна вписати команду list або переглянути у коді перемінні `gameDes` та `gameIds` відповідно ). В архіві є файлик `info`, який містить інструкції для інсталятора, що і куди копіювати та спецільно готується.  
Приклад `info`:
```
file_1=Fonts+Textures/
link_1=~/Library/Application Support/Steam/steamapps/common/Firewatch/Firewatch.app/Contents/Resources/Data
file_2=Audio/
link_2=~/Library/Application Support/Steam/steamapps/common/Firewatch/Firewatch.app/Contents/Resources/Data/StreamingAssets/Audio/GeneratedSoundBanks/Windows/English(US)
file_3=Text/
link_3=~/Library/Application Support/CampoSanto/Firewatch/Localization
```
де  
`file_*` - це файли або теки з файлами, які треба скопіювати.  
`link_*` - це кінцеві посилання на теки, куди треба скопіювати файли.  
**У майбутьньому також треба буде Ваша допомога у наповнені бази та тестувані :)**
