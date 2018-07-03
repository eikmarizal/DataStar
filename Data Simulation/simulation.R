#Law of large number
sample(1:6, 1, T)
DiceSim = function(goal, numRe) {
  numHits = 0
  for (i in 1: numRe){
    rolls = sample(1:6, nchar(goal),replace=T)
    match = 0
    for (j in 1:nchar(goal)){
      if(rolls[j] == substr(goal,j,j)) match=match+1
    }
    if (match==nchar(goal)) numHits=numHits =numHits+1
  }
  
  Prob=numHits/numRe
  return(Prob)
}

set.seed(1)
DiceSim(222,50000)
# What is the probability of at least two people in a group having same birthday?
# If there are 367 people in the group?
# What about smaller group, say a group of 15?

SameDate = function(numPeople, numSame){
  birthdays = vector(mode='numeric',length=366)
  for(i in 1:numPeople){
    birthDate=sample(1:366, 1, T)
    birthdays[birthDate] = birthdays[birthDate]+1
  }
  return(max(birthdays)>=numSame)
}
SameDate(15,2)

BirthdayProb = function(numPeople, numSame, numRe){
  numHits = 0
  for(t in 1:(numRe)){
    if(SameDate(numPeople, numSame)) numHits=numHits+1
  }
  return(numHits/numRe)
}

BirthdayProb(23,2,10)
Date=c(rep(seq(1,59),4),60,rep(seq(61,366),4))

# Monte carlo simulation

SimPoints = function(numPoints){
  inCircle=0
  for(i in 1:numPoints){
    x=runif(1,-1,1)
    y=runif(1,-1,1)
    if((x*x + y*y)^0.5 <=1.0) inCircle=inCircle+1
  }
}

#Random walk
rw = function(step){
  #Number of possible way
  x=c(0,0,1,-1)
  y=c(1,-1,0,0)
  walk=sample(1:4,step,replace=T)
  xpos=c(0,cumsum(x[walk]))
  ypos=c(0,cumsum(y[walk]))
  dist=sqrt(xpos[step+1]^2+ypos[step+1]^2)
  return(dist)
  
}

set.seed(2)
rw(1000)


simrw = function(step,numRe){
  estimates = vector(mode='numeric', length=(numRe))
  for(i in 1:numRe) estimates[i]= rw(step)
  exdist = sum(estimates)/numRe
  return(exdist)
}

set.seed(0)
simrw(10000,50000)

x=c(0,0,1,-1) #peculiar drunk
y=c(1.1,-0.9,0,0)

######################################################################3
#Drunkard's Walk Python
import numpy as np
def randomWalk(steps):
  distance = 0
x = 0  
y = 0
directions = ['N', 'E', 'S', 'W']  
for i in range(steps):
  a = np.random.choice(directions)  
if a == 'N':
  y += 1
elif a == 'S':
  y -= 1
elif a == 'E':
  x += 1
else:
  x -= 1
if i == steps-1:
  distance = np.sqrt(x**2 + y**2)
print('Last Location: ({}, {})'.format(x,y))
return distance

def randomWalk_mean(n_sim, steps):
  distance = []
for i in range(n_sim):
  distance.append(randomWalk(steps))
return np.mean(distance)

##Monte carlo
sample(1:6, 1, T)
DiceSim = function(goal, numRe) {
  numHits = 0
  for (i in 1: numRe){
    rolls = sample(1:6, nchar(goal),replace=T)
    match = 0
    for (j in 1:nchar(goal)){
      if(rolls[j] == substr(goal,j,j)) match=match+1
    }
    if (match==nchar(goal)) numHits=numHits =numHits+1
  }
  
  Prob=numHits/numRe
  return(Prob)
}

set.seed(1)
DiceSi m(222,50000)

# pi simulation python
def pi(size):
  x = np.random.uniform(size=size)
y = np.random.uniform(size=size)
return 4 * sum(x**2 + y**2 <= 1)/size

pi_no = []
def pi_value(n_simulations, size):
  for i in range(0, n_simulations):
  pi_value = pi(size)
pi_no.append(pi_value)

return np.mean(pi_no)
