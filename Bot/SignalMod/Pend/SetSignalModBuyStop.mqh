#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalModBuyStop( int number){
//+------------------------------------------------------------------                                     
//| 0 Если установлен параметр для модификации                                                
//|                                  
//| 
//| 
//+------------------------------------------------------------------
SignalModBuyStop[number] = false; 

if( Status[number][TRADEMODE_MODIF][TYPE_BUYSTOP][0] = false ? true: false)

// Выполнение всех статусов
//if(  Status[number][TRADEMODE_MODIF][TYPE_BUYSTOP][0] )

SignalModBuyStop[number] = true; 
}
   


