#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalModBuy( int number){
//+------------------------------------------------------------------
//| ------------- Движение СтопЛоса | Трал ---------------------------------                                               
//| 0 Если параметр ТРАЛА есть и НЕ равен 0                               
//| 1                                               
//+------------------------------------------------------------------
SignalModBuy[number] = false; 

//if( Status[number][TRADEMODE_MODIF][TYPE_BUY][0] = false ? true: false )

// Выполнение всех статусов
//if( Status[number][TRADEMODE_MODIF][TYPE_BUY][0] )

SignalModBuy[number] = true; 

}



