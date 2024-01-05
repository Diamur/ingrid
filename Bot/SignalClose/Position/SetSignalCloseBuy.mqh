#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalCloseBuy( int number){
//+------------------------------------------------------------------                                        
//| 0 Если кол-во BUY > 0                                                
//| 1 МА смотрит  вниз 
//+------------------------------------------------------------------
SignalCloseBuy[number] = false; 

if(false)
if( Status[number][TRADEMODE_CLOSE][TYPE_BUY][0] = _count_BUY[number] > 0 ? true: false )
//if( Status[number][TRADEMODE_CLOSE][TYPE_BUY][1] = isMA_DN(h_iMA[number], number,0)? true: false ) 

SignalCloseBuy[number] = true; 

}



