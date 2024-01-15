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
if(Status.OpenSELLSTOP[number][STATUS_STATE_STOP]     = !State_BUTTON_STOP ? true: false )
if(Status.OpenSELLSTOP[number][STATUS_STATE_DN]       = State_BUTTON_START_DN || MQLInfoInteger(MQL_TESTER) ||  MQLInfoInteger(MQL_OPTIMIZATION) ? true: false )
if(Status.OpenSELLSTOP[number][STATUS_TRADE_SUB_DN]   = !TRADE_SUB_DN  ? true: false )

SignalOpenSellStop[number] = true; 

}
   


