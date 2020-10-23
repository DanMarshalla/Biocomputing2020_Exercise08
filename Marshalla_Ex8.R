### Dan Marshalla - Biocomputing Exercise08

# 1. Generate line graph showing score of UW and MSU as game progresses
## Load data
gameStats <- read.table(file="UWvMSU_1-22-13.txt")
## Create subset of score/time for each team
UW <- gameStats[gameStats$V2=="UW",]
MSU <- gameStats[gameStats$V2=="MSU",]
## Create column of cumulative score for each subset
for (i in 1:23){
  UW$V4[i] <- sum(as.numeric(UW[1:i,3]))
}

for (i in 1:27){
  MSU$V4[i] <- sum(as.numeric(MSU[1:i,3]))
}
## Create line plot for UW in red
par(col = 2)
plot(UW$V1,UW$V4,type='l',main="UW vs MSU 1-22-13", xlab="Time",ylab="Points")
## Add line plot for MSU in green to plot that also contains UW
par(col = 3)
lines(MSU$V1,MSU$V4)






# 2. Guess My Number game
## Generate a random number from 1 to 100
randNum <- sample(1:100, 1, replace = TRUE)
## The first piece for a player to read giving game background
print("I'm thinking of a number from 01 to 100")
## Prompts players with "Guess: " and player fills in their numeric guess (10 guesses are allowed)
## Note: single digit numbers need to be in 0# format (e.g. 05)
for (i in 1:10){
  maybe <- readline("Guess: ")
  # if guessed number is correct, print "correct!"
  if (maybe == randNum){
    print("correct!")              
  # if random number is lower than guessed number, print "lower"
  } else if (maybe > randNum){
    print("lower")
  # if random number is not 100, print "lower"
  } else if (maybe == "100"){
    print("lower")
  # if random number is higher than guessed number, print "higher"
  }  else {print("higher")
  }
}
