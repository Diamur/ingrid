#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Log_MA(int number){
      
   double MA0 =  GetMA1(h_iMA[number],0,0);
   double MA1 =  GetMA1(h_iMA[number],0,1);
   double MA2 =  GetMA1(h_iMA[number],0,2);
   
   _addInfoLine();   
  
   _addInfo("MA0 = ", (string)( DoubleToString(MA0,5)) );
  // _addInfo("MA1 = ", (string)( DoubleToString(MA1,5)) );
  // _addInfo("MA2 = ", (string)( DoubleToString(MA2,5)) );
    
   _addInfoLine();  
}
  
 