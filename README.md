# Flutter Quiz App
Ez a Flutter alapú Quiz alkalmazás egy egyszerű, többlépcsős kvízt valósít meg, ahol a felhasználó kérdésekre válaszolhat, és azonnal visszajelzést kap helyes vagy helytelen válasz esetén. Az alkalmazás végén összesíti a válaszokat, és lehetőséget biztosít az újraindításra.

#### A kvíz alkalmazás rugalmasan bővíthető, új kérdésekkel vagy funkciókkal, mint például időkorlát bevezetése, pontszámok mentése vagy különböző témák kezelése.


## Funkciók
Kérdések betöltése: Az alkalmazás egy data.json fájlban tárolt kérdéseket tölt be.

- **Több válaszlehetőség:** Minden kérdéshez több válaszlehetőség van, és a felhasználó kiválaszthatja a helyesnek vélt választ.

- **Azonnali visszajelzés:** A válasz leadása után azonnal visszajelzést kap a felhasználó arról, hogy helyes-e a válasz.

- **Kérdések száma:** Az alkalmazás megjeleníti a kérdések számát, és minden kérdésnél nyomon követi a felhasználó haladását.

- **Pontszám összesítés:** Az utolsó kérdés után az alkalmazás összesíti a pontszámot, és lehetőséget biztosít a kvíz újraindítására.


## Használat

- **Kérdések betöltése:** A kérdéseket és válaszokat egy JSON fájlban tároljuk, amelyet az alkalmazás az assets/data.json fájlból tölt be.

- **A játék elindítása:** Az alkalmazás a QuizPage widgetet használja, amely betölti a kérdéseket, és megjeleníti a kvízt.

- **Válaszadás:** A felhasználó a válaszokra kattintva adhatja meg a választ, és azonnal láthatja, hogy helyes-e az adott válasz.

- **Kvíz újraindítása:** A kvíz végén lehetőség van az újraindításra.

# Kódszerkezet:

- **loadQuestions():** Betölti a kérdéseket egy JSON fájlból.

- **checkAnswer():** Ellenőrzi, hogy a felhasználó által adott válasz helyes-e.

- **nextQuestion():** Továbbviszi a felhasználót a következő kérdésre.

- **restartQuiz():** Újraindítja a kvízt az elejéről.

## Telepítés

Klónozd a repository-t:

```https://github.com/dajkagabi/flutter_quiz.git```

- IDE kiválasztása (Visual Studio Code, Android Studio)
  
- Nyisd meg a projektet a Flutter SDK-val.

- Futtasd az alkalmazást:

```flutter run```

## UI Elemek

- **AppBar:** Az alkalmazás tetején helyezkedik el, és tartalmazza az alkalmazás címét.
- **Válaszgombok:** Mindegyik kérdéshez több gomb tartozik, amelyek közül a felhasználó választhat.
- **Visszajelzések:** A kérdés megválaszolása után azonnal visszajelzést kap a felhasználó.
- **Pontszám összesítés:** A kvíz végén megjelenik egy összesítő, amely jelzi, hogy hány kérdésre válaszolt helyesen a felhasználó.




