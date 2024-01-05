#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Log_CLOSE_BUYSTOP_SELLSTOP(int number){   

   _addInfoLine();                
   
   _addInfoLine();  
   _addInfo("SignalCloseBuyStop["+(string)number+"] = ",(string)SignalCloseBuyStop[number]);
   _addInfo("SignalCloseSellStop["+(string)number+"] = ",(string)SignalCloseSellStop[number]);                
   _addInfoLine();  

}
  
 