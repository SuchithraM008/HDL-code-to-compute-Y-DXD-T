module AB8x8 #(parameter N = 8)(A00,A01,A02,A03,A04,A05,A06,A07,A10,A11,A12,A13,A14,A15,A16,A17,A20,A21,A22,A23,A24,A25,A26,A27,A30,A31,A32,A33,A34,A35,A36,A37,A40,A41,A42,A43,A44,A45,A46,A47,A50,A51,A52,A53,A54,A55,A56,A57,A60,A61,A62,A63,A64,A65,A66,A67,A70,A71,A72,A73,A74,A75,A76,A77,B00,B01,B02,B03,B04,B05,B06,B07,B10,B11,B12,B13,B14,B15,B16,B17,B20,B21,B22,B23,B24,B25,B26,B27,B30,B31,B32,B33,B34,B35,B36,B37,B40,B41,B42,B43,B44,B45,B46,B47,B50,B51,B52,B53,B54,B55,B56,B57,B60,B61,B62,B63,B64,B65,B66,B67,B70,B71,B72,B73,B74,B75,B76,B77,clk,reset,done,Y00,Y01,Y02,Y03,Y04,Y05,Y06,Y07,Y10,Y11,Y12,Y13,Y14,Y15,Y16,Y17,Y20,Y21,Y22,Y23,Y24,Y25,Y26,Y27,Y30,Y31,Y32,Y33,Y34,Y35,Y36,Y37,Y40,Y41,Y42,Y43,Y44,Y45,Y46,Y47,Y50,Y51,Y52,Y53,Y54,Y55,Y56,Y57,Y60,Y61,Y62,Y63,Y64,Y65,Y66,Y67,Y70,Y71,Y72,Y73,Y74,Y75,Y76,Y77);

input [N-1:0]A00,A01,A02,A03,A04,A05,A06,A07,A10,A11,A12,A13,A14,A15,A16,A17,A20,A21,A22,A23,A24,A25,A26,A27,A30,A31,A32,A33,A34,A35,A36,A37,A40,A41,A42,A43,A44,A45,A46,A47,A50,A51,A52,A53,A54,A55,A56,A57,A60,A61,A62,A63,A64,A65,A66,A67,A70,A71,A72,A73,A74,A75,A76,A77;
input [N-1:0]B00,B01,B02,B03,B04,B05,B06,B07,B10,B11,B12,B13,B14,B15,B16,B17,B20,B21,B22,B23,B24,B25,B26,B27,B30,B31,B32,B33,B34,B35,B36,B37,B40,B41,B42,B43,B44,B45,B46,B47,B50,B51,B52,B53,B54,B55,B56,B57,B60,B61,B62,B63,B64,B65,B66,B67,B70,B71,B72,B73,B74,B75,B76,B77;
input clk,reset;
output  reg done;
output reg [2*N+2:0]Y00,Y01,Y02,Y03,Y04,Y05,Y06,Y07,Y10,Y11,Y12,Y13,Y14,Y15,Y16,Y17,Y20,Y21,Y22,Y23,Y24,Y25,Y26,Y27,Y30,Y31,Y32,Y33,Y34,Y35,Y36,Y37,Y40,Y41,Y42,Y43,Y44,Y45,Y46,Y47,Y50,Y51,Y52,Y53,Y54,Y55,Y56,Y57,Y60,Y61,Y62,Y63,Y64,Y65,Y66,Y67,Y70,Y71,Y72,Y73,Y74,Y75,Y76,Y77;
reg start,rst;
wire dn;
reg [N-1:0]A0,A1,A2,A3,A4,A5,A6,A7;
wire [2*N+2:0]Y0,Y1,Y2,Y3,Y4,Y5,Y6,Y7;
reg [4:0]Count;
AB8 #(.N(N)) Call_1 (.A0(A0),.A1(A1),.A2(A2),.A3(A3),.A4(A4),.A5(A5),.A6(A6),.A7(A7),.B00(B00),.B01(B01),.B02(B02),.B03(B03),.B04(B04),.B05(B05),.B06(B06),.B07(B07),.B10(B10),.B11(B11),.B12(B12),.B13(B13),.B14(B14),.B15(B15),.B16(B16),.B17(B17),.B20(B20),.B21(B21),.B22(B22),.B23(B23),.B24(B24),.B25(B25),.B26(B26),.B27(B27),.B30(B30),.B31(B31),.B32(B32),.B33(B33),.B34(B34),.B35(B35),.B36(B36),.B37(B37),.B40(B40),.B41(B41),.B42(B42),.B43(B43),.B44(B44),.B45(B45),.B46(B46),.B47(B47),.B50(B50),.B51(B51),.B52(B52),.B53(B53),.B54(B54),.B55(B55),.B56(B56),.B57(B57),.B60(B60),.B61(B61),.B62(B62),.B63(B63),.B64(B64),.B65(B65),.B66(B66),.B67(B67),.B70(B70),.B71(B71),.B72(B72),.B73(B73),.B74(B74),.B75(B75),.B76(B76),.B77(B77),.clk(clk),.rst(rst),.start(start),.done(dn),.Y0(Y0),.Y1(Y1),.Y2(Y2),.Y3(Y3),.Y4(Y4),.Y5(Y5),.Y6(Y6),.Y7(Y7));

