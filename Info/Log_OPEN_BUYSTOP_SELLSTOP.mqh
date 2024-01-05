#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Log_OPEN_BUYSTOP_SELLSTOP(int number){

   _addInfoLine();       

   
   _addInfoLine();  
   _addInfo("SignalOpenBuyStop["+(string)number+"] = ",(string)SignalOpenBuyStop[number]);
   _addInfo("SignalOpenSellStop["+(string)number+"] = ",(string)SignalOpenSellStop[number]);                
   _addInfoLine();  

   _addInfoLine(); 



}
  
 