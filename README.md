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

6/1:
- PacMan death animation
- PacMan and Ghost now properly resets upon a new game after Game Over.

6/2:
- lives for PacMan
- PacMan passive animation (waka waka waka waka)

6/3:
- PacMan now only moves its mouth when he is moving

6/4
- ghosts' pathfinding now wraps around the screen
- ghosts have their speed halved in the side tunnel

6/5
- implemented the general ghost pathfinding to a target tile from the actual Pac-Man Game (simple distance instead of search algo)
- implemented Blinky's pathfinding
- the old Blinky is renamed to Perfection

6/6
- implemented Pinky
- Perfection is now named Stinky (because it's perfect so nobody likes it)

6/7
- implemented Clyde
- implemented Inky
- score now reset to the score of the beginning of the level upon death
- speed tweak (ghosts now move SLIGHTLY slower at 95% for first 5 levels)
- frightened mode movement (no animation or trigger yet)
- scatter mode movement with timing

6/8
- coded in new board that resembles the original game much better and has no wide passages
- fright mode trigger and timing and ghosts return home
- ghost orientation display (the eyes!)
- ghost fright display (includes blinking near the end)

6/9
- eating frightened ghosts rewards points, which is displayed and pauses the game for a short time

6/10
- score display fix at win or lose screen
- pellets no longer reset upon death, as per the original game
- extra life

6/11
- no new commits

6/12
- added cherry, an edible item that's just like the original game's bonus symbols
- cheat code: pressing the key 'p' in a level advances a level
- speed is now slower, especially on higher levels, so it's playable
- scatter/chase order and length have been adjusted to match original game

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

6/1:
- Worked on survival mode board generation
- rng board gen works, mode as input; can change number of 'islands' and where if wanted

6/2:
- made rng more random with more islands

6/3:
- began portals for survival

6/4:
- finished all start screen button looks with characters
- began cuztomization of pacman screen with arrows that help to decide
- visuals for both sides of a portal as well as positioning (not rng yet)

6/5:
- PacMan customization works with a color bank
- next and back buttons allow a player to customize PacMan

6/6:
- PacMan and ghosts are on the survival board
- Survival mode button added

6/7:
- Stinky can be chosen as a 5th ghost by player; releases at 90 eaten pellets (or is just there in survival mode)
- Blinky release time is now concurrent w/ real Pacman timing
- fixed tiny bugs
- All four ghosts spawn and work
- All four ghosts release at the right times (same as PacMan, a bit after, 30 pellets eaten, 60 eaten)


6/8:
- Fixed spawning bugs w/ new board
- Finished ghost customization with a symbol
- Portals disappear/stop working upon usage


## Design Document:
https://docs.google.com/document/d/1o4uHIYr6bDUU8YjrVuAWTHnPCBCr8zDS339r6GEzFfo/edit?usp=sharing
