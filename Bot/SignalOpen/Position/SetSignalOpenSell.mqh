#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalOpenSell( int number){
//+------------------------------------------------------------------                                   
//| 0 Торговля символо разрешена
//| 1 Торговля разрешена по времени
//| 2 Торговля разрешена в пятницу                                                 
//| 3 Если кол-во SELL< countSELL                                           
//| 4 Если новый бар  
//| 5 МА смотрит вниз
//+------------------------------------------------------------------   
SignalOpenSell[number] = false;  

if( Status[number][TRADEMODE_OPEN][TYPE_SELL][0] = Trade[number] ? true: false)
//if( Status[number][TRADEMODE_OPEN][TYPE_SELL][1] = WorkingHour() ? true: false)
//if( Status[number][TRADEMODE_OPEN][TYPE_SELL][2] = (( TradeOnFriday == false && ( _dt.day_of_week) != 5 ) ||  TradeOnFriday ) ? true: false)
if( Status[number][TRADEMODE_OPEN][TYPE_SELL][3] =  _count_SELL[number] < in_count_SELL[number] ? true: false)
if( Status[number][TRADEMODE_OPEN][TYPE_SELL][4] = BarOpenSELL[number] != iTime(arrSymbol[number],PERIOD_CURRENT,0) ? true: false)
if( Status[number][TRADEMODE_OPEN][TYPE_SELL][5] = isMA_DN(h_iMA[number], number,0)? true: false) 
//if( Status[number][TRADEMODE_OPEN][TYPE_SELL][5] = isSto_UP(number,0)? true: false   ) 
//if( Status[number][TRADEMODE_OPEN][TYPE_SELL][6] = isCCI_UP(number,0)? true: false   ) 
//if( Status[number][TRADEMODE_OPEN][TYPE_SELL][5] = !STOiRevers? ( GetSto1(h_Sto[number],0,0) > STOLevelUP ? true: false) : ( GetSto1(h_Sto[number],0,0) < STOLevelDN ? true: false ) )
//if( Status[number][TRADEMODE_OPEN][TYPE_SELL][6] = !STOiRevers? ( GetSto1(h_Sto[number],0,1) < STOLevelUP ? true: false) : ( GetSto1(h_Sto[number],0,1) > STOLevelDN? true: false)  ) 
    
SignalOpenSell[number] = true; 

} 