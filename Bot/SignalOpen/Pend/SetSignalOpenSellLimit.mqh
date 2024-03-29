#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalOpenSellLimit( int number){
SignalOpenSellLimit[number] = false;  

if(Status.OpenSELLLIMIT[number][STATUS_WORK]           = WorkingHour() ? true: false )
//if(Status.OpenSELLLIMIT[number][STATUS_TRADE]          = !TRADE ? true: false )
if(Status.OpenSELLLIMIT[number][STATUS_TRADE_UP]       = TRADE_UP ? true: false )
if(Status.OpenSELLLIMIT[number][STATUS_MAIN_ON]        = MAIN_ON ? true: false )
if(Status.OpenSELLLIMIT[number][STATUS_STATE_UP]       = State_BUTTON_START_UP || MQLInfoInteger(MQL_TESTER) ||  MQLInfoInteger(MQL_OPTIMIZATION)  ? true: false )
if(Status.OpenSELLLIMIT[number][STATUS_TRADE_MAIN_UP]  = !TRADE_MAIN_UP ? true: false )
if(Status.OpenSELLLIMIT[number][STATUS_COUNT]          = GetCountPendByType(ORDER_TYPE_SELL_LIMIT) == 0? true: false )
if(Status.OpenSELLLIMIT[number][STATUS_STO]            = Stochastic_ON? ( !STORevers? (isStoMain_DN(number,STOLevelDN,0)  ? true: false):(isStoMain_UP(number,STOLevelUP,0)  ? true: false)  ):true )   

SignalOpenSellLimit[number] = true; 

if(SignalOpenSellLimit[number]){
     //Print(__FUNCTION__, "%%%%%%%%%%%%%%%%%%%%%%% SELLLIMIT  %%%%%%%%%%%%%%%%%% " );
     //Print(__FUNCTION__, " --------------- STATUS_WORK = "         , WorkingHour() );
     //Print(__FUNCTION__, " --------------- STATUS_TRADE = "        , !TRADE  );
     //Print(__FUNCTION__, " --------------- STATUS_TRADE_UP = "     , TRADE_UP  ); 
     //Print(__FUNCTION__, " --------------- STATUS_MAIN_ON = "      , MAIN_ON  );       
     //Print(__FUNCTION__, " --------------- STATUS_TRADE_MAIN_UP = ", !TRADE_MAIN_UP  );  
     //Print(__FUNCTION__, " --------------- STATUS_COUNT = "        , GetCountPendByType(ORDER_TYPE_SELL_LIMIT) == 0  );       
  }
  
}

  