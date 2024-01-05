#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetPriceBUYSTOP(string symbol, int step, double price=0 ){ 
 if(price == 0 ) price = SymbolInfoDouble(symbol,SYMBOL_BID) ;            
  return NormalizeDouble( price + step * SymbolInfoDouble(symbol, SYMBOL_POINT) , (int)SymbolInfoInteger(symbol, SYMBOL_DIGITS)  );     
}
