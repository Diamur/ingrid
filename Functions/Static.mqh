#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Static()
{
   SetTimeCurrent(); 
   SetTimeDAY();
   //SetVECTOR();
   info = "";
   
   ShowPropertiesTik();
}