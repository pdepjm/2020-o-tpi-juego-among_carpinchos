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
-   ![menu](assets/menu/1PlayerMenu.png) 
- ⚙️Menu de selección de cantidad de personajes y gestor de los marcos para el juego!(**HECHO - MEJORABLE**)
- ![closed](assets/portales/closed.png) ![in](assets/portales/closed.png) ![out](assets/enemigo/cyan.png)
- 🚪Portales (**HECHO**)
- ![closed](assets/wall.png)
- Muros no traspasables
- 👼Pacman tiene 5s de inmunidad cada vez que spawnea en el mapa, para evitar las autodeath (**HECHO**)
- ![ghost](assets/enemigo/red.png)
- 👻Fantasmas (enemigos):
    - Modelar con clases e instanciar (**HECHO - MEJORABLE**)
    - 👣Tipos de movimiento:
        - ![explorer](assets/enemigo/red/explorador.png) 
        - ❓Explorador: Aleatorio evitando los muros y la posicion anterior (**HECHO**)
        - ![hunter](assets/enemigo/red/hunter.png) 
        - 👿Cazador: Buscar al jugador mas cercano (**HECHO**)
        - ![stalker](assets/enemigo/red/stalker.png) 
        - 🕵️Stalker: Busca a un jugador fijo, de éste perder, busca a otro (**HECHO**)
        - ![shy](assets/enemigo/red/shy.png) 
        - 🙈Tímido: siempre busca alejarse de todos los personajes (**HECHO**)
        - ![dumb](assets/enemigo/red/dumb.png) 
        - 🤔Tonto: Nunca puede decidirse a quien seguir(**HECHO**)
    - ☠️Al morir reaparecen con otro nombre, actitud y aporta diferente puntaje (**HECHO**)
- 🍽️Alimentos (powerups y puntos):
    - Modeladas con clases (que heredan de otra clase principal (**HECHO -  MEJORABLE**)
    - Otorgan puntos y/o algún poder: (**HECHO - MEJORABLE**)
        - ![cherries](assets/frutas/cherry.png) 
        - Cerezas: letalidad (**HECHO**)
        - ![cherries](assets/frutas/banana.png) 
        - Bananas: letalidad prolongada (**HECHO**)
        - ![cherries](assets/frutas/heart.png) 
        - Corazones: aumentar vida (**HECHO**)
        - ![cherries](assets/frutas/pizza.png) 
        - pizzas: aumentar vida y letalidad (**HECHO**)
    - Comportamiento diferente: (**HECHO - MEJORABLE**)
        - ❄️Cada fruta tiene su propio cooldown para reaparecer (**HECHO**)
## Integrantes 😁
- Da Ruos, Ailén
- Escalante, Leandro
- Obezzi, Matías
- Troisi, Bruno