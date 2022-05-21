#!/bin/bash
player_1_score=50
player_2_score=50
player_1_choice=0
player_2_choice=0
ball_state=0
game=1

game_table(){
  echo " Player 1: ${player_1_score}         Player 2: ${player_2_score} "
  echo " --------------------------------- "
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  ball_place_on_table
  echo " |       |       #       |       | "
  echo " |       |       #       |       | "
  echo " --------------------------------- "

}

ball_place_on_table(){
	case $ball_state in

  3)
    echo " |       |       #       |       |O"
    ;;

  2)
    echo " |       |       #       |   O   | "
    ;;

  1)
    echo " |       |       #   O   |       | "
    ;;
  -1)
    echo " |       |   O   #       |       | "
    ;;

  -2)
    echo " |   O   |       #       |       | "
    ;;

  -3)
    echo "O|       |       #       |       | "
    ;;
   *)
    echo " |       |       O       |       | "
    ;;

esac

}


#return 0 - if the game still on
#return 1 - player 1 winning
#return 2 - player 2 winning
#return 3 - tie
win(){
	winner=0
	# check for winner by the rules
	if [[ $ball_state -eq -3 ]]; then
		winner=2

	elif [[ $ball_state -eq 3 ]]; then
		winner=1

	elif [[ $player_1_score -eq 0 ]] && [[ $player_2_score -eq 0 ]]; then
		if [[ ball_state -lt 0 ]]; then
			winner=2
		elif [[ ball_state -gt 0 ]]; then
			winner=1
		else
			winner=3
		fi

	elif [[ $player_1_score -eq 0 ]] && [[ $player_2_score -ne 0 ]]; then
		winner=2

	elif [[ $player_1_score -ne 0 ]] && [[ $player_2_score -eq 0 ]]; then
		winner=1
	fi

	if [[ $winner > 0 ]]; then
		((game=0))
		case $winner in
			1)
				echo "PLAYER 1 WINS !"
				;;
			2)
				echo "PLAYER 2 WINS !"
				;;
			3)
				echo "IT'S A DRAW !"
				;;
		esac
	fi

}

choose(){
# player 1
  flag=1
  while [[ $flag == 1 ]]; do
	echo "PLAYER 1 PICK A NUMBER:"
	read -s player_1_choice
	if [[ $player_1_choice =~ ^[0-9]+$ ]] && [[ $player_1_choice -le $player_1_score ]] ; then
	 ((flag=0))

	else
		 echo "NOT A VALID MOVE !"

	fi
  done


 flag=1
  #player 2
  while [[ $flag == 1 ]]; do
	echo "PLAYER 2 PICK A NUMBER:"
	read -s player_2_choice
	if [[ $player_2_choice =~ ^[0-9]+$ ]] && [[ $player_2_choice -le $player_2_score ]] ; then
	 ((flag=0))
	else
		 echo "NOT A VALID MOVE !"
	fi
  done

   ((player_1_score=player_1_score-player_1_choice))
   ((player_2_score=player_2_score-player_2_choice))
}

show_choice(){
	printf "       Player 1 played: ${player_1_choice}\n       Player 2 played: ${player_2_choice}\n\n"
}


play(){
  if [[ $player_1_choice -gt $player_2_choice ]]
	then
  	if [[ $ball_state > 0 ]]; then
  		((ball_state=ball_state+1))
  	else
  		((ball_state=1))
  	fi
  elif [[ $player_1_choice -lt $player_2_choice ]]
  	then
  	if [[ $ball_state < 0 ]]; then
  		((ball_state=ball_state-1))
  	else
  		((ball_state=-1))
  	fi
  fi
}

game_table
while [[ game -eq 1 ]]
do
	choose
	play
	game_table
	show_choice
	win
done



