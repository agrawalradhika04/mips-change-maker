# mips-change-maker
This MIPS assembly program calculates how to return a given amount of change using custom coin denominations provided by the user. It prompts the user for an amount of change (in cents), accepts a list of coin denominations, and determines how many coins of each type are needed to make the exact change. All logic is implemented using proper register usage and system calls in MIPS assembly, following the conventions outlined in the assignment specifications. The program continues to run until the user decides to exit.

Functionality Included: 

- Accepts an integer amount of change in cents from the user.

- Validates that the entered amount is a positive integer.

- Prompts the user for the number of coin denominations (maximum of 10).

- Reads in that many denomination values into an array.

- For each denomination, calculates the number of coins that can be used and prints the result.

- Denominations that do not contribute any coins are skipped in the output.

- Asks the user whether they want to perform another calculation and repeats accordingly.



