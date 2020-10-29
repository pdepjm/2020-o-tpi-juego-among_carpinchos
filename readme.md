# PacMan - TP Integrador POO

## Obetivos 📒

### 4/11/2020 📅

- Terminar el juego (**jajaj**)
- Tests:
    - Come banana -> puntos aumentan (**HECHO**)
    - Come banana y come enemigo -> puntos aumentan (**HECHO**)
    - Intena comer enemigo pero muere -> pierde una vida (**HECHO**)
- Comportamiento:
    - Los fantasmas se comportan de manera distinta (**HECHO**)
- Muros:
    - Generarlos de una mejor manera (**HECHO - MEJORABLE**)
    - Evitar las colecciones (**HECHO - MEJORABLE**)
- Movimientos:
    - Consultar si la proxima posición tiene un objeto atravesable (**HECHO**)
- Más de 2 personajes (skins) (**HECHO**)
- Más enemigos (**HECHO**)
- Portales (**HECHO**)

### 22/10/2020 📅

- Obstáculos/muros en  el medio (además de los bordes) (**HECHO**)
- Enemigos, que se mueven siempre de la misma forma (**HECHO**)
- Comer cocos e ir sumando puntos (**HECHO**)
- 1 power-up (el que quieran) (**HECHO**)

## Mapa 🗺️
![Mapa](assets/mapa.jpg)

## Mecánicas 🤓
![menu](assets/menu/1PlayerMenu.png) 
- ⚙️Menu de selección de cantidad de personajes y gestor de los marcos para el juego!(**HECHO - MEJORABLE**)
- ![closed](assets/portales/closed.png) ![in](assets/portales/in.png) ![out](assets/portales/out.png) Portales (**HECHO**)
- ![wall](assets/wall.png) Muros no traspasables
- ![mrPacman](assets/pacman/mrPacman/normal-right.png) ![msPacman](assets/pacman/msPacman/normal-right.png) Personajes:
    - ![healthbar](assets/healthbar/3-heart.png) Barra de salud para personajes (MAXIMO 5 VIDAS)
    - 👼 Personajes tienen 5s de inmunidad cada vez que spawnea en el mapa, para evitar las autodeath (**HECHO**)
- ![ghost](assets/enemigo/red.png) Fantasmas (enemigos):
    - Modelar con clases e instanciar (**HECHO - MEJORABLE**)
    - 👣Tipos de movimiento:
        - ![explorer](assets/enemigo/pink/explorador.png) Explorador: Aleatorio evitando los muros y la posicion anterior (**HECHO**)
        - ![hunter](assets/enemigo/red/hunter.png) Cazador: Buscar al jugador mas cercano (**HECHO**)
        - ![stalker](assets/enemigo/yellow/stalker.png) Stalker: Busca a un jugador fijo, de éste perder, busca a otro (**HECHO**)
        - ![shy](assets/enemigo/cyan/shy.png) Tímido: siempre busca alejarse de todos los personajes (**HECHO**)
        - ![dumb](assets/enemigo/lime/dumb.png) Tonto: Nunca puede decidirse a quien seguir(**HECHO**)
    - ☠️Al morir reaparecen con otro nombre, actitud y aporta diferente puntaje (**HECHO**)
- 🍽️Alimentos (powerups y puntos):
    - Modeladas con clases (que heredan de otra clase principal (**HECHO -  MEJORABLE**)
    - ❄️Cada fruta tiene su propio cooldown para reaparecer (**HECHO**)
    - Otorgan puntos y/o algún poder: (**HECHO - MEJORABLE**)
        - ![coin](assets/frutas/coin.png) Monedas: Sin efecto (**HECHO**)
        - ![cherry](assets/frutas/cherry.png) Cerezas: letalidad (**HECHO**)
        - ![banana](assets/frutas/banana.png) Bananas: letalidad prolongada (**HECHO**)
        - ![heart](assets/frutas/heart.png) Corazones: aumentar vida (**HECHO**)
        - ![pizza](assets/frutas/pizza.png) Pizzas: aumentar vida y letalidad (**HECHO**)
        - ![chilly](assets/frutas/chilly.png) Chillys: hacen aparecer una bola de fuego que envuelve al personaje (**HECHO**)
            - ![fireball](assets/mini-fireball.png)Bola de fuego: todo lo que alcance su radio, es autoamticamente ingerido por el personaje que la invocó
## Integrantes 😁
- Da Ruos, Ailén
- Escalante, Leandro
- Obezzi, Matías
- Troisi, Bruno