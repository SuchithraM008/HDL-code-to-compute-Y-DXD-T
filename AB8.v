module AB8 #(parameter N = 8)(A0,A1,A2,A3,A4,A5,A6,A7,B00,B01,B02,B03,B04,B05,B06,B07,B10,B11,B12,B13,B14,B15,B16,B17,B20,B21,B22,B23,B24,B25,B26,B27,B30,B31,B32,B33,B34,B35,B36,B37,B40,B41,B42,B43,B44,B45,B46,B47,B50,B51,B52,B53,B54,B55,B56,B57,B60,B61,B62,B63,B64,B65,B66,B67,B70,B71,B72,B73,B74,B75,B76,B77,clk,rst,start,done,Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7);
input [N-1:0]A0,A1,A2,A3,A4,A5,A6,A7;
input [N-1:0]B00,B01,B02,B03,B04,B05,B06,B07,B10,B11,B12,B13,B14,B15,B16,B17,B20,B21,B22,B23,B24,B25,B26,B27,B30,B31,B32,B33,B34,B35,B36,B37,B40,B41,B42,B43,B44,B45,B46,B47,B50,B51,B52,B53,B54,B55,B56,B57,B60,B61,B62,B63,B64,B65,B66,B67,B70,B71,B72,B73,B74,B75,B76,B77;
input clk,rst,start;
output  done;
output [2*N+2:0]Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
ATB8 #(.N(N))Row_1(.A0(A0),.A1(A1),.A2(A2),.A3(A3),.A4(A4),.A5(A5),.A6(A6),.A7(A7),.B0(B00),.B1(B10),.B2(B20),.B3(B30),.B4(B40),.B5(B50),.B6(B60),.B7(B70),.clk(clk),.rst(rst),.start(start),.done(done),.Y(Y0));
ATB8 #(.N(N))Row_2(.A0(A0),.A1(A1),.A2(A2),.A3(A3),.A4(A4),.A5(A5),.A6(A6),.A7(A7),.B0(B01),.B1(B11),.B2(B21),.B3(B31),.B4(B41),.B5(B51),.B6(B61),.B7(B71),.clk(clk),.rst(rst),.start(start),.done(done),.Y(Y1));
ATB8 #(.N(N))Row_3(.A0(A0),.A1(A1),.A2(A2),.A3(A3),.A4(A4),.A5(A5),.A6(A6),.A7(A7),.B0(B02),.B1(B12),.B2(B22),.B3(B32),.B4(B42),.B5(B52),.B6(B62),.B7(B72),.clk(clk),.rst(rst),.start(start),.done(done),.Y(Y2));
ATB8 #(.N(N))Row_4(.A0(A0),.A1(A1),.A2(A2),.A3(A3),.A4(A4),.A5(A5),.A6(A6),.A7(A7),.B0(B03),.B1(B13),.B2(B23),.B3(B33),.B4(B43),.B5(B53),.B6(B63),.B7(B73),.clk(clk),.rst(rst),.start(start),.done(done),.Y(Y3));
ATB8 #(.N(N))Row_5(.A0(A0),.A1(A1),.A2(A2),.A3(A3),.A4(A4),.A5(A5),.A6(A6),.A7(A7),.B0(B04),.B1(B14),.B2(B24),.B3(B34),.B4(B44),.B5(B54),.B6(B64),.B7(B74),.clk(clk),.rst(rst),.start(start),.done(done),.Y(Y4));
ATB8 #(.N(N))Row_6(.A0(A0),.A1(A1),.A2(A2),.A3(A3),.A4(A4),.A5(A5),.A6(A6),.A7(A7),.B0(B05),.B1(B15),.B2(B25),.B3(B35),.B4(B45),.B5(B55),.B6(B65),.B7(B75),.clk(clk),.rst(rst),.start(start),.done(done),.Y(Y5));
ATB8 #(.N(N))Row_7(.A0(A0),.A1(A1),.A2(A2),.A3(A3),.A4(A4),.A5(A5),.A6(A6),.A7(A7),.B0(B06),.B1(B16),.B2(B26),.B3(B36),.B4(B46),.B5(B56),.B6(B66),.B7(B76),.clk(clk),.rst(rst),.start(start),.done(done),.Y(Y6));
ATB8 #(.N(N))Row_8(.A0(A0),.A1(A1),.A2(A2),.A3(A3),.A4(A4),.A5(A5),.A6(A6),.A7(A7),.B0(B07),.B1(B17),.B2(B27),.B3(B37),.B4(B47),.B5(B57),.B6(B67),.B7(B77),.clk(clk),.rst(rst),.start(start),.done(done),.Y(Y7));

endmodule



                                 
                              