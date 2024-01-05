#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalCloseSell( int number){
//+------------------------------------------------------------------                                        
//| 0 Если кол-во SELL > 0                                                
//| 1 МА смотрит  вверх 
//+------------------------------------------------------------------
SignalCloseSell[number] = false; 

if(false)
if( Status[number][TRADEMODE_CLOSE][TYPE_SELL][0] = _count_SELL[number] > 0 ? true: false )
//if( Status[number][TRADEMODE_CLOSE][TYPE_SELL][1] = isMA_UP(h_iMA[number],number,0)? true: false ) 

SignalCloseSell[number] = true; 

}



