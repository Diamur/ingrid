#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
 double GetTakeProfitBUY(string symbol, int sl=0, double price=0 ){      
      double s =0;
      if(price == 0 ) price = SymbolInfoDouble(symbol,SYMBOL_BID) ;            
      if(sl != 0) s = NormalizeDouble( price + sl * SymbolInfoDouble(symbol, SYMBOL_POINT) , (int)SymbolInfoInteger(symbol, SYMBOL_DIGITS) ); 
      return s;
   }
  