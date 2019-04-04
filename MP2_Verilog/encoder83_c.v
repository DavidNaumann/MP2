module encoder83_c(
input i1, // input 1
input i2, // input 2
input i3, // input 3
input i4, // input 4
input i5,
input i6,
input i7,
input i8,
output[2:0] o // output 2
);

wire tempo_1,tempo_2,tempo_3; // temporary variables

OR5 o1 (.i1(i8), .i2(i8), .i3(i7), .i4(i6), .i5(i5), .o(tempo_1));
OR5 o2 (.i1(i8), .i2(i8), .i3(i7), .i4(i4), .i5(i3),.o(tempo_2));
OR5 o3 (.i1(i8), .i2(i8), .i3(i6), .i4(i4), .i5(i2), .o(tempo_3));

assign o[2]= tempo_1;
assign o[1]= tempo_2;
assign o[0]= tempo_3;

endmodule
