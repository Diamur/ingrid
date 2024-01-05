#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool OpenBuy( int    number, 
               CTrade &trade[], 
               string symbol, 
               double lots , 
               double price_sl = 0 , 
               double price_tp = 0 ){      
    if(lots == 0 ){
       Print(__FUNCTION__, " error lots to open order > ",GetLastError() ); 
     }            
    //Проверка лотности на правильность шага лотности
     if( CheckVolumeValue (symbol, lots) ) 
      if( Check_money(symbol, lots , ORDER_TYPE_BUY ) )  
    //Проверка наличных для выставления лотности   
     
      if(trade[number].Buy( lots, 
                     symbol, 
                     SymbolInfoDouble(symbol,SYMBOL_BID), 
                     NormalizeDouble(price_sl,(int)SymbolInfoInteger(symbol,SYMBOL_DIGITS)), 
                     NormalizeDouble(price_tp,(int)SymbolInfoInteger(symbol,SYMBOL_DIGITS)) 
                     )){
        if(trade[number].ResultDeal() == 0){
           Print(__FUNCTION__, " error > ",GetLastError() );
           return(false);
        } 
      }     
    return(true);
}
