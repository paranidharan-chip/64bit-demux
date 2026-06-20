`timescale 1ns/1ps

module demux_tb();

// Test signals
reg data_in;
reg [5:0] sel;
wire [1:0] out_1x2;
wire [3:0] out_1x4;
wire [7:0] out_1x8;
wire [15:0] out_1x16;
wire [31:0] out_1x32;
wire [63:0] out_1x64;

// Instantiate all demux modules
demux1X2 u_demux1x2(
  .data_in(data_in),
  .sel(sel[0]),
  .out(out_1x2)
);

demux1X4 u_demux1x4(
  .data_in(data_in),
  .sel(sel[1:0]),
  .out(out_1x4)
);

demux1X8 u_demux1x8(
  .data_in(data_in),
  .sel(sel[2:0]),
  .out(out_1x8)
);

demux1X16 u_demux1x16(
  .data_in(data_in),
  .sel(sel[3:0]),
  .out(out_1x16)
);

demux1X32 u_demux1x32(
  .data_in(data_in),
  .sel(sel[4:0]),
  .out(out_1x32)
);

demux1X64 u_demux1x64(
  .data_in(data_in),
  .sel(sel[5:0]),
  .out(out_1x64)
);

// Test procedure
initial begin
  // Initialize all signals to known values
  data_in = 1'b0;
  sel = 6'b0;
  
  $dumpfile("demux_tb.vcd");
  $dumpvars(0, demux_tb);
  
  #5; // Wait for initialization
  
  $display("========== 1x2 DEMUX TEST ==========");
  test_1x2();
  
  $display("\n========== 1x4 DEMUX TEST ==========");
  test_1x4();
  
  $display("\n========== 1x8 DEMUX TEST ==========");
  test_1x8();
  
  $display("\n========== 1x16 DEMUX TEST ==========");
  test_1x16();
  
  $display("\n========== 1x32 DEMUX TEST ==========");
  test_1x32();
  
  $display("\n========== 1x64 DEMUX TEST ==========");
  test_1x64();
  
  $finish;
end

// Test 1x2 Demux
task test_1x2();
  integer i;
  begin
    for(i = 0; i < 2; i = i + 1) begin
      data_in = 1'b1;
      sel[0] = i;
      #10;
      $display("Time=%0t | data_in=%b, sel[0]=%b | out=%b", $time, data_in, sel[0], out_1x2);
      
      if(out_1x2 != (1 << i)) begin
        $display("ERROR: Expected out=%b, Got out=%b", (1 << i), out_1x2);
      end else begin
        $display("PASS");
      end
    end
  end
endtask

// Test 1x4 Demux
task test_1x4();
  integer i;
  begin
    for(i = 0; i < 4; i = i + 1) begin
      data_in = 1'b1;
      sel[1:0] = i;
      #10;
      $display("Time=%0t | data_in=%b, sel[1:0]=%b | out=%b", $time, data_in, sel[1:0], out_1x4);
      
      if(out_1x4 != (1 << i)) begin
        $display("ERROR: Expected out=%b, Got out=%b", (1 << i), out_1x4);
      end else begin
        $display("PASS");
      end
    end
  end
endtask

// Test 1x8 Demux
task test_1x8();
  integer i;
  begin
    for(i = 0; i < 8; i = i + 1) begin
      data_in = 1'b1;
      sel[2:0] = i;
      #10;
      $display("Time=%0t | data_in=%b, sel[2:0]=%b | out=%h", $time, data_in, sel[2:0], out_1x8);
      
      if(out_1x8 != (1 << i)) begin
        $display("ERROR: Expected out=%h, Got out=%h", (1 << i), out_1x8);
      end else begin
        $display("PASS");
      end
    end
  end
endtask

// Test 1x16 Demux
task test_1x16();
  integer i;
  begin
    for(i = 0; i < 16; i = i + 1) begin
      data_in = 1'b1;
      sel[3:0] = i;
      #10;
      $display("Time=%0t | data_in=%b, sel[3:0]=%b | out=%h", $time, data_in, sel[3:0], out_1x16);
      
      if(out_1x16 != (1 << i)) begin
        $display("ERROR: Expected out=%h, Got out=%h", (1 << i), out_1x16);
      end else begin
        $display("PASS");
      end
    end
  end
endtask

// Test 1x32 Demux
task test_1x32();
  integer i;
  begin
    for(i = 0; i < 32; i = i + 1) begin
      data_in = 1'b1;
      sel[4:0] = i;
      #10;
      if(i < 16)
        $display("Time=%0t | data_in=%b, sel[4:0]=%b | out[15:0]=%h", $time, data_in, sel[4:0], out_1x32[15:0]);
      else
        $display("Time=%0t | data_in=%b, sel[4:0]=%b | out[31:16]=%h", $time, data_in, sel[4:0], out_1x32[31:16]);
      
      if(out_1x32 != (1 << i)) begin
        $display("ERROR: Expected out=%h, Got out=%h", (1 << i), out_1x32);
      end else begin
        $display("PASS");
      end
    end
  end
endtask

// Test 1x64 Demux
task test_1x64();
  integer i;
  begin
    for(i = 0; i < 64; i = i + 1) begin
      data_in = 1'b1;
      sel[5:0] = i;
      #10;
      if(i < 16)
        $display("Time=%0t | sel[5:0]=%2d | out[15:0]=%h", $time, sel[5:0], out_1x64[15:0]);
      else if(i < 32)
        $display("Time=%0t | sel[5:0]=%2d | out[31:16]=%h", $time, sel[5:0], out_1x64[31:16]);
      else if(i < 48)
        $display("Time=%0t | sel[5:0]=%2d | out[47:32]=%h", $time, sel[5:0], out_1x64[47:32]);
      else
        $display("Time=%0t | sel[5:0]=%2d | out[63:48]=%h", $time, sel[5:0], out_1x64[63:48]);
      
      if(out_1x64 != (1 << i)) begin
        $display("ERROR: Expected out=%h, Got out=%h", (1 << i), out_1x64);
      end else begin
        $display("PASS");
      end
    end
  end
endtask

endmodule
