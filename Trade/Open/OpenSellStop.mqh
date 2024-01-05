#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int  OpenSellStop(int    number, 
                  CTrade &trade[], 
                  string symbol, 
                  double lots, 
                  double price, 
                  double price_sl , 
                  double price_tp , 
                  string comment =""){ 
      int order = -1;                 
    //Проверка лотности
    if( CheckVolumeValue (_Symbol, lots) ) 
    //Проверка наличных для выставления лотности 
      order =  trade[number].SellStop(lots, 
                                 NormalizeDouble(price,(int)SymbolInfoInteger(symbol,SYMBOL_DIGITS)), 
                                 symbol, 
                                 NormalizeDouble(price_sl,(int)SymbolInfoInteger(symbol,SYMBOL_DIGITS)), 
                                 NormalizeDouble(price_tp,(int)SymbolInfoInteger(symbol,SYMBOL_DIGITS)),
                                 0,
                                 0,
                                 comment);                                  
      if( order == -1 )
           Print(__FUNCTION__, " error  > ",GetLastError() );
      return(order); 
  }
  
    