always @(posedge clk)
begin
if(reset==1'b1)
begin
	rst=1'b1;
	Count=5'd0;
	start=1'b0;
	done=1'b0;
	
end
else
begin
	if(rst==1'b1)
	begin
		rst=1'b0;
	end
		else if(Count < 8)
		begin
			if(Count==0)
			begin
				A0=A00;
				A1=A01;
				A2=A02;
				A3=A03;
				A4=A04;
				A5=A05;
				A6=A06;
				A7=A07;
				start=1'b1;
				if(dn==1'b1)
				begin
					Y00=Y0;
					Y01=Y1;
					Y02=Y2;
					Y03=Y3;
					Y04=Y4;
					Y05=Y5;
					Y06=Y6;
					Y07=Y7;
					Count=Count+1'b1;
					rst=1'b1;
					start=1'b0;
				end
			end
			else if(Count==1)
			begin
				A0=A10;
				A1=A11;
				A2=A12;
				A3=A13;
				A4=A14;
				A5=A15;
				A6=A16;
				A7=A17;
				start=1'b1;
				if(dn==1'b1)
				begin
					Y10=Y0;
					Y11=Y1;
					Y12=Y2;
					Y13=Y3;
					Y14=Y4;
					Y15=Y5;
					Y16=Y6;
					Y17=Y7;
					Count=Count+1'b1;
					start=1'b0;
					rst=1'b1;
				end
			end
			else if(Count==2)
			begin
				A0=A20;
				A1=A21;
				A2=A22;
				A3=A23;
				A4=A24;
				A5=A25;
				A6=A26;
				A7=A27;
				start=1'b1;
				if(dn==1'b1)
				begin
					Y20=Y0;
					Y21=Y1;
					Y22=Y2;
					Y23=Y3;
					Y24=Y4;
					Y25=Y5;
					Y26=Y6;
					Y27=Y7;
					Count=Count+1'b1;
					start=1'b0;
					rst=1'b1;
				end
			end
			else if(Count==3)
			begin
				A0=A30;
				A1=A31;
				A2=A32;
				A3=A33;
				A4=A34;
				A5=A35;
				A6=A36;
				A7=A37;
				start=1'b1;
				if(dn==1'b1)
				begin
					Y30=Y0;
					Y31=Y1;
					Y32=Y2;
					Y33=Y3;
					Y34=Y4;
					Y35=Y5;
					Y36=Y6;
					Y37=Y7;
					Count=Count+1'b1;
					start=1'b0;
					rst=1'b1;
				end
			end
			else if(Count==4)
			begin
				A0=A40;
				A1=A41;
				A2=A42;
				A3=A43;
				A4=A44;
				A5=A45;
				A6=A46;
				A7=A47;
				start=1'b1;
				if(dn==1'b1)
				begin
					Y40=Y0;
					Y41=Y1;
					Y42=Y2;
					Y43=Y3;
					Y44=Y4;
					Y45=Y5;
					Y46=Y6;
					Y47=Y7;
					Count=Count+1'b1;
					start=1'b0;
					rst=1'b1;
				end
			end
			else if(Count==5)
			begin
				A0=A50;
				A1=A51;
				A2=A52;
				A3=A53;
				A4=A54;
				A5=A55;
				A6=A56;
				A7=A57;
				start=1'b1;
				if(dn==1'b1)
				begin
					Y50=Y0;
					Y51=Y1;
					Y52=Y2;
					Y53=Y3;
					Y54=Y4;
					Y55=Y5;
					Y56=Y6;
					Y57=Y7;
					Count=Count+1'b1;
					start=1'b0;
					rst=1'b1;
				end
			end
			else if(Count==6)
			begin
				A0=A60;
				A1=A61;
				A2=A62;
				A3=A63;
				A4=A64;
				A5=A65;
				A6=A66;
				A7=A67;
				start=1'b1;
				if(dn==1'b1)
				begin
					Y60=Y0;
					Y61=Y1;
					Y62=Y2;
					Y63=Y3;
					Y64=Y4;
					Y65=Y5;
					Y66=Y6;
					Y67=Y7;
					Count=Count+1'b1;
					rst=1'b1;
					start=1'b0;
				end
			end
			else if(Count==7)
			begin
				A0=A70;
				A1=A71;
				A2=A72;
				A3=A73;
				A4=A74;
				A5=A75;
				A6=A76;
				A7=A77;
				start=1'b1;
				if(dn==1'b1)
				begin
					Y70=Y0;
					Y71=Y1;
					Y72=Y2;
					Y73=Y3;
					Y74=Y4;
					Y75=Y5;
					Y76=Y6;
					Y77=Y7;
					Count=Count+1'b1;
					rst=1'b1;
					start=1'b0;
					done=1'b1;
				end
			end
	
end	
end
end
endmodule
