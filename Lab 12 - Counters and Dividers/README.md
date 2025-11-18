# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions
We learned about clock dividers and counters and how they work together.

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
Modulo counters have to do 2 counts to reach a single Hz, then it gets multiplied by Count for how many Hz you want to achieve.
### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
Because it has a default state of 1 and it counts down to zero before it resets, this is because Q is connected to the clock.
### 3 - What width of ring counter would you use to get to an output of ~1KHz?
You would need a width of 10 to reach a signal that small.
