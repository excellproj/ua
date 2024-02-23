**Спроба спростити встановлення украЇнської локалізації в іграх на MacOS**  
**Це перші кроки. Скрипт написаний так, щоб працював у всіх користувачів `MacOS` однаково(я спродіваюся). Скрипт використовує оболонку `bash\sh`**  
### **Як скористатися?:** 
* ***`рекомендується зробити перший запуск гри для сворення потрібних тек`***
* Завантажити інсталятор(скрипт) `ua.sh` зручним для вас способом:  
  - з цієї сторінки `Github`(архів ZIP або `git clone https://github.com/excellproj/ua.git && cd ua && sh ua.sh` )
  - з `Google.Drive` по цьому посиланню => https://drive.google.com/file/d/17CAbS6pqysgPqRk7JdlYXoqPDHhElU1c  
      - Запустити інсталятор `ua.sh` в консолі зручним для вас способом
* Вписати доступний `ID гри` (доступний список по команді `list` або [тут](https://github.com/excellproj/ua/tree/main#список-ігорgames-list))
* Дочекатися кінця встановлення, грати :)  
  - P.S. також може знадобитися зміна мови в налаштуваннях гри
  
**Тестувалося на `MacOS Sonoma` `14.3` ~~`14.2.1`~~**  
**Принцип роботи наступний:**  
Скрипт завантажує з `Google.Drive` архів з файлами локалізації гри, яку обрав користувач медотов вводу `ID гри`(щоб переглянути список доступних ігор можна вписати команду `list` або переглянути список [тут](https://github.com/excellproj/ua/tree/main#список-ігорgames-list)). В архіві є файлик `info`, який містить інструкції для інсталятора, що і куди копіювати(деякі локалізації не працюють під `MacOS`, якщо не видалити деякі файли, тому я додав таку змогу в інсталятор) та спецільно готується.  
Приклад `info`:
```
file_1=Fonts+Textures/
link_1=~/Library/Application Support/Steam/steamapps/common/Firewatch/Firewatch.app/Contents/Resources/Data
del_1=warningpc.swf.gsc,warning.swf.gsc
delink_1=~/Library/Application Support/Steam/steamapps/common/BioShock Remastered/BioshockHDData/contentbaked/pc/flashmovies
```
де  
`file_*` - це файли або теки з файлами, які треба скопіювати.  
`link_*` - це кінцеві посилання на теки, куди треба скопіювати файли.  
`del_*`  - список файлів, які треба видалити.  
`delink_*` - посилання на теку/и, де треба видалити файли.  
***Зазвичай міститься уся доступна локалізація на момент додавання гри до бази(текст, звук, текстури тощо), якщо зʼявилося оновлення, то повідомте мене в _Discord:_ `matrixfello`***  
**У майбутьньому також треба буде Ваша допомога у наповнені бази та тестувані :)**  
### **Важливо!**  
* Я не є автором локалізацій(якщо не вказано інше), а тільки розпозповсюджувачем. Якщо ви автор локалізації та маєте бажання видалити її з цього проекту або додати, то звʼяжіться зі мною  в _Discord:_ `matrixfello`.  
* Єдиними каналими розповсюдження інсталятора на данний момент є(маю на увазі оригінал файлу):
   - Ця сторінка на `Github` => https://github.com/excellproj/ua
   - `Google.Drive` по цьому посиланню => https://drive.google.com/file/d/17CAbS6pqysgPqRk7JdlYXoqPDHhElU1c

### ***Список ігор/Games list***  
```
firewatch => Firewatch (текст + озвучення)
aer => AER Memories of Old (текст)
evoland_le => Evoland Legendary Edition (текст)
hollow_knight => Hollow Knight (текст)
bioshok_re => BioShok Remastered (текст)
outlast => Outlast + DLC (текст)
bastion => Bastion (текст + озвучення)
titan_souls => Titan Souls (текст)
swd2 => SteamWorld Dig 2 (текст)
twom => This War of Mine (текст)
mb_warband => Mount & Blade: Warband (текст)
hue => HUE (текст)
antichamber => Antichamber (текст)
blasphemous => Blasphemous (текст)
stray => Stray (текст | В налаштуваннях гри треба змінити мову на English)
everspace => EVERSPACE™ (текст | В налаштуваннях гри треба змінити мову на France(французьку) )

```
