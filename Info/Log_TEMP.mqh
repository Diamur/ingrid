#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Log_TEMP(int number){
 
    // _addInfo((string) (  ) , " < "  );
   // _addInfo((string) (  ) , " < "  );  
  

   _addInfo((string) (  _count_BUY[number] ) , " < BUY"  );
   _addInfo((string) (  _count_SELL[number] ) , " < SELL"  );
   
   _addInfoLine(); 


}
  
 