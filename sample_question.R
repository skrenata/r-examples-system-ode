## Consider an extension of the Lotka-Volterra predation model to describe 
## grazing of plants by herbivores. In the absence of herbivores, the plant
## biomass V(t) follows a logistic growth model with carrying capacity K and
## intrinsic growth rate r. Plant biomass is consumed at rate w*V*H, where
## H(t) is the herbivore's population density. The herbivores have a birth rate
## of b per unit of biomass consumed, and death rate m.
## dV/dt = rV(1 - V/k) - w*H*V = f(V,H)
## dH/dt = b*w*H*V - m*H = g(V,H)

f <- function(V,H,r,k,w){
	## differential equation for V(t)
	return(r*V*(1 - V/k) - w*H*V)
}

g <- function(V,H,r,k,w,b,m){
	## differential equation for H(t)
	return(b*w*H*V - m*H)
}

solveQuestion <- function(r=10, k=10, w=1, b=1, m=1, V0=3, H0=3) {
	## main function to solve system
  
	## define parameters for numerical solution
	t0 <- 0 ## initial time
	tf <- 50 ## final time
	h <- 0.01 ## time step
	N <- (tf - t0)/h ## total number of steps
	V <- c(V0, rep(0,N)) ## array to keep solutions for V(t)
	H <- c(H0, rep(0,N)) ## array to keep solutions for H(t)
  
	for(j in 1:N){
		## main loop to calculate approximate solutions
		## using a order 2 runge-kutta method 
		## if you want to learn more about numerical methods, see for example
		## page 18 of http://www.math.niu.edu/~dattab/MATH435.2013/NUMERICAL_ODE.IVP.pdf
		## but that's not important -  there are way better and more efficient 
		## packages to solve differential equations in R
		## I'm just using this here as I wanted a stand-alone code that wouldn't
		## require you to install any extra stuff
		k1 <- h*f(V[j],H[j],r,k,w)
		l1 <- h*g(V[j],H[j],r,k,w,b,m)
		k2 <- h*f(V[j]+k1,H[j]+l1,r,k,w)
		l2 <- h*g(V[j]+k1,H[j]+l1,r,k,w,b,m)
		V[j+1] <- V[j] + (k1+k2)/2
		H[j+1] <- H[j] + (l1+l2)/2
	}
	
	## plot results
	plot(V, H, type = "l", lwd=2, xlab = "", ylab = "", xlim = c(0,max(max(V),m/(b*w))), ylim = c(0,max(H)))
	title(main="Phase plane",  xlab = "Vegetation biomass", ylab = "Herbivore density")
	text(max(V)-1,max(H)-1, paste0("Parameters: ", "r=",r, ", k=",k, ", w=",w, ", b=",b, ", m=",m, 
									 "\nCondition k > m/(b*w): ", k > m/(b*w)))
	
	## V nullclines
	abline(v=0, col="red")
	lines((-1):(max(V)+10), r*(k - (-1):(max(V)+10))/(k*w), col="red") 
	## ^the weird line limits are to make sure R plots a complete line
	
	## H nullclines
	abline(h=0, col="blue")
	abline(v=m/(b*w), col="blue")
	
	## no need to return anything, graphic only
}
