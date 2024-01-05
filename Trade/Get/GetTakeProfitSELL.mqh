#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
  double GetTakeProfitSELL(string symbol, int tp=0, double price=0 ){      
      double s =0;
      if(price == 0 ) price = SymbolInfoDouble(symbol,SYMBOL_BID) ;            
      if(tp != 0) s = NormalizeDouble( price - tp * SymbolInfoDouble(symbol, SYMBOL_POINT) , (int)SymbolInfoInteger(symbol, SYMBOL_DIGITS) ); 
      return s;
   }
