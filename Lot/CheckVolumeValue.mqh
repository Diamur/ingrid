#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CheckVolumeValue(string symbol, double volume){
   //--- минимально допустимый объем для торговых операций
   double min_volume=SymbolInfoDouble(symbol,SYMBOL_VOLUME_MIN);
   if(volume<min_volume) {
    Print(StringFormat("Объем меньше минимально допустимого SYMBOL_VOLUME_MIN=%.2f",min_volume));
   return(false);
   }
   
   //--- максимально допустимый объем для торговых операций
   double max_volume=SymbolInfoDouble(symbol,SYMBOL_VOLUME_MAX);
   if(volume>max_volume){
     Print(StringFormat("Объем больше максимально допустимого SYMBOL_VOLUME_MAX=%.2f",max_volume));
   return(false);
   }
   //--- получим минимальную градацию объема
   double volume_step=SymbolInfoDouble(symbol,SYMBOL_VOLUME_STEP);
      int ratio = (int)MathRound((volume-min_volume)/volume_step);
   if (MathAbs(ratio*volume_step+min_volume-volume)>0.0000001) {
      return(false);
   }
   
   return(true);
  }
  
