#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalOpenBuyStopScope( int number){

SignalOpenBuyStopScope[number] = false; 

if(Status.OpenBUYSTOP[number][STATUS_WORK]            = WorkingHour() ? true: false )
if(Status.OpenBUYSTOP[number][STATUS_TRADE_UP]        = TRADE_UP ? true: false )
if(Status.OpenBUYSTOP[number][STATUS_SUB_ON]          = SUB_ON ? true: false )
if(Status.OpenBUYSTOP[number][STATUS_TRADE]           = TRADE_SUB_UP  ? true: false )
if(Status.OpenBUYSTOP[number][STATUS_STATE_STOP]      = !State_BUTTON_STOP ? true: false )
if(Status.OpenBUYSTOP[number][STATUS_STATE_UP]        = State_BUTTON_START_UP || MQLInfoInteger(MQL_TESTER) ||  MQLInfoInteger(MQL_OPTIMIZATION) ? true: false )
if(Status.OpenBUYSTOP[number][STATUS_SCOPE_LEVEL]     = isPriceInScopeBUYSTOP( PRICE_ScopeLevel_UP_BID )  ? true: false )

SignalOpenBuyStopScope[number] = true; 

}
   


