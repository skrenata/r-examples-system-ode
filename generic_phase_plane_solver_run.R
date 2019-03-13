## this function will draw a phase plane for (almost) any system that you input
## the green dot marks the end point of the trajectory

## first, load generic_simple_system_solver.R (either copy-paste or source)
## then, provide the equations you want to solve (as a text string), and the
## numeric values of the parameters and initial conditions

## it is less pretty than the specific function (as it won't show the nullclines
## or hold fixed axis), but it gives you more flexibility to define your system

## for instance,
solveSystem(equationX = "2*X*Y - 4*X", equationY = "3*X*Y - 9*Y", X0 = 4, Y0 = 0.1)

## an example: the same plant / herbivore system from the other file
solveSystem(equationX = "r*X*(1 - X/k) - w*Y*X", equationY = "b*w*Y*X - m*Y", X0 = 1, Y0 = 1, r=1, k=10, w=1, b=0.5, m=1)

## note that, if you try a "fast" divergent system, you're likely to get an error
## as I said before, this code isn't exactly robust, it's just good enough for 
## "well behaved" systems...
