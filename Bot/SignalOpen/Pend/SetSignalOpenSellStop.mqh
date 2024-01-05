#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalOpenSellStop( int number){
//+------------------------------------------------------------------   
SignalOpenSellStop[number] = false;  

if(Status.OpenSELLSTOP[number][STATUS_WORK]           = WorkingHour() ? true: false )
if(Status.OpenSELLSTOP[number][STATUS_TRADE_DN]       = TRADE_DN ? true: false )
if(Status.OpenSELLSTOP[number][STATUS_SUB_ON]         = SUB_ON ? true: false )
if(Status.OpenSELLSTOP[number][STATUS_TRADE_SUB_DN]   = !TRADE_SUB_DN  ? true: false )

SignalOpenSellStop[number] = true; 

}
   


