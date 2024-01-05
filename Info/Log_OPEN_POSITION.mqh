#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Log_OPEN_POSITION(int number){

   _addInfoLine();       
      
   _addInfoLine();  
   _addInfo("SignalBuy["+(string)number+"] = ",(string)SignalOpenBuy[number]);
   _addInfo("SignalSell["+(string)number+"] = ",(string)SignalOpenSell[number]);                
   _addInfoLine();  
   
   _addInfoLine();         

   _addInfoLine(); 

}
  
 