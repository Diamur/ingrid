#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalCloseBuyLimitScope( int number){
  SignalCloseBuyLimitScope[number] = false; 

   if(Status.CloseBUYLIMIT[number][STATUS_NEWBAR]        =  BarReMOVE != iTime(NULL,PERIOD_CURRENT,0) ? true: false )
   //if(Status.CloseBUYLIMIT[number][STATUS_SCOPE_LEVEL]   =  isPriceOutScopeLevelPend_DN( PRICE_ScopeLevel_DN_BID )  ? true: false )
   if(Status.CloseBUYLIMIT[number][STATUS_SCOPE_LEVEL]   =  Ticket_BUYLIMIT_CLOSE !=-1  ? true: false )
   

  SignalCloseBuyLimitScope[number] = true;  
}
