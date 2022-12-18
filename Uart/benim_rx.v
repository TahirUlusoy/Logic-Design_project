`timescale 1ns / 1ps
module benim_rx(
    input clk,
    input  rx_i, // rx biti 0 olduðu anda haberleþme balayacak. haberleþme baþlamadan önce Usb den gelen bit.
    output tx_o,
    input btnl_i, // Left button
    input btnu_i, // Upper button
    input btnr_i, // Right button
    input btnd_i,
    output [7:0] sonuc
    );
    reg [3:0]durum;
    reg [32:0]clock_sayac;
    reg [2:0]data_bit_index;
    reg [7:0] data;
    reg rx_r = 1'b1;
    reg rx = 1'b1;
    reg rx_dv = 0;
    
    
    parameter clk_per_bit = 10_417;
    
    always@(posedge clk)begin
        rx_r <= rx_i;
        rx <= rx_r;
    end
    
    
    always@(posedge clk) begin
        
        case(durum) 
            0: begin // Boþ durum
                clock_sayac <= 0;
                data_bit_index <= 0;
                rx_dv <= 1'b0;
                if(rx == 1'b0) begin
                    durum <= 1;
                end else begin
                    durum <= 0;
                end
            end 
            
            1: begin // Baþlangýç biti tespit etme.
                if(clock_sayac == (clk_per_bit-1)/2) begin
                    if(rx == 1'b0) begin
                        clock_sayac <= 0;
                        durum = 2;
                    end else begin
                        durum = 0;
                    end
                end else begin
                    clock_sayac <= clock_sayac + 1;
                    durum = 2;
                end           
            end
            
            2: begin // Bit ouma durumu
                if(clock_sayac < clk_per_bit -1) begin
                    clock_sayac <= clock_sayac + 1;
                    durum <= 2;
                end else begin
                    clock_sayac = 0;
                    data[data_bit_index] <= rx_r;
                    if(data_bit_index < 7) begin
                        data_bit_index <= data_bit_index + 1;
                        durum <= 2;
                    end else begin
                        data_bit_index <= 0;
                        durum <= 3;
                    end
                end
            end 
            
            3: begin // Stop bit durumu
                if(clock_sayac < clk_per_bit - 1) begin
                    clock_sayac <= clock_sayac + 1;
                    durum <= 3;
                end else begin
                    rx_dv = 1'b0;
                    clock_sayac <= 0;
                    durum <= 4;
                end        
            end
            4: begin // temizle
                durum <= 0;
                rx_dv <= 1'b0;       
            end
            default: begin // Stop bit durumu
                durum <= 0;        
            end    
        endcase    
    
    
    end
    
    assign sonuc = data;
endmodule
