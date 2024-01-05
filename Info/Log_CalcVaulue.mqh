#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Log_CalcVaulue(int number){
 
   _addInfoLine();       
   _addInfo("LOT_B = ",(string)( CalcVOLUME(arrSymbol[number],POSITION_TYPE_BUY,Magic ) ) );
   _addInfo("LOT_S = ",(string)( CalcVOLUME(arrSymbol[number],POSITION_TYPE_SELL,Magic ) ) );
      
   //Comment(info);
}
  
 