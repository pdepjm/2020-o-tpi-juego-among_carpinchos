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
- ⚙️Menu de selección de cantidad de personajes y gestor de los marcos para el juego!(**HECHO - MEJORABLE**)
- 🚪Portales (**HECHO**)
- 👼Pacman tiene 5s de inmunidad cada vez que spawnea en el mapa, para evitar las autodeath (**HECHO**)
- 👻Fantasmas (enemigos):
    - Modelar con clases e instanciar (**HECHO - MEJORABLE**)
    - 👣Tipos de movimiento:
        - ❓Explorador: Aleatorio evitando los muros y la posicion anterior (**HECHO**)
        - 👿Cazador: Buscar al jugador mas cercano (**HECHO**)
        - 🕵️Stalker: Busca a un jugador fijo, de éste perder, busca a otro (**HECHO**)
        - 🙈Tímido: siempre busca alejarse de todos los personajes (**HECHO**)
        - 🤔Tonto: Nunca puede decidirse a quien seguir(**HECHO**)
    - ☠️Al morir reaparecen con otro nombre, actitud y aporta diferente puntaje (**HECHO**)
    - 🎭Cada actitud tiene su imagen identificativa (**HECHO**)
- 🍽️Alimentos (powerups y puntos):
    - Modeladas con clases (que heredan de otra clase principal (**HECHO -  MEJORABLE**)
    - 💯💥Otorgan puntos y/o algún poder: (**HECHO - MEJORABLE**)
        - 🍒Cereza: letalidad (**HECHO**)
        - 🍌Bananas: letalidad prolongada (**HECHO**)
        - ❤️Corazones: aumentar vida (**HECHO**)
        - 🍕pizza: aumentar vida y letalidad (**HECHO**)
    - Comportamiento diferente: (**HECHO - MEJORABLE**)
        - ❄️Cada fruta tiene su propio cooldown para reaparecer (**HECHO**)
## Integrantes 😁
- Da Ruos, Ailén
- Escalante, Leandro
- Obezzi, Matías
- Troisi, Bruno