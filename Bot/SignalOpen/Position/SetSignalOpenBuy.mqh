#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalOpenBuy( int number){
//+------------------------------------------------------------------                                        
//| 0 Торговля символо разрешена
//| 1 Время торговли разрешено
//| 2 Разрешено в пятницу
//| 3 Если кол-во BUY < countBUY
//| 4 Если новый бар  
//| 5 Если НЕ РЕВЕРС Стохастик пересекает  80 ВВЕРХ  при  ...при РЕВЕРСЕ пересекает 20 ВНИЗ
//| 6 Если 

//+------------------------------------------------------------------
SignalOpenBuy[number] = false; 

if( Status[number][TRADEMODE_OPEN][TYPE_BUY][0] = Trade[number] ? true: false)
//if( Status[number][TRADEMODE_OPEN][TYPE_BUY][1] = WorkingHour() ? true: false)
//if( Status[number][TRADEMODE_OPEN][TYPE_BUY][2] = ((TradeOnFriday == false && ( _dt.day_of_week) != 5 )||  TradeOnFriday) ? true: false)
if( Status[number][TRADEMODE_OPEN][TYPE_BUY][3] = _count_BUY[number] < in_count_BUY[number] ? true: false )
if( Status[number][TRADEMODE_OPEN][TYPE_BUY][4] = BarOpenBUY[number] != iTime(arrSymbol[number],PERIOD_CURRENT,0) ? true: false )     
if( Status[number][TRADEMODE_OPEN][TYPE_BUY][5] = isMA_UP(h_iMA[number], number,0)? true: false ) 
//if( Status[number][TRADEMODE_OPEN][TYPE_BUY][6] = isCCI_UP(number,0)? true: false   ) 
//if( Status[number][TRADEMODE_OPEN][TYPE_BUY][6] = isSto_DN(number,0)? true: false   ) 

//if( Status[number][TRADEMODE_OPEN][TYPE_BUY][5] = !iRevers? ( isSto_DN(number,0)? true: false) : ( isSto_UP(number,0)? true: false)  ) 
//if( Status[number][TRADEMODE_OPEN][TYPE_BUY][6] = !iRevers? ( isTradeSto_DN(number)? true: false) : ( isTradeSto_DN(number)? true: false)  ) 

//if( Status[number][TRADEMODE_OPEN][TYPE_BUY][5] = !STOiRevers? (  GetSto1(h_Sto[number],0,0) < STOLevelDN ? true: false) : ( GetSto1(h_Sto[number],0,0) > STOLevelUP ? true: false ) )
//if( Status[number][TRADEMODE_OPEN][TYPE_BUY][6] = !STOiRevers? (  GetSto1(h_Sto[number],0,1) > STOLevelDN ? true: false) : ( GetSto1(h_Sto[number],0,1) < STOLevelUP ? true: false)  ) 


SignalOpenBuy[number] = true; 
}



