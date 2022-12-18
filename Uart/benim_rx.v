//klavyeden girilen 8 bit giri�i asc� de�erine g�re ledleri yakmata (do�rulu�unu test edebilmek i�in)
// girilen giri�i ayn� mant�k ile transmit etmeye �al��t�m ancak beceremedim.
//giri� ��k��lar ve xdc dosylar�n� projede istenildi�i �ekilde ayarlaamya �al��t�m.
//uart i�lemleri bit bit yap�lacak �ekilde ayarlad���m i�in 152 bit giri� �eklinde ayarlan�p ��k�� 64 bit olarak ayarlanabilir.
//K�s�tl� s�re zarf�nda ve internette �ok fazla a��k kaynak bulamad���m i�in anca receiver k�sm�n� yapabildim, transmitter k�sm� do�ru �al��mamakta.
// transmitter k�sm� kodumda yorumlu olarak bulunmaktad�r.

`timescale 1ns / 1ps
module benim_rx(
    input clk,
    input rst_n,
    input  rx_i, // rx biti 0 oldu�u anda haberle�me balayacak. haberle�me ba�lamadan �nce Usb den gelen bit.
    input btnl_i, // Left button
    input btnu_i, // Upper button
    input btnr_i, // Right button
    input btnd_i,
    output reg tx_o,
    output [7:0]sonuc
    );
    
    reg [3:0]durum;
    reg [3:0] durum2;
    reg [32:0]clock_sayac;
    reg [32:0]clock_sayac2;
    reg [2:0]data_bit_index;
    reg [2:0]data_bit_index_tx;
    reg [7:0] data;
    reg rx_r = 1'b1;
    reg rx = 1'b1;
    reg rx_dv = 0;
    
    reg      o_Tx_Active;
    reg      o_Tx_Done;
    reg          r_Tx_Done     = 0;
    reg          r_Tx_Active   = 0;
    reg [7:0]    r_Tx_Data     = 0;
    
    parameter clk_per_bit = 10_417;
    
    always@(posedge clk)begin
        rx_r <= rx_i;
        rx <= rx_r;
    end
    
    
    always@(posedge clk) begin
        
        case(durum) 
            0: begin // Bo� durum
                clock_sayac <= 0;
                data_bit_index <= 0;
                rx_dv <= 1'b0;
                if(rx == 1'b0) begin
                    durum <= 1;
                end else begin
                    durum <= 0;
                end
            end 
            
            1: begin // Ba�lang�� biti tespit etme.
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

//    always @(posedge clk)//transmitter
//    begin
       
//      case (durum2)
//        0 :
//          begin
//            tx_o   <= 1'b1;         // Bo�taki durum
//            r_Tx_Done     <= 1'b0;
//            clock_sayac2 <= 0;
//            data_bit_index   <= 0;
             
//            if (btnl_i == 1'b1)
//              begin
//                r_Tx_Active <= 1'b1;
//                r_Tx_Data   <= data;
//                durum2   <= 1;
//              end
//            else
//              durum2 <= 0;
//          end // case: s_IDLE
      
         
//        1 :
//          begin
//            tx_o <= 1'b0;
            
//            if (clock_sayac2 < clk_per_bit-1)
//              begin
//                clock_sayac2 <= clock_sayac2 + 1;
//                durum2     <= 1;
//              end
//            else
//              begin
//                clock_sayac2 <= 0;
//                durum2     <= 2;
//              end
//          end // case: s_TX_START_BIT
       
         
//        2 :
//          begin
//            tx_o <= r_Tx_Data[data_bit_index_tx];
           
//            if (clock_sayac2 < clk_per_bit-1)
//              begin
//                clock_sayac2 <= clock_sayac2 + 1;
//                durum2     <= 2;
//              end
//            else
//              begin
//                clock_sayac2 <= 0;
                 
                
//                if (data_bit_index_tx < 7)
//                  begin
//                    data_bit_index_tx <= data_bit_index_tx + 1;
//                    durum2   <= 2;
//                  end
//                else
//                  begin
//                    data_bit_index_tx <= 0;
//                    durum2   <= 3;
//                  end
//              end
//          end 
       
         
//        3 :
//          begin
//            tx_o <= 1'b1;
            
//            if (clock_sayac2 < clk_per_bit-1)
//              begin
//                clock_sayac2 <= clock_sayac2 + 1;
//                durum2     <= 3;
//              end
//            else
//              begin
//                r_Tx_Done     <= 1'b1;
//                clock_sayac2 <= 0;
//                durum2     <= 4;
//                r_Tx_Active   <= 1'b0;
//              end
//          end 
        
         
//        4 :
//          begin
//            r_Tx_Done <= 1'b1;
//            durum2 <= 0;
//          end
       
         
//        default :
//          durum <= 0;
        
//      endcase
//  end

    
    

endmodule
