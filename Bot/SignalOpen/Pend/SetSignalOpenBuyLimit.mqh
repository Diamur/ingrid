#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalOpenBuyLimit( int number){
SignalOpenBuyLimit[number] = false; 

if(Status.OpenBUYLIMIT[number][STATUS_WORK]           = WorkingHour() ? true: false )
//if(Status.OpenBUYLIMIT[number][STATUS_TRADE]          = !TRADE ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_TRADE_DN]       = TRADE_DN ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_MAIN_ON]        = MAIN_ON ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_STATE_DN]       = State_BUTTON_START_DN || MQLInfoInteger(MQL_TESTER) ||  MQLInfoInteger(MQL_OPTIMIZATION)  ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_TRADE_MAIN_DN]  = !TRADE_MAIN_DN ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_COUNT]          = GetCountPendByType(ORDER_TYPE_BUY_LIMIT) == 0? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_STO_UP]         = isStoMain_UP(number,STOLevelUP,0)  ? true: false )   
       
SignalOpenBuyLimit[number] = true; 

if(SignalOpenBuyLimit[number]){
     //Print(__FUNCTION__, "%%%%%%%%%%%%%%%%%%%%%%% BUYLIMIT  %%%%%%%%%%%%%%%%%% " );
     //Print(__FUNCTION__, " --------------- STATUS_WORK = ", WorkingHour() );
     //Print(__FUNCTION__, " --------------- STATUS_TRADE = ", !TRADE  );
     //Print(__FUNCTION__, " --------------- STATUS_TRADE_DN = ",  TRADE_DN  );  
     //Print(__FUNCTION__, " --------------- STATUS_MAIN_ON = ",  MAIN_ON  );  
     //Print(__FUNCTION__, " --------------- STATUS_TRADE_MAIN_DN = ",  !TRADE_MAIN_DN  );    
     //Print(__FUNCTION__, " --------------- STATUS_COUNT = ",  GetCountPendByType(ORDER_TYPE_BUY_LIMIT) == 0  );  
     
  }
  
}


