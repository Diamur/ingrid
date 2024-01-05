#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalModSellStop( int number){
//+------------------------------------------------------------------                                     
//| 0 Если установлен параметр для модификации                                                
//|                                  
//| 
//| 
//+------------------------------------------------------------------
SignalModSellStop[number] = false; 

if( Status[number][TRADEMODE_MODIF][TYPE_SELLSTOP][0] = false ? true: false)
// Выполнение всех статусов
//if( Status[number][TRADEMODE_MODIF][TYPE_SELLSTOP][0])
SignalModSellStop[number] = true; 
}
   

