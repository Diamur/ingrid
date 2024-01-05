#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Log_CLOSE_POSITION(int number){
   
   _addInfoLine();         

   _addInfoLine();       

   _addInfoLine();  
   _addInfo("SignalCloseBuy["+(string)number+" ] = ",(string)SignalCloseBuy[number] ) ;
   _addInfo("SignalCloseSell["+(string)number+"] = ",(string)SignalCloseSell[number] );                
   _addInfoLine();  
   
   _addInfoLine();         

   _addInfoLine(); 

}
  
 