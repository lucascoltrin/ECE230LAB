# Lab 05 - Combinatorial Logic

In this lab, you’ve learned real world applications of digital logic, as well
as how to assemble your own Verilog modules. In addition, you’ve learned how
the constraints file maps your inputs and outputs to real pins on the FPGA.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Lab Questions

Summary - In this lab we learned more about writing in Vivado. We just built on our understanding of Kmaps and
learned how to connect them together. Also learned how to use a constraint file.

### 1 - Explain the role of the Top Level file.
Connects the two circuits together and routes them from set switches to LEDS, manages surface level circuitry.
### 2 - Explain the function of the Constraints file.
It maps the specific board switches to the program variables.
### 3 - Was the selection of Minterm and Maxterm correct for each circuit? What would you have chosen?
In terms of simplicity it doesn't make much difference for these particular truth tables. Regardless of 
it being in Minterms or Maxterms, there would be the same number of implicants.
