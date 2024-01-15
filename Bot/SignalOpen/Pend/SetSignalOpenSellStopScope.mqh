#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalOpenSellStopScope( int number){
//+------------------------------------------------------------------   
SignalOpenSellStopScope[number] = false;  

if(Status.OpenSELLSTOP[number][STATUS_WORK]           = WorkingHour() ? true: false )
if(Status.OpenSELLSTOP[number][STATUS_TRADE_DN]       = TRADE_DN ? true: false )
if(Status.OpenSELLSTOP[number][STATUS_SUB_ON]         = SUB_ON ? true: false )
if(Status.OpenSELLSTOP[number][STATUS_TRADE_SUB_DN]   = TRADE_SUB_DN  ? true: false )
if(Status.OpenSELLSTOP[number][STATUS_STATE_STOP]     = !State_BUTTON_STOP ? true: false )
if(Status.OpenSELLSTOP[number][STATUS_STATE_DN]       = State_BUTTON_START_DN || MQLInfoInteger(MQL_TESTER) ||  MQLInfoInteger(MQL_OPTIMIZATION) ? true: false )
if(Status.OpenSELLSTOP[number][STATUS_SCOPE_LEVEL]    = isPriceInScopeSELLSTOP( PRICE_ScopeLevel_DN_ASK)  ? true: false )


SignalOpenSellStopScope[number] = true; 

//if(SignalOpenSellStopScope[number]){
//     Print(__FUNCTION__, "%%%%%%%%%%%%%%%%%%%%%%% SellStopScope  %%%%%%%%%%%%%%%%%% " );
//     Print(__FUNCTION__, " --------------- STATUS_WORK = "         , WorkingHour() );
//     Print(__FUNCTION__, " --------------- STATUS_TRADE = "        , TRADE  );
//     Print(__FUNCTION__, " --------------- STATUS_TRADE_DN = "     , TRADE_DN  ); 
//     Print(__FUNCTION__, " --------------- STATUS_SUB_ON = "       , SUB_ON  );       
//     Print(__FUNCTION__, " --------------- STATUS_TRADE_SUB_DN = " , TRADE_SUB_DN  );  
//     Print(__FUNCTION__, " --------------- STATUS_SCOPE_LEVEL = "  , isPriceInScopeSELLSTOP( PRICE_ScopeLevel_DN_BID) );      
//  }

}
   


