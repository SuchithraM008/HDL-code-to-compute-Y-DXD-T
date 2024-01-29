module DXDT #(parameter N = 8)(X00,X01,X02,X03,X04,X05,X06,X07,X10,X11,X12,X13,X14,X15,X16,X17,X20,X21,X22,X23,X24,X25,X26,X27,X30,X31,X32,X33,X34,X35,X36,X37,X40,X41,X42,X43,X44,X45,X46,X47,X50,X51,X52,X53,X54,X55,X56,X57,X60,X61,X62,X63,X64,X65,X66,X67,X70,X71,X72,X73,X74,X75,X76,X77,clk,reset,done,Y00,Y01,Y02,Y03,Y04,Y05,Y06,Y07,Y10,Y11,Y12,Y13,Y14,Y15,Y16,Y17,Y20,Y21,Y22,Y23,Y24,Y25,Y26,Y27,Y30,Y31,Y32,Y33,Y34,Y35,Y36,Y37,Y40,Y41,Y42,Y43,Y44,Y45,Y46,Y47,Y50,Y51,Y52,Y53,Y54,Y55,Y56,Y57,Y60,Y61,Y62,Y63,Y64,Y65,Y66,Y67,Y70,Y71,Y72,Y73,Y74,Y75,Y76,Y77);

input [N-1:0]X00,X01,X02,X03,X04,X05,X06,X07,X10,X11,X12,X13,X14,X15,X16,X17,X20,X21,X22,X23,X24,X25,X26,X27,X30,X31,X32,X33,X34,X35,X36,X37,X40,X41,X42,X43,X44,X45,X46,X47,X50,X51,X52,X53,X54,X55,X56,X57,X60,X61,X62,X63,X64,X65,X66,X67,X70,X71,X72,X73,X74,X75,X76,X77;
output reg[N+11:0]Y00,Y01,Y02,Y03,Y04,Y05,Y06,Y07,Y10,Y11,Y12,Y13,Y14,Y15,Y16,Y17,Y20,Y21,Y22,Y23,Y24,Y25,Y26,Y27,Y30,Y31,Y32,Y33,Y34,Y35,Y36,Y37,Y40,Y41,Y42,Y43,Y44,Y45,Y46,Y47,Y50,Y51,Y52,Y53,Y54,Y55,Y56,Y57,Y60,Y61,Y62,Y63,Y64,Y65,Y66,Y67,Y70,Y71,Y72,Y73,Y74,Y75,Y76,Y77;
wire [2*N+2:0]Z00,Z01,Z02,Z03,Z04,Z05,Z06,Z07,Z10,Z11,Z12,Z13,Z14,Z15,Z16,Z17,Z20,Z21,Z22,Z23,Z24,Z25,Z26,Z27,Z30,Z31,Z32,Z33,Z34,Z35,Z36,Z37,Z40,Z41,Z42,Z43,Z44,Z45,Z46,Z47,Z50,Z51,Z52,Z53,Z54,Z55,Z56,Z57,Z60,Z61,Z62,Z63,Z64,Z65,Z66,Z67,Z70,Z71,Z72,Z73,Z74,Z75,Z76,Z77;
wire [2*N+10:0]P00,P01,P02,P03,P04,P05,P06,P07,P10,P11,P12,P13,P14,P15,P16,P17,P20,P21,P22,P23,P24,P25,P26,P27,P30,P31,P32,P33,P34,P35,P36,P37,P40,P41,P42,P43,P44,P45,P46,P47,P50,P51,P52,P53,P54,P55,P56,P57,P60,P61,P62,P63,P64,P65,P66,P67,P70,P71,P72,P73,P74,P75,P76,P77;
input clk,reset;
output  done; 
reg [N+3:0]DT00,DT01,DT02,DT03,DT04,DT05,DT06,DT07,DT10,DT11,DT12,DT13,DT14,DT15,DT16,DT17,DT20,DT21,DT22,DT23,DT24,DT25,DT26,DT27,DT30,DT31,DT32,DT33,DT34,DT35,DT36,DT37,DT40,DT41,DT42,DT43,DT44,DT45,DT46,DT47,DT50,DT51,DT52,DT53,DT54,DT55,DT56,DT57,DT60,DT61,DT62,DT63,DT64,DT65,DT66,DT67,DT70,DT71,DT72,DT73,DT74,DT75,DT76,DT77;
wire dn;
reg rst;
reg [N-1:0]D00,D01,D02,D03,D04,D05,D06,D07,D10,D11,D12,D13,D14,D15,D16,D17,D20,D21,D22,D23,D24,D25,D26,D27,D30,D31,D32,D33,D34,D35,D36,D37,D40,D41,D42,D43,D44,D45,D46,D47,D50,D51,D52,D53,D54,D55,D56,D57,D60,D61,D62,D63,D64,D65,D66,D67,D70,D71,D72,D73,D74,D75,D76,D77;
assign D00=8'd45;
assign D01=8'd45;
assign D02=8'd45;
assign D03=8'd45;
assign D04=8'd45;
assign D05=8'd45;
assign D06=8'd45;
assign D07=8'd45;

