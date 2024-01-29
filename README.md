# HDL-code-to-compute-Y-DXD-T
1.where each element of X is 8-bit and comes serially (takes 64 clock cycles to get all values).A 
verilog HDL code is written to compute Y = DXD^T where D is constant matrix of size 8 x 8.

2.We used 1 MAC and called it sequentially to
compute 1x8 and 8x1 Matrix Multiplication(Refer
ATB8.v). 

3.Later we called this module parallelly for 8
times to compute 1x8 and 8x8 Matrix
Multiplication(Refer AB8.v). So, this one uses 8
MACs and takes 8 clock cycles to get the result.
For 8x8 and 8x8 Matrix Multiplication, we called the
above module(AB8) 8 times sequentially. For the
result to appear it takes 64 clock cycles and uses 8
MACs only(Refer AB8x8.v).

4.We used AB8x8 module to calculate XD T . This
means we need to input all the values of X before
giving them as an input to AB8x8 module. So we
defined a 64 element 8 bit register to store all the
values of X.

5.Elements of X and D T are of N bits. Elements XD T
will have a size of 2N+3 bits. But since we arerepresenting D as a signed 8 bit Integer, we need to
right shift the output by 7 bits. So now we are left with
N+4 bit elements.

6.Now for DXD T we need to instantiate a new AB8x8
module whose inputs will be D and XD T and each of
them will have a size of N+4 bits.
The output after arithematic right shift will be of N+11
bits.(N here being 8)


Final Verdict:
For DXD T computation, we used a total of 8 8bit sized
MACs and 8 12bit sized MACs.
Since input is coming serially, we will need 64 clock
cycles to get all the inputs, 64 more clock cycles to
get XD T and 64 more clock cycles to get
Final output DXD T .
Total Area used: 16 MACs.
Total Delay: 192 Clock Cycles.(Roughly 270 Clock
Cycles because we are using reset, start and done).
DXDT.v Module is used to compute the result
Use Test_Bench_DXDT.v for simulation purposes.
