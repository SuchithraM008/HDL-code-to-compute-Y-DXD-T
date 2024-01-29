module ATB8 #(parameter N=8)(A0,A1,A2,A3,A4,A5,A6,A7,B0,B1,B2,B3,B4,B5,B6,B7,clk,rst,start,done,Y);
input [N-1:0]A0,A1,A2,A3,A4,A5,A6,A7;
input [N-1:0]B0,B1,B2,B3,B4,B5,B6,B7;
input clk,rst,start;
output reg done;
output reg [2*N+2:0]Y;
reg [4:0]Count;
reg [2*N+2:0]Temp;
reg [2*N+2:0]A_New;
reg [2*N+2:0]B_New;
wire [4*N+6:0]Temp1;
MAC_Signed #(.N(2*N+3)) MAC_1 (.A(Temp),.B(A_New),.C(B_New),.Y(Temp1));
always @(posedge clk)
begin
	if(rst==1'b1)
	begin
		Count=5'b0;
		Temp={(2*N+3){1'b0}};
		A_New={(2*N+3){1'b0}};
		B_New={(2*N+3){1'b0}};
		Y={(2*N+3){1'b0}};
		done=1'b0;
		
	end
	else
	begin
		if(start==1'b1)
		begin
		if(Count<8)
		begin
			if(Count==0)
			begin
				A_New={{(N+3){A0[N-1]}},{A0}};
				B_New={{(N+3){B0[N-1]}},{B0}};
			end
			if(Count==1)
			begin
				A_New={{(N+3){A1[N-1]}},{A1}};
				B_New={{(N+3){B1[N-1]}},{B1}};
			end
			if(Count==2)
			begin
				A_New={{(N+3){A2[N-1]}},{A2}};
				B_New={{(N+3){B2[N-1]}},{B2}};
			end
			if(Count==3)
			begin
				A_New={{(N+3){A3[N-1]}},{A3}};
				B_New={{(N+3){B3[N-1]}},{B3}};
			end
			if(Count==4)
			begin
				A_New={{(N+3){A4[N-1]}},{A4}};
				B_New={{(N+3){B4[N-1]}},{B4}};
			end
			if(Count==5)
			begin
				A_New={{(N+3){A5[N-1]}},{A5}};
				B_New={{(N+3){B5[N-1]}},{B5}};
			end
			if(Count==6)
			begin
				A_New={{(N+3){A6[N-1]}},{A6}};
				B_New={{(N+3){B6[N-1]}},{B6}};
			end
			if(Count==7)
			begin
				A_New={{(N+3){A7[N-1]}},{A7}};
				B_New={{(N+3){B7[N-1]}},{B7}};
			end
			
			Temp=Temp1[(2*N+2):0];
			Count=Count+1'b1;
		end
		else
		begin
			Count=Count;
			Y=Temp1[(2*N+2):0];
			done=1'b1;
		end
		end

	end
end

endmodule