## first, load the sample_question.R file (either copy/paste, or source the file)

## you can call solveQuestion() to see a solution using the default parameters:
solveQuestion()

## to choose your own parameters:
solveQuestion(r = 10, k = 10, w = 1, b = 1, m = 2)
## a solution without coexistence:
solveQuestion(r = 10, k = 9, w = 1, b = 1, m = 10)

## i would recommend leaving r = 10 or at another "large" number, if you choose
## a small value for r it can get difficult to see the solution trajectory
## note: the green dot marks the end point of the trajectory
