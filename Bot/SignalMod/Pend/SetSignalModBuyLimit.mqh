#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalModBuyLimit( int number){
//+------------------------------------------------------------------                                     
//| 0 Если установлен параметр для модификации                                                
//|                                  
//| 
//| 
//+------------------------------------------------------------------
SignalModBuyLimit[number] = false; 

//if( Status[number][TRADEMODE_MODIF][TYPE_BUYLIMIT][0] = false ? true: false)

// Выполнение всех статусов
//if(  Status[number][TRADEMODE_MODIF][TYPE_BUYLIMIT][0] )

SignalModBuyLimit[number] = true; 
}
   


