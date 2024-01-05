#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalCloseBuyLimit( int number){
SignalCloseBuyLimit[number] = false; 
// Если изменилась
//if( Status[number][TRADEMODE_CLOSE][TYPE_BUYLIMIT][STATUS_COUNT_BUYLIMIT] = _count_BUYLIMIT_TRADE[number] > 0 ? true: false )
//if( Status[number][TRADEMODE_CLOSE][TYPE_BUYLIMIT][STATUS_MA_UP] = isMA_UP(h_iMA[number],number,0)? true: false ) 
//SignalCloseBuyLimit[number] = true; 
//;
// Если 
//if( Status[number][TRADEMODE_CLOSE][TYPE_BUYLIMIT][STATUS_COUNT_BUYLIMIT] = _count_BUYLIMIT_NOPROFIT[number] > 0 ? true: false )
//if( Status[number][TRADEMODE_CLOSE][TYPE_BUYLIMIT][STATUS_MA_DN_LOW] = isMA_DN(h_iMA_low[number],number,0)? true: false ) 
//SignalCloseBuyLimit[number] = true; 
// Если 
//;
//if( Status[number][TRADEMODE_CLOSE][TYPE_BUYLIMIT][STATUS_COUNT_BUYLIMIT] = _count_BUYLIMIT_TRADE[number] > 0 ? true: false )
//if( Status[number][TRADEMODE_CLOSE][TYPE_BUYLIMIT][STATUS_MA_MA_LOW_DN] = GetMA1(h_iMA[number])  <  GetMA1(h_iMA_low[number]) ? true: false ) 
//SignalCloseBuyLimit[number] = true; 
//;
//if( Status[number][TRADEMODE_CLOSE][TYPE_BUYLIMIT][STATUS_CCI_DN] = isCCI_DN(number,0)? true: false ) 
//if( Status[number][TRADEMODE_CLOSE][TYPE_BUYLIMIT][STATUS_CCI_DN] = CCI_TRAND_DN ? true: false ) 

}
