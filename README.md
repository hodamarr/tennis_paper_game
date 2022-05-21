# tennis (paper game)
This is an implementation for [https://en.wikipedia.org/wiki/Tennis_(paper_game)](tennis (paper game)) in bash

Tennis is an (abstract) strategic pencil and paper game for two players. The game field consists of 4 fields and a centre line. These are called (-2,-1,0,1,2), with negative numbers belonging to player 1, positive to player 2. At start, the ball is at the centre line (0).

Both players start with the same initial number (e.g. 50 points). In each draw, both players choose a number, and the ball is moved towards the player with the smallest number. The number chosen reduces the points for the next draws. The aim of the game is to move the ball beyond the second field of the opponent. 

## Dependencies
* Linux or MacOS
* Git

## Installation
1. Clone the repository:  
    ```
    $ git clone https://github.com/hodamarr/tennis_paper_game.git
    ```
    or download the file "tennis.sh".
2. Open the project folder from the Terminal.
3. Type the following:  
    ```
    $ chmod 700 ./tennis.sh
    ```
4. Run the script "./tennis.sh".
5. Enjoy.
