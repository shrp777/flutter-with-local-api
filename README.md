# Flutter + API Locale

Ce projet illustre la communication entre une application mobile et une API **locale**, nécessitant l'adaptation dynamique de l'adresse de l'API en fonction du type d'application (mobile : iOS / Android, web, desktop...).

## Installation et lancement de l'API

- se placer dans le dossier **api**
- installer les dépendances NPM : `npm i`
- démarrer l'API locale : `npm start`
- consulter l'API locale à l'adresse : <http://localhost:3333/fruits>

`curl -i localhost:3333/fruits`

```HTTP
HTTP/1.1 200 OK
X-Powered-By: Express
Access-Control-Allow-Origin: *
Content-Type: application/json; charset=utf-8
Content-Length: 524
ETag: W/"20c-/4K8TK/QKG4he+ZS44QE7K7kza0"
Date: Thu, 06 Jun 2024 15:15:07 GMT
Connection: keep-alive
Keep-Alive: timeout=5
```

```JSON
[{"name":"Pomme","id":1},{"name":"Poire","id":2},{"name":"Ananas","id":3},{"name":"Cerise","id":4},{"name":"Fraise","id":5},{"name":"Orange","id":6},{"name":"Citron","id":7},{"name":"Banane","id":8},{"name":"Kiwi","id":9},{"name":"Melon","id":10},{"name":"Mandarine","id":11},{"name":"Pastèque","id":12},{"name":"Abricot","id":13},{"name":"Clémentine","id":14},{"name":"Framboise","id":15},{"name":"Mangue","id":16},{"name":"Pêche","id":17},{"name":"Litchi","id":18},{"name":"Prune","id":19},{"name":"Groseille","id":20}]
```

- **Important** : la configuration CORS de l'API doit autoriser la communication avec un client situé sur un autre nom de domaine que celui de l'API.

## Installation et lancement de l'application mobile

- se placer dans le dossier **flutter_app**
- installer les dépendances : `flutter pub get`
- démarrer l'application mobile : `flutter run`

## Résultat attendu

L'application doit afficher une liste de 20 fruits.

--

!["Logotype Shrp"](https://sherpa.one/images/sherpa-logotype.png)

**Alexandre Leroux**  
_Enseignant / Formateur_  
_Développeur logiciel web & mobile_

Nancy (Grand Est, France)

<https://shrp.dev>
