#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
  void _addInfo(
   string tabBefor   = "",
   string str        = "",
   string tabAfter   = "\n"){
   info += tabBefor + str + tabAfter;
  }
  
  void _addInfoLine()
  {
   info += "---------"    + "\n";
  }
  
  
 