assign D10=8'd63;
assign D11=8'd53;
assign D12=8'd36;
assign D13=8'd12;
assign D14=-8'd12;
assign D15=-8'd36;
assign D16=-8'd53;
assign D17=-8'd63;

assign D20=8'd59;
assign D21=8'd24;
assign D22=-8'd24;
assign D23=-8'd59;
assign D24=-8'd59;
assign D25=-8'd24;
assign D26=8'd24;
assign D27=8'd59;

assign D30=8'd53;
assign D31=-8'd12;
assign D32=-8'd63;
assign D33=-8'd36;
assign D34=8'd36;
assign D35=8'd63;
assign D36=8'd12;
assign D37=-8'd53;

assign D40=8'd45;
assign D41=-8'd45;
assign D42=-8'd45;
assign D43=8'd45;
assign D44=8'd45;
assign D45=-8'd45;
assign D46=-8'd45;
assign D47=8'd45;

assign D50=8'd36;
assign D51=-8'd63;
assign D52=8'd12;
assign D53=8'd53;
assign D54=-8'd53;
assign D55=-8'd12;
assign D56=8'd63;
assign D57=-8'd36;

assign D60=8'd24;
assign D61=-8'd59;
assign D62=8'd59;
assign D63=-8'd24;
assign D64=-8'd24;
assign D65=8'd59;
assign D66=-8'd59;
assign D67=8'd24;

assign D70=8'd12;
assign D71=-8'd36;
assign D72=8'd53;
assign D73=-8'd63;
assign D74=8'd63;
assign D75=-8'd53;
assign D76=8'd36;
assign D77=-8'd12;

assign DT00=12'd45;
assign DT01=12'd45;
assign DT02=12'd45;
assign DT03=12'd45;
assign DT04=12'd45;
assign DT05=12'd45;
assign DT06=12'd45;
assign DT07=12'd45;

assign DT10=12'd63;
assign DT11=12'd53;
assign DT12=12'd36;
assign DT13=12'd12;
assign DT14=-12'd12;
assign DT15=-12'd36;
assign DT16=-12'd53;
assign DT17=-12'd63;

assign DT20=12'd59;
assign DT21=12'd24;
assign DT22=-12'd24;
assign DT23=-12'd59;
assign DT24=-12'd59;
assign DT25=-12'd24;
assign DT26=12'd24;
assign DT27=12'd59;

assign DT30=12'd53;
assign DT31=-12'd12;
assign DT32=-12'd63;
assign DT33=-12'd36;
assign DT34=12'd36;
assign DT35=12'd63;
assign DT36=12'd12;
assign DT37=-12'd53;

assign DT40=12'd45;
assign DT41=-12'd45;
assign DT42=-12'd45;
assign DT43=12'd45;
assign DT44=12'd45;
assign DT45=-12'd45;
assign DT46=-12'd45;
assign DT47=12'd45;

assign DT50=12'd36;
assign DT51=-12'd63;
assign DT52=12'd12;
assign DT53=12'd53;
assign DT54=-12'd53;
assign DT55=-12'd12;
assign DT56=12'd63;
assign DT57=-12'd36;

assign DT60=12'd24;
assign DT61=-12'd59;
assign DT62=12'd59;
assign DT63=-12'd24;
assign DT64=-12'd24;
assign DT65=12'd59;
assign DT66=-12'd59;
assign DT67=12'd24;

assign DT70=12'd12;
assign DT71=-12'd36;
assign DT72=12'd53;
assign DT73=-12'd63;
assign DT74=12'd63;
assign DT75=-12'd53;
assign DT76=12'd36;
assign DT77=-12'd12;

assign rst=dn?1'b0:1'b1;

AB8x8 #(.N(N)) Call_1 (.A00(X00),.A01(X01),.A02(X02),.A03(X03),.A04(X04),.A05(X05),.A06(X06),.A07(X07),.A10(X10),.A11(X11),.A12(X12),.A13(X13),.A14(X14),.A15(X15),.A16(X16),.A17(X17),.A20(X20),.A21(X21),.A22(X22),.A23(X23),.A24(X24),.A25(X25),.A26(X26),.A27(X27),.A30(X30),.A31(X31),.A32(X32),.A33(X33),.A34(X34),.A35(X35),.A36(X36),.A37(X37),.A40(X40),.A41(X41),.A42(X42),.A43(X43),.A44(X44),.A45(X45),.A46(X46),.A47(X47),.A50(X50),.A51(X51),.A52(X52),.A53(X53),.A54(X54),.A55(X55),.A56(X56),.A57(X57),.A60(X60),.A61(X61),.A62(X62),.A63(X63),.A64(X64),.A65(X65),.A66(X66),.A67(X67),.A70(X70),.A71(X71),.A72(X72),.A73(X73),.A74(X74),.A75(X75),.A76(X76),.A77(X77),.B00(D00),.B01(D10),.B02(D20),.B03(D30),.B04(D40),.B05(D50),.B06(D60),.B07(D70),.B10(D01),.B11(D11),.B12(D21),.B13(D31),.B14(D41),.B15(D51),.B16(D61),.B17(D71),.B20(D02),.B21(D12),.B22(D22),.B23(D32),.B24(D42),.B25(D52),.B26(D62),.B27(D72),.B30(D03),.B31(D13),.B32(D23),.B33(D33),.B34(D43),.B35(D53),.B36(D63),.B37(D73),.B40(D04),.B41(D14),.B42(D24),.B43(D34),.B44(D44),.B45(D54),.B46(D64),.B47(D74),.B50(D05),.B51(D15),.B52(D25),.B53(D35),.B54(D45),.B55(D55),.B56(D65),.B57(D75),.B60(D06),.B61(D16),.B62(D26),.B63(D36),.B64(D46),.B65(D56),.B66(D66),.B67(D76),.B70(D07),.B71(D17),.B72(D27),.B73(D37),.B74(D47),.B75(D57),.B76(D67),.B77(D77),.clk(clk),.reset(reset),.done(dn),.Y00(Z00),.Y01(Z01),.Y02(Z02),.Y03(Z03),.Y04(Z04),.Y05(Z05),.Y06(Z06),.Y07(Z07),.Y10(Z10),.Y11(Z11),.Y12(Z12),.Y13(Z13),.Y14(Z14),.Y15(Z15),.Y16(Z16),.Y17(Z17),.Y20(Z20),.Y21(Z21),.Y22(Z22),.Y23(Z23),.Y24(Z24),.Y25(Z25),.Y26(Z26),.Y27(Z27),.Y30(Z30),.Y31(Z31),.Y32(Z32),.Y33(Z33),.Y34(Z34),.Y35(Z35),.Y36(Z36),.Y37(Z37),.Y40(Z40),.Y41(Z41),.Y42(Z42),.Y43(Z43),.Y44(Z44),.Y45(Z45),.Y46(Z46),.Y47(Z47),.Y50(Z50),.Y51(Z51),.Y52(Z52),.Y53(Z53),.Y54(Z54),.Y55(Z55),.Y56(Z56),.Y57(Z57),.Y60(Z60),.Y61(Z61),.Y62(Z62),.Y63(Z63),.Y64(Z64),.Y65(Z65),.Y66(Z66),.Y67(Z67),.Y70(Z70),.Y71(Z71),.Y72(Z72),.Y73(Z73),.Y74(Z74),.Y75(Z75),.Y76(Z76),.Y77(Z77));

AB8x8 #(.N(N+4)) Call_2 (.A00(DT00),.A01(DT01),.A02(DT02),.A03(DT03),.A04(DT04),.A05(DT05),.A06(DT06),.A07(DT07),.A10(DT10),.A11(DT11),.A12(DT12),.A13(DT13),.A14(DT14),.A15(DT15),.A16(DT16),.A17(DT17),.A20(DT20),.A21(DT21),.A22(DT22),.A23(DT23),.A24(DT24),.A25(DT25),.A26(DT26),.A27(DT27),.A30(DT30),.A31(DT31),.A32(DT32),.A33(DT33),.A34(DT34),.A35(DT35),.A36(DT36),.A37(DT37),.A40(DT40),.A41(DT41),.A42(DT42),.A43(DT43),.A44(DT44),.A45(DT45),.A46(DT46),.A47(DT47),.A50(DT50),.A51(DT51),.A52(DT52),.A53(DT53),.A54(DT54),.A55(DT55),.A56(DT56),.A57(DT57),.A60(DT60),.A61(DT61),.A62(DT62),.A63(DT63),.A64(DT64),.A65(DT65),.A66(DT66),.A67(DT67),.A70(DT70),.A71(DT71),.A72(DT72),.A73(DT73),.A74(DT74),.A75(DT75),.A76(DT76),.A77(DT77),.B00(Z00[(2*N+2):(N-1)]),.B01(Z01[(2*N+2):(N-1)]),.B02(Z02[(2*N+2):(N-1)]),.B03(Z03[(2*N+2):(N-1)]),.B04(Z04[(2*N+2):(N-1)]),.B05(Z05[(2*N+2):(N-1)]),.B06(Z06[(2*N+2):(N-1)]),.B07(Z07[(2*N+2):(N-1)]),.B10(Z10[(2*N+2):(N-1)]),.B11(Z11[(2*N+2):(N-1)]),.B12(Z12[(2*N+2):(N-1)]),.B13(Z13[(2*N+2):(N-1)]),.B14(Z14[(2*N+2):(N-1)]),.B15(Z15[(2*N+2):(N-1)]),.B16(Z16[(2*N+2):(N-1)]),.B17(Z17[(2*N+2):(N-1)]),.B20(Z20[(2*N+2):(N-1)]),.B21(Z21[(2*N+2):(N-1)]),.B22(Z22[(2*N+2):(N-1)]),.B23(Z23[(2*N+2):(N-1)]),.B24(Z24[(2*N+2):(N-1)]),.B25(Z25[(2*N+2):(N-1)]),.B26(Z26[(2*N+2):(N-1)]),.B27(Z27[(2*N+2):(N-1)]),.B30(Z30[(2*N+2):(N-1)]),.B31(Z31[(2*N+2):(N-1)]),.B32(Z32[(2*N+2):(N-1)]),.B33(Z33[(2*N+2):(N-1)]),.B34(Z34[(2*N+2):(N-1)]),.B35(Z35[(2*N+2):(N-1)]),.B36(Z36[(2*N+2):(N-1)]),.B37(Z37[(2*N+2):(N-1)]),.B40(Z40[(2*N+2):(N-1)]),.B41(Z41[(2*N+2):(N-1)]),.B42(Z42[(2*N+2):(N-1)]),.B43(Z43[(2*N+2):(N-1)]),.B44(Z44[(2*N+2):(N-1)]),.B45(Z45[(2*N+2):(N-1)]),.B46(Z46[(2*N+2):(N-1)]),.B47(Z47[(2*N+2):(N-1)]),.B50(Z50[(2*N+2):(N-1)]),.B51(Z51[(2*N+2):(N-1)]),.B52(Z52[(2*N+2):(N-1)]),.B53(Z53[(2*N+2):(N-1)]),.B54(Z54[(2*N+2):(N-1)]),.B55(Z55[(2*N+2):(N-1)]),.B56(Z56[(2*N+2):(N-1)]),.B57(Z57[(2*N+2):(N-1)]),.B60(Z60[(2*N+2):(N-1)]),.B61(Z61[(2*N+2):(N-1)]),.B62(Z62[(2*N+2):(N-1)]),.B63(Z63[(2*N+2):(N-1)]),.B64(Z64[(2*N+2):(N-1)]),.B65(Z65[(2*N+2):(N-1)]),.B66(Z66[(2*N+2):(N-1)]),.B67(Z67[(2*N+2):(N-1)]),.B70(Z70[(2*N+2):(N-1)]),.B71(Z71[(2*N+2):(N-1)]),.B72(Z72[(2*N+2):(N-1)]),.B73(Z73[(2*N+2):(N-1)]),.B74(Z74[(2*N+2):(N-1)]),.B75(Z75[(2*N+2):(N-1)]),.B76(Z76[(2*N+2):(N-1)]),.B77(Z77[(2*N+2):(N-1)]),.clk(clk),.reset(rst),.done(done),.Y00(P00),.Y01(P01),.Y02(P02),.Y03(P03),.Y04(P04),.Y05(P05),.Y06(P06),.Y07(P07),.Y10(P10),.Y11(P11),.Y12(P12),.Y13(P13),.Y14(P14),.Y15(P15),.Y16(P16),.Y17(P17),.Y20(P20),.Y21(P21),.Y22(P22),.Y23(P23),.Y24(P24),.Y25(P25),.Y26(P26),.Y27(P27),.Y30(P30),.Y31(P31),.Y32(P32),.Y33(P33),.Y34(P34),.Y35(P35),.Y36(P36),.Y37(P37),.Y40(P40),.Y41(P41),.Y42(P42),.Y43(P43),.Y44(P44),.Y45(P45),.Y46(P46),.Y47(P47),.Y50(P50),.Y51(P51),.Y52(P52),.Y53(P53),.Y54(P54),.Y55(P55),.Y56(P56),.Y57(P57),.Y60(P60),.Y61(P61),.Y62(P62),.Y63(P63),.Y64(P64),.Y65(P65),.Y66(P66),.Y67(P67),.Y70(P70),.Y71(P71),.Y72(P72),.Y73(P73),.Y74(P74),.Y75(P75),.Y76(P76),.Y77(P77));


