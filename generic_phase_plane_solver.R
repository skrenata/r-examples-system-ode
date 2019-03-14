solveSystem <- function(equationX, equationY, X0, Y0, t0=0, tf=30, h=0.01, ...) {

	## function to plot a phase plane for a system of two differential equations
  
  	## input values
	## equationX: text representing dX/dt
	## equationY: text representing dY/dt
	## X0, Y0: initial values for X(t), Y(t)
	## (note that you must use X and Y as your variables here)
	## t0, tf: starting and ending times, default to t0=0, tf=100
	## h: step in time to approximate solution, default to 0.01
	## ... all parameters required
	
	## define parameters for numerical solution
	N <- (tf - t0)/h ## total number of steps
	Xall <- c(X0, rep(0,N)) ## array to keep solutions for X(t)
	Yall <- c(Y0, rep(0,N)) ## array to keep solutions for Y(t)
	
	for(j in 1:N){
		## main loop to calculate approximate solutions
		## using a order 2 runge-kutta method 
		## if you want to learn more about numerical methods, see for example
		## page 18 of http://www.math.niu.edu/~dattab/MATH435.2013/NUMERICAL_ODE.IVP.pdf
		## but that's not important -  there are better and more efficient 
		## packages to solve differential equations in R
		## I'm just using this here as I wanted a stand-alone code that wouldn't
		## require you to install any extra stuff
		X <- Xall[j]
		Y <- Yall[j]
		k1 <- h*eval(parse(text=equationX), envir = list(X, Y, ...))
		l1 <- h*eval(parse(text=equationY), envir = list(X, Y, ...))
		
		X <- X + k1
		Y <- Y + l1
		k2 <- h*eval(parse(text=equationX), envir = list(X, Y, ...))
		l2 <- h*eval(parse(text=equationY), envir = list(X, Y, ...))
		
		Xall[j+1] <- Xall[j] + (k1+k2)/2
		Yall[j+1] <- Yall[j] + (l1+l2)/2
	}
	
	## plot results
	plot(Xall, Yall, type = "l", lwd=2, xlab = "", ylab = "", xlim = c(0,max(Xall)), ylim = c(0,max(Yall)))
	title(main="Phase plane",  xlab = "X(t)", ylab = "Y(t)")
	points(Xall[N+1], Yall[N+1], col="green", lwd=2)
}
