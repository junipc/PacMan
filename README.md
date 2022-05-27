# PacMan
Our project begins on a start screen with the title of the game, “PacMan!”. The player (user) has the option to design a custom character (the PacMan) and custom ghosts. There are two modes: Classic mode and Survival mode. Classic mode is identical to the original PacMan; Survival mode has no collectible Pellets (or Cherries or PowerPellets), and rather has a goal to simply survive for the longest time possible with an increasing number of obstacles as time goes on.


## Development Log
### Juniper
5/23:
- created Processing file
- copied brief description from design doc over to README
- linked design doc (prototype) in README
- tested out merging

5/24:
- created abstract class Ghost and classes Blinky
- design (display method) for ghosts
- created PacMan class
- design (display method) for PacMan

5/25:
- added support for displaying PacMan in all four directions
- made direction of PacMan two variables instead of one
- working move method for PacMan that doesn't conform to a grid yet

5/26:
- PacMan movement! It works with keyboard control and is locked to the grid. It also wraps around the map!
- PacMan collision with wall!

5/27:
- Fixed wall collision problems

### Maya
5/23:
- tested merge conflict with Juniper in class
- added signatures/outlines for methods in Game
- began the Board class, default constructor

5/24:
- created Board class
- made 1/4th of the Classic mode int[][] map in Board based off google image
- decided dimensions of screen based off [r][c] of map;

5/25:
- finished map[][] in Board using for loops
- animated/display for Board class
- began Pellet class with an arrayList of Pellets in Game
- displayed pellets on the board for Classic mode

## Design Document:
https://docs.google.com/document/d/1o4uHIYr6bDUU8YjrVuAWTHnPCBCr8zDS339r6GEzFfo/edit?usp=sharing
