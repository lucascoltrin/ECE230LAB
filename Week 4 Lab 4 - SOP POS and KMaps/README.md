# Lab 04 - SOP/POS and KMaps

In this lab, you’ve learned how to apply KMaps, Sum Of Products and Products of
sums to simplify digital logic equations. Then, you’ve proven out that they work
using an implemented design on your Basys3 boards.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Summary

In this lab we learned how to use KMaps to produce a minimized POS and SOP of a given function.
This was then verified by simulation to confirm it is the same as the given function.

## Lab Questions

### Why are the groups of 1’s (or 0’s) that we select in the KMap able to go across edges?
Because KMaps are cylindrical as only one variable changes when you cross edges.
### Why are the names Sum of Products and Products of Sums?
This is because OR is viewed as addition and AND is viewed as multiplication. Minterms
come from AND, which is the combined with OR, hence a sum of products, and vice versa with
Products of Sums.
### Open the test.v file – how are we able to check that the signals match using XOR?
Using XOR, if the output is 0, that means all inputs are the same, and if it is 1,
there is at least one input that is different, meaning the signals don't match.
