/* 
    Author          : Abhinav Nandwani
    Filename        : pe.sv
    Description     : This is a unit PE element for INT8, it is like a MAC unit but extended for systolic arrays. The sum out is 32 bits.  
*/

module pe(clk,rst_n, west_row_in, north_col_in, east_row_out, south_col_out);

    // INT8 

    // sequential inputs //
    input clk, rst_n;

    //// rows travel west to east, cols travel north to south ////
    input [15:0] west_row_in, north_col_in;
    output [15:0] east_row_out, south_col_out;

    //// cummulative sum moves diagonally ////
    input [31:0] sum_in;
    output [31:0] sum_diagonal_out;


    // TODO add sum saturation 

    always_ff@(posedge clk, negedge rst_n) begin
        if(!rst_n)
            south_col_out <= 0;
            east_row_out <= 0;
        else
            sum_diagonal_out <= sum_out + (west_row_in * north_col_in);
            south_col_out <= north_col_in;
            east_row_out <= west_row_in;
    end
            
endmodule
     