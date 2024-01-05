#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalModSellLimit( int number){
//+------------------------------------------------------------------                                     
//| 0 Если установлен параметр для модификации                                                
//|                                  
//| 
//| 
//+------------------------------------------------------------------
SignalModSellLimit[number] = false; 

if( Status[number][TRADEMODE_MODIF][TYPE_SELLLIMIT][0] = false ? true: false)

// Выполнение всех статусов
//if( Status[number][TRADEMODE_MODIF][TYPE_SELLLIMIT][0])

SignalModSellLimit[number] = true; 
}
   


