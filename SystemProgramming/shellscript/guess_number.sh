# guess the number game.

thefile=$(ls)
echo 'this is the variable assigend by command : '$thefile''

RANDOM_NUMBER=$(python -c 'import random; print(random.randint(1, 10))')
# echo $RANDOM_NUMBER is the created random value!

ANSWER=5          # The correct answer
CORRECT=false     # The correct flag

ANSWER=$RANDOM_NUMBER

while [ "$CORRECT" != "true" ]
do
        # Ask the user for the number...
        echo "Guess a number between 1 and 10. "
        read NUM

        # Validate the input...
        if [ "$NUM" -lt 1 ] || [ "$NUM" -gt 10 ]; then
                echo "The number must be between 1 and 10!"
        elif [ "$NUM" -eq "$ANSWER" ]; then
                echo "You got the answer correct!"
                CORRECT=true
        else
                echo "Sorry, incorrect."
        fi
done
