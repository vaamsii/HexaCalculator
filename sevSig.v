module sevSig(bin,seg,nC);

		input [3:0]bin;
		output reg [6:0]seg;
		input nC; //This is negative Check, this is used to tell the seven segement output, when they are supposed to output a negative or not
		
	
		always@*
		begin
		
		if(nC == 0) //if the input is not negative run this
		begin
		
		//Segement 0 
		 seg[6] = ~bin[3]&~bin[2]&~bin[1]&bin[0] | ~bin[3]&bin[2]&~bin[1]&~bin[0] | bin[3]&bin[2]&~bin[1]&bin[0] | bin[3]&~bin[2]&bin[1]&bin[0];
		
		//Segement 1
		 seg[5] = ~bin[3]&bin[2]&~bin[1]&bin[0] | bin[3]&bin[2]&~bin[0] | bin[3]&bin[1]&bin[0] | bin[2]&bin[1]&~bin[0];
		
		//Segement 2
		 seg[4] = ~bin[3]&~bin[2]&bin[1]&~bin[0] | bin[3]&bin[2]&~bin[0] | bin[3]&bin[2]&bin[1];
		
		//Segement 3
		 seg[3] = bin[2]&bin[1]&bin[0] | ~bin[2]&~bin[1]&bin[0] | ~bin[3]&bin[2]&~bin[1]&~bin[0] | bin[3]&~bin[2]&bin[1]&~bin[0];
		
		//Segement 4
		 seg[2] = ~bin[3]&bin[0] | ~bin[3]&bin[2]&~bin[1] | ~bin[2]&~bin[1]&bin[0];
		
		//Segement 5
		 seg[1] = ~bin[3]&~bin[2]&bin[0] | ~bin[3]&~bin[2]&bin[1] | ~bin[3]&bin[1]&bin[0] | bin[3]&bin[2]&~bin[1]&bin[0];
		
		//Segement 6
		 seg[0] = ~bin[3]&~bin[2]&~bin[1] | ~bin[3]&bin[2]&bin[1]&bin[0] | bin[3]&bin[2]&~bin[1]&~bin[0];
		
		end
		
		else if(nC == 1)//if the input is negative run this
		begin
		//basically logic behind this is, it turns of all segements except segement G or seg[0], which is (-)
		//remember in seven segement display, 1 means off and 0 means on.
		 seg[6] = 1;
		 seg[5] = 1;
		 seg[4] = 1;
		 seg[3] = 1;
		 seg[2] = 1;
		 seg[1] = 1;
		 seg[0] = 0;
		end
		
		end
endmodule
