# Build-Your-Own-wc-Tool

`wc` (word count) is a command-line tool in Linux used to gather various statistics from a given file or input stream. These statistics include the number of lines, word count, character count, and byte count in the specified file.

This is my implementation of `wc` using Ruby with some new features such as `OptionParse`

## Usage

1. No arguments provided
   ```
   ./wccc.rb test.txt
   ```

2. With arguments
   ```
   ./wccc.rb -l test.txt

   ./wccc.rb -w test.txt

   ./wccc.rb -c test.txt

   ./wccc.rb -m test.txt
   ```

3. With standard input
   ```
    cat test.txt | ./wccc.rb -l

    cat test.txt | ./wccc.rb -w

    cat test.txt | ./wccc.rb -c

    cat test.txt | ./wccc.rb -m
   ```
## Note

Solution to the First Coding Challege in [John Crickett's Coding Challenges](https://codingchallenges.fyi/challenges/challenge-wc/).