assign Y00=P00[2*N+10:N-1];
assign Y01=P01[2*N+10:N-1];
assign Y02=P02[2*N+10:N-1];
assign Y03=P03[2*N+10:N-1];
assign Y04=P04[2*N+10:N-1];
assign Y05=P05[2*N+10:N-1];
assign Y06=P06[2*N+10:N-1];
assign Y07=P07[2*N+10:N-1];
assign Y10=P10[2*N+10:N-1];
assign Y11=P11[2*N+10:N-1];
assign Y12=P12[2*N+10:N-1];
assign Y13=P13[2*N+10:N-1];
assign Y14=P14[2*N+10:N-1];
assign Y15=P15[2*N+10:N-1];
assign Y16=P16[2*N+10:N-1];
assign Y17=P17[2*N+10:N-1];
assign Y20=P20[2*N+10:N-1];
assign Y21=P21[2*N+10:N-1];
assign Y22=P22[2*N+10:N-1];
assign Y23=P23[2*N+10:N-1];
assign Y24=P24[2*N+10:N-1];
assign Y25=P25[2*N+10:N-1];
assign Y26=P26[2*N+10:N-1];
assign Y27=P27[2*N+10:N-1];
assign Y30=P30[2*N+10:N-1];
assign Y31=P31[2*N+10:N-1];
assign Y32=P32[2*N+10:N-1];
assign Y33=P33[2*N+10:N-1];
assign Y34=P34[2*N+10:N-1];
assign Y35=P35[2*N+10:N-1];
assign Y36=P36[2*N+10:N-1];
assign Y37=P37[2*N+10:N-1];
assign Y40=P40[2*N+10:N-1];
assign Y41=P41[2*N+10:N-1];
assign Y42=P42[2*N+10:N-1];
assign Y43=P43[2*N+10:N-1];
assign Y44=P44[2*N+10:N-1];
assign Y45=P45[2*N+10:N-1];
assign Y46=P46[2*N+10:N-1];
assign Y47=P47[2*N+10:N-1];
assign Y50=P50[2*N+10:N-1];
assign Y51=P51[2*N+10:N-1];
assign Y52=P52[2*N+10:N-1];
assign Y53=P53[2*N+10:N-1];
assign Y54=P54[2*N+10:N-1];
assign Y55=P55[2*N+10:N-1];
assign Y56=P56[2*N+10:N-1];
assign Y57=P57[2*N+10:N-1];
assign Y60=P60[2*N+10:N-1];
assign Y61=P61[2*N+10:N-1];
assign Y62=P62[2*N+10:N-1];
assign Y63=P63[2*N+10:N-1];
assign Y64=P64[2*N+10:N-1];
assign Y65=P65[2*N+10:N-1];
assign Y66=P66[2*N+10:N-1];
assign Y67=P67[2*N+10:N-1];
assign Y70=P70[2*N+10:N-1];
assign Y71=P71[(2*N+10):(N-1)];
assign Y72=P72[(2*N+10):(N-1)];
assign Y73=P73[(2*N+10):(N-1)];
assign Y74=P74[(2*N+10):(N-1)];
assign Y75=P75[(2*N+10):(N-1)];
assign Y76=P76[(2*N+10):(N-1)];
assign Y77=P77[(2*N+10):(N-1)];

endmodule






