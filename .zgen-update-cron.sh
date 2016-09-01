# Sleep for a pseudo-random amount of time, between 0 and 999 seconds.
# We use date +%N to give us the system clock in milliseconds in lieu of a random number.
# We use time so that it shows up in the log.
time sleep `date +%N | head -c 3`
source ~/.zshrc
zgen update
source ~/.zshrc
exit

