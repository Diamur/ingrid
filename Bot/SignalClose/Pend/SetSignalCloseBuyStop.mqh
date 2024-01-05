#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalCloseBuyStop( int number){
//+------------------------------------------------------------------                                        
//| 0 Если кол-во BuyStop > 0                                                
//| 1 МА смотрит  вниз 
//+------------------------------------------------------------------
SignalCloseBuyStop[number] = false; 
//if(false)
//if( Status[number][TRADEMODE_CLOSE][TYPE_BUYSTOP][0] = _count_BUYSTOP[number] > 0 ? true: false )
//if( Status[number][TRADEMODE_CLOSE][TYPE_BUYSTOP][1] = isMA_DN(h_iMA[number], number,0)? true: false ) 
//
//// Выполнение всех статусов
////if( Status[number][TRADEMODE_CLOSE][TYPE_BUYSTOP][0])
////if( Status[number][TRADEMODE_CLOSE][TYPE_BUYSTOP][1])
//SignalCloseBuyStop[number] = true; 
 
}



