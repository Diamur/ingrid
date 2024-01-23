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
    if(Panel_ON) 
   ShowPropertiesTik();
}