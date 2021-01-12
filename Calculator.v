module Calculator(A,B,result,s,a,b,c,d,unusedSeg);

	
		
   input [3:0] A; //First 4 bit binary input
   input [3:0] B; //Second 4 bit binary input
	output reg [7:0] result; //8 bit output value
	
	/* **** as explained in my revised proposal, which was aproved by prof, my output will be in Hexadecimal on the board **** */
	
	output [6:0] a,b,c,d; //seven segment display outputs
	
	input [1:0]s;	//2 bit state, this takes up two switches
	
	/* important note: My calculator does addition in when S is in 00 state, subtraction in when S is in 01 state,
	multiplication in when S is in 10 state, and division in when S is in 00 state. */
	
	//this checks if the value is negative, hence nC short for Negative Check
	//if value is negative it will be equal to 1, when it is equal to 1, the seven Segement code will output a negative sign.
	reg nC = 0; //I set it 0, by default so it will not have negative sign by default
	
  always@*
  
  begin
	if(s == 2'b00) //when state of S is in 00, addition
	begin
	
	result = A + B; //adding the two inputs
	nC = 0; //since our inputs are always positive, addition will always be positive
	
	end
	
	else if(s == 2'b01) //when state of S is in 11, subtraction
	begin
	if(A>=B) //when input is greater than or equal to input B
	begin
	
	result = A - B; //subtraction of the inputs when input A is greater than or equal to input B
	nC = 0; //since our inputs are always positive, subtraction will be positive only when input A is greater than input B or when A = B
	
	end
	
	else if(A<B) //when input A is less than input B
	begin
	
	result = B - A; //subtraction of the inputs when input A is less than input B
	nC = 1; //Even if inputs are always positive, output will always be negative for subtraction, when input A is less than input B
	
	end
	
	end
	
	
	else if(s == 2'b10) //when state of S is in 10, multiplication
	
	begin
	
	result = A * B; //multiplication of the inputs
	nC = 0; //since our inputs are always positive, multiplication will always be positive
	
	end
	
	else if (s == 2'b11) //when state of S is in 11, divison
	begin
	
	//for divison, quotient will be outputed on the left and then the remainder on the right
	
	result[7:4] =  (A / B); //this is the quotient
	result[3:0] = A % B; //this is the remainder or the modulus
	
	nC = 0; //since our inputs are always positive, divison will always be positive
	
	//Since you can't divide anything by 0 including 0 / 0, hence there error message "E1", I mentioned this in my revised proposal.
	if(B == 0)
	begin
	result[7:4] = 4'b1110; //this outputs E
	result[3:0] = 4'b0001; //this outputs 1
	end
	
	end
	
	end
	
	/* **** seven segement display of output and inputs **** */
	
	//here the right side of output will never be negative, only left side of output can be negative and thats only when you are doing
	//subtraction of input A is less than innput B.
	//So by default nC is 0, for right side of the output.
	
	sevSig(result[7:4],b,nC); //left side of the output hex1
	sevSig(result[3:0],a,0); //right side of the output hex0

	sevSig(A,c,0);//nC is 0 by default, as there is no negative in input
	sevSig(B,d,0);//nC is 0 by default, as there is no negative in input
	
	//Turning off both Hex 4 and Hex 2, 7-segement display as they are unused. and also the decimal point for all 7-segement displays.
	output reg [19:0] unusedSeg = 20'b11111111111111111111;
	
endmodule
