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
- fixed wall collision problems

5/28:
- no new commits

5/29:
- PacMan now eats the pellets
- speed overhaul: speed now can be any float value

5/30:
- working Blinky movement! (shortest path to PacMan's current position)

5/31:
- placed ghost movement code in Ghost in preparation for other ghosts' algorithms

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

5/26:
- added PowerPellet class
- determined addition of points for PowerPellet and Pellet as well as their score methods
- animated/display for PowerPellets
- began Blinky

5/27:
- created PacMan-similar move(board) and canMove() for Blinky
- created constructor for Blinky using super() with additional vars
- began breadth-first algorithm for optimized move()

5/28:
- Added ghost to the board (Blinky)
- Added recursive moveHelper() for Blinky that does a breadth first search and also tells the direction Blinky should go
- added optimalMove() which is similar to PacMan's move()
- Blinky's move() now instead defines all necessary parameters for moveHelper so it doesn't interfere with the recursion

5/29:
- Added both PacMan fonts
- created start and congratulation screens that lead to the appropriate screens with buttons/keys
- created "Ready!" timer before each level
- created levels and speed increments per levels (higher level = more challenging)

5/30:
- fixed bugs - score reset bug, level reset bug
- made PacMan's speed lower per level
- created release MVP timed animation

5/31:
- made Game Over screen that leads to the start screen with a key
- note to use screen if ghost is over PacMan

## Design Document:
https://docs.google.com/document/d/1o4uHIYr6bDUU8YjrVuAWTHnPCBCr8zDS339r6GEzFfo/edit?usp=sharing
