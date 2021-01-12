# HexaCalculator - Verilog fPGA 

I used de-10 lite fPGA board for this and intel quartus prime for this project.

I did a calculator which does 4 main arithmetic operations, addition, subtraction, multiplication and division. However, when user chooses division, I also output the remainder along with the quotient. Therefore, in total I did 5 operations, as I also incorporated Mod operation, along with the 4 main arithmetic operations.

The calculator will have two inputs, the first input (A in the code) will take in a 4-bit binary number and the second input (B in the code) will take in a 4-bit binary number, using Sw0 to sw7. The inputs will be displayed on the seven-segment display, A will be in hex5 and B will be in hex3. The board will take in those physical binary inputs and perform those 4 arithmetic (Addition, subtraction, multiplication, and division) calculations as well as mod function. Then it will output in hexa-decimal on the seven-segment display. The inputs are also displayed in hexadecimal form on the seven-segment display, in hex1 and hex0.

Hex1 will output the carryover for addition, like how it was in lab 3, (i.e., 9 + 8 = 11); Hex0 will output the result, if there isn’t a carry over, if there is then the output will be in both displays. In addition, when A<B and you’re doing subtraction, Hex1 will display a negative sign, again similar to lab3; hex0 will output the result, i.e, 1 - 3 = -2, - would output in hex1 and 2 would output in hex0. For multiplication, both Hex1 and Hex0 will need to be used to display result, as the max result of calculator is F (1111) * F (1111), which is E1 (11100001), we can’t display this on one display. For division, quotient will be outputted on hex1 and the remainder will be outputted on hex0.

The switches, Sw8 and Sw9 are be taken up for the state of the operation, for example when both of them are off, its addition, when sw8 is on and sw9 is off then its subtraction, when sw9 is on and sw8 is off then its multiplication and when both are on then its division.

Some additional things to note, when doing division there is a restriction, such as "0 can't be divided by 0 or any number can't be by 0." This is the only error there is in my calculator, every other scenario is legal. If this were to occur, I would display “E1”, which means Error 1, I would output this in where the output of any operation would go.
