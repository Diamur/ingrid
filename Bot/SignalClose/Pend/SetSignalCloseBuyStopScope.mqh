#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalCloseBuyStopScope( int number){
SignalCloseBuyStopScope[number] = false; 

if(Status.CloseBUYSTOP[number][STATUS_TRADE_UP]      = TRADE_UP ? true: false )
if(Status.CloseBUYSTOP[number][STATUS_SUB_ON]        = SUB_ON ? true: false )
if(Status.CloseBUYSTOP[number][STATUS_TRADE]         = TRADE_SUB_UP  ? true: false )
if(Status.CloseBUYSTOP[number][STATUS_NEWBAR]        = BarReMOVE != iTime(NULL,PERIOD_CURRENT,0) ? true: false )
if(Status.CloseBUYSTOP[number][STATUS_SCOPE_LEVEL]   = Ticket_BUYSTOP_CLOSE != -1 ? true: false )

SignalCloseBuyStopScope[number] = true; 
}



