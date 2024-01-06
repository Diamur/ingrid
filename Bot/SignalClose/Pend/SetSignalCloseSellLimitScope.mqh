#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalCloseSellLimitScope( int number ){
//+------------------------------------------------------------------                                        
SignalCloseSellLimitScope[number] = false; 

   if(Status.CloseSELLLIMIT[number][STATUS_NEWBAR]        =  BarReMOVE != iTime(NULL,PERIOD_CURRENT,0) ? true: false )
   if(Status.CloseSELLLIMIT[number][STATUS_SCOPE_LEVEL]   =  Ticket_SELLLIMIT_CLOSE !=-1  ? true: false )   
   
SignalCloseSellLimitScope[number] = true; 
}



