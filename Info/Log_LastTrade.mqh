#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Log_LastTrade(int number){
 
   _addInfoLine();
   _addInfo("lastTiketBUY["+(string)number+"] = ", (string)(lastTiketBUY[number]));
   _addInfo("lastTiketSELL["+(string)number+"] = ", (string)(lastTiketSELL[number]));
   _addInfo("lastProfitBUY["+(string)number+"] = ", (string)(lastProfitBUY[number]));
   _addInfo("lastProfitSELL["+(string)number+"] = ", (string)(lastProfitSELL[number]));
   _addInfo("lastVolumeBUY["+(string)number+"] = ", (string)(lastVolumeBUY[number]));
   _addInfo("lastVolumeSELL["+(string)number+"] = ", (string)(lastVolumeSELL[number]));
   _addInfo("lastPriceBUY["+(string)number+"] = ", (string)(lastPriceBUY[number]));
   _addInfo("lastPriceSELL["+(string)number+"] = ", (string)(lastPriceSELL[number]));
   _addInfo("ProfitSymbol["+(string)number+"] = ", (string)(ProfitSymbol[number]));
   _addInfo("ProfitFull = ", (string)(ProfitFull));      
  

   //Comment(info);
}
  
 