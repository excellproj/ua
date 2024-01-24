**Спроба спростити встановлення украЇнської локалізації в іграх на MacOS**  
**Це перші кроки. Скрипт написаний так, щоб працював у всіх користувачів `MacOS` однаково(я спродіваюся). Скрипт використовує оболонку `bash\sh`**  
**Тестувалося на `MacOS Sonoma` `14.3` ~~14.2.1~~**  
**Принцип роботи наступний:**  
Скрипт завантажує з `Google.Drive` архів з файлами локалізації гри, яку обрав користувач медотов вводу `ID гри`(щоб переглянути список доступних ігор можна вписати команду list або переглянути список [тут](https://github.com/excellproj/ua/tree/main#список-ігорgames-list)). В архіві є файлик `info`, який містить інструкції для інсталятора, що і куди копіювати та спецільно готується.  
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
***Зазвичай міститься уся доступна локалізація на момент додавання гри до бази(текст, звук, текстури тощо), якщо зʼявилося оновлення, то повідомте мене в _Discord:_ `matrixfello`***  
**У майбутьньому також треба буде Ваша допомога у наповнені бази та тестувані :)**  
### **Важливо!**  
* Я не є автором локалізацій(якщо не вказано інше), а тільки розпозповсюджувачем. Якщо ви автор локалізації та маєте бажання видалити її з цього проекту або додати, то звʼяжіться зі мною  в _Discord:_ `matrixfello`.  
* Єдиними каналими розповсюдження інсталятора на данний момент є(маю на увазі оригінал файлу):
   - Ця сторінка на Github => https://github.com/excellproj/ua
   - Google.Drive по цьому посиланню => https://drive.google.com/file/d/17CAbS6pqysgPqRk7JdlYXoqPDHhElU1c

### ***Список ігор/Games list***  
```
* Firewatch => firewatch
* AER Memories of Old => aer
```
