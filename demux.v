module demux1X2(
  input data_in,
  input sel,
  output reg [1:0]  out
);
  always@(*) begin
    out=2'b00;
   if(sel)begin
     out[1]=data_in;
   end 
   else  begin
    out[0]=data_in;
   end
  end
 endmodule

 module demux1X4(
   input data_in,
   input [1:0] sel,
   output [3:0] out
 );
   wire[1:0] w1;
   demux1X2 demux1(.data_in(data_in),.sel(sel[1]),.out(w1));

   demux1X2 demux2(.data_in(w1[0]),.sel(sel[0]),.out(out[1:0]));
   demux1X2 demux3(.data_in(w1[1]),.sel(sel[0]),.out(out[3:2]));
 endmodule

 module demux1X8(
   input data_in,
   input [2:0]sel,
   output[7:0] out
 );
   wire[3:0] w2;
   demux1X4 demux1(.data_in(data_in),.sel(sel[2:1]),.out(w2));

   demux1X2 demux2(.data_in(w2[0]),.sel(sel[0]),.out(out[1:0]));
   demux1X2 demux3(.data_in(w2[1]),.sel(sel[0]),.out(out[3:2]));
   demux1X2 demux4(.data_in(w2[2]),.sel(sel[0]),.out(out[5:4]));
   demux1X2 demux5(.data_in(w2[3]),.sel(sel[0]),.out(out[7:6]));

  endmodule

   module demux1X16(
     input data_in,
     input [3:0]sel,
     output [15:0]out
   );
     wire [7:0] w3;

     demux1X8 demux1(.data_in(data_in),.sel(sel[3:1]),.out(w3));

     demux1X2 demux2(.data_in(w3[0]),.sel(sel[0]),.out(out[1:0]));
     demux1X2 demux3(.data_in(w3[1]),.sel(sel[0]),.out(out[3:2]));
     demux1X2 demux4(.data_in(w3[2]),.sel(sel[0]),.out(out[5:4]));
     demux1X2 demux5(.data_in(w3[3]),.sel(sel[0]),.out(out[7:6]));
     demux1X2 demux6(.data_in(w3[4]),.sel(sel[0]),.out(out[9:8]));
     demux1X2 demux7(.data_in(w3[5]),.sel(sel[0]),.out(out[11:10]));
     demux1X2 demux8(.data_in(w3[6]),.sel(sel[0]),.out(out[13:12]));
     demux1X2 demux9(.data_in(w3[7]),.sel(sel[0]),.out(out[15:14]));
    endmodule

  module demux1X32(
    input data_in,
    input [4:0]sel,
    output [31:0] out
  );
    wire[15:0] w4;

    demux1X16 demux1(.data_in(data_in),.sel(sel[4:1]),.out(w4));
    
    demux1X2  demux2(.data_in(w4[0]),.sel(sel[0]),.out(out[1:0]));
    demux1X2  demux3(.data_in(w4[1]),.sel(sel[0]),.out(out[3:2]));
    demux1X2  demux4(.data_in(w4[2]),.sel(sel[0]),.out(out[5:4]));
    demux1X2  demux5(.data_in(w4[3]),.sel(sel[0]),.out(out[7:6]));
    demux1X2  demux6(.data_in(w4[4]),.sel(sel[0]),.out(out[9:8]));
    demux1X2  demux7(.data_in(w4[5]),.sel(sel[0]),.out(out[11:10]));
    demux1X2  demux8(.data_in(w4[6]),.sel(sel[0]),.out(out[13:12]));
    demux1X2  demux9(.data_in(w4[7]),.sel(sel[0]),.out(out[15:14]));
    demux1X2  demux10(.data_in(w4[8]),.sel(sel[0]),.out(out[17:16]));
    demux1X2  demux11(.data_in(w4[9]),.sel(sel[0]),.out(out[19:18]));
    demux1X2  demux12(.data_in(w4[10]),.sel(sel[0]),.out(out[21:20]));
    demux1X2  demux13(.data_in(w4[11]),.sel(sel[0]),.out(out[23:22]));
    demux1X2  demux14(.data_in(w4[12]),.sel(sel[0]),.out(out[25:24]));
    demux1X2  demux15(.data_in(w4[13]),.sel(sel[0]),.out(out[27:26]));
    demux1X2  demux16(.data_in(w4[14]),.sel(sel[0]),.out(out[29:28]));
    demux1X2  demux17(.data_in(w4[15]),.sel(sel[0]),.out(out[31:30]));

   endmodule

   module demux1X64(
     input data_in,
     input [5:0]sel,
     output [63:0] out
   );
     wire[31:0] w5;

     demux1X32 demux1(.data_in(data_in),.sel(sel[5:1]),.out(w5));

     demux1X2 demux2(.data_in(w5[0]),.sel(sel[0]),.out(out[1:0]));
     demux1X2 demux3(.data_in(w5[1]),.sel(sel[0]),.out(out[3:2]));
     demux1X2 demux4(.data_in(w5[2]),.sel(sel[0]),.out(out[5:4]));
     demux1X2 demux5(.data_in(w5[3]),.sel(sel[0]),.out(out[7:6]));
     demux1X2 demux6(.data_in(w5[4]),.sel(sel[0]),.out(out[9:8]));
     demux1X2 demux7(.data_in(w5[5]),.sel(sel[0]),.out(out[11:10]));
     demux1X2 demux8(.data_in(w5[6]),.sel(sel[0]),.out(out[13:12]));
     demux1X2 demux9(.data_in(w5[7]),.sel(sel[0]),.out(out[15:14]));
     demux1X2 demux10(.data_in(w5[8]),.sel(sel[0]),.out(out[17:16]));
     demux1X2 demux11(.data_in(w5[9]),.sel(sel[0]),.out(out[19:18]));
     demux1X2 demux12(.data_in(w5[10]),.sel(sel[0]),.out(out[21:20]));
     demux1X2 demux13(.data_in(w5[11]),.sel(sel[0]),.out(out[23:22]));
     demux1X2 demux14(.data_in(w5[12]),.sel(sel[0]),.out(out[25:24]));
     demux1X2 demux15(.data_in(w5[13]),.sel(sel[0]),.out(out[27:26]));
     demux1X2 demux16(.data_in(w5[14]),.sel(sel[0]),.out(out[29:28]));
     demux1X2 demux17(.data_in(w5[15]),.sel(sel[0]),.out(out[31:30]));
     demux1X2 demux18(.data_in(w5[16]),.sel(sel[0]),.out(out[33:32]));
     demux1X2 demux19(.data_in(w5[17]),.sel(sel[0]),.out(out[35:34]));
     demux1X2 demux20(.data_in(w5[18]),.sel(sel[0]),.out(out[37:36]));
     demux1X2 demux21(.data_in(w5[19]),.sel(sel[0]),.out(out[39:38]));
     demux1X2 demux22(.data_in(w5[20]),.sel(sel[0]),.out(out[41:40]));
     demux1X2 demux23(.data_in(w5[21]),.sel(sel[0]),.out(out[43:42]));
     demux1X2 demux24(.data_in(w5[22]),.sel(sel[0]),.out(out[45:44]));
     demux1X2 demux25(.data_in(w5[23]),.sel(sel[0]),.out(out[47:46]));
     demux1X2 demux26(.data_in(w5[24]),.sel(sel[0]),.out(out[49:48]));
     demux1X2 demux27(.data_in(w5[25]),.sel(sel[0]),.out(out[51:50]));
     demux1X2 demux28(.data_in(w5[26]),.sel(sel[0]),.out(out[53:52]));
     demux1X2 demux29(.data_in(w5[27]),.sel(sel[0]),.out(out[55:54]));
     demux1X2 demux30(.data_in(w5[28]),.sel(sel[0]),.out(out[57:56]));
     demux1X2 demux31(.data_in(w5[29]),.sel(sel[0]),.out(out[59:58]));
     demux1X2 demux32(.data_in(w5[30]),.sel(sel[0]),.out(out[61:60]));
     demux1X2 demux33(.data_in(w5[31]),.sel(sel[0]),.out(out[63:62]));

    endmodule

          
          
            
    


