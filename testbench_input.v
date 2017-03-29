`timescale 1ns/1ps

module Pipelined_TestBench; 
     
   reg Clock; 
   integer i; 
 
   initial begin 
       Clock = 1; 
   end 
   //clock controls 
   always begin 
        Clock = ~Clock; 
        #25; 
  end 
   
   initial begin 
       
  // Instr Memory intialization 2104020
  pipelined.IM.regfile[0] = 32'h02104020;//add $t0, $t0, $s0
  pipelined.IM.regfile[4] = 32'hAD5F0002; //sw $ra, 2($t2)  
  pipelined.IM.regfile[8] = 32'h8CDA0002;//lw $t5, 2($t2) 
  pipelined.IM.regfile[12] = 32'h01244822;//sub $t1, $t1, $a0
  pipelined.IM.regfile[16] = 32'h01ED7025;//or $t6, $t7, $t5
  pipelined.IM.regfile[20] = 32'h02129824;//and $s3, $s0, $s2
  pipelined.IM.regfile[24] = 32'h8D4E0002;//lw $t6,2($t2) 
  pipelined.IM.regfile[28] = 32'hAC1C0008;//sw $gp,8($zero) 
  pipelined.IM.regfile[32] = 32'h8C020008;//lw $v0,8($zero) 
  pipelined.IM.regfile[36] = 32'h004D2024;//and $a0, $v0, $t5
  pipelined.IM.regfile[40] = 32'h008A2025;//or $a0, $a0, $t2
  pipelined.IM.regfile[44] = 32'h00824820;//add $t1, $a0, $v0
  pipelined.IM.regfile[48] = 32'h0089E82A;//slt $sp, $a0, $t1
   
  // Data Memory intialization 
  pipelined.DM.regfile[0] = 32'd8; 
  pipelined.DM.regfile[1] = 32'd1; 
   
  pipelined.piperegs.regfile[0] = 0; 
 
  // Register File initialization 
  for (i = 0; i < 32; i = i + 1) 
    pipelined.piperegs.regfile[i] = 32'd0; 
 
 
  end 
  //Instantiate cpu 
   cpu pipelined(Clock); 
     
endmodule 