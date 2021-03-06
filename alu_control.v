//fsm module decides which operation ALI will execute
module ALUControl(andi,ori,addi,ALUOp,funct,ALUCon); 
    input [1:0] ALUOp; 
    input [5:0] funct; 
    input andi,ori,addi; 
    output [3:0] ALUCon; 
     
    reg [3:0] ALUCon; 
     
    always@(ALUOp or funct or andi or ori or addi) 
    begin 
      case(ALUOp) 
        2'b00://lw or sw 
           ALUCon = 4'b0010; 
         
        2'b01://beq 
           ALUCon = 4'b0110; 
         
        2'b10://R-type 
        begin 
           if(funct==6'b100100) 
              ALUCon = 4'b0000;//and 
           if(funct==6'b100101) 
              ALUCon = 4'b0001;//or 
           if(funct==6'b100000) 
              ALUCon = 4'b0010;//add 
           if(funct==6'b100010) 
              ALUCon = 4'b0110;//sub 
           if(funct==6'b101010) 
              ALUCon = 4'b0111;//slt 
        end 
      
    endcase 
    end 
 
         
     
endmodule 