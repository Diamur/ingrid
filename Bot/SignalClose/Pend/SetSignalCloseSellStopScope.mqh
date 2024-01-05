#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalCloseSellStopScope( int number){
//+------------------------------------------------------------------
SignalCloseSellStopScope[number] = false; 

if(Status.CloseSELLSTOP[number][STATUS_TRADE_DN]      = TRADE_DN ? true: false )
if(Status.CloseSELLSTOP[number][STATUS_SUB_ON]        = SUB_ON ? true: false )
if(Status.CloseSELLSTOP[number][STATUS_TRADE]         = TRADE_SUB_DN  ? true: false )
if(Status.CloseSELLSTOP[number][STATUS_NEWBAR]        = BarReMOVE != iTime(NULL,PERIOD_CURRENT,0) ? true: false )
if(Status.CloseSELLSTOP[number][STATUS_SCOPE_LEVEL]   = Ticket_SELLSTOP_CLOSE != -1 ? true: false )

SignalCloseSellStopScope[number] = true; 


}



