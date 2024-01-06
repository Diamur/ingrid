#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalOpenSellLimitScope( int number){
SignalOpenSellLimitScope[number] = false;  

if(Status.OpenSELLLIMIT[number][STATUS_WORK]           = WorkingHour() ? true: false )
//if(Status.OpenSELLLIMIT[number][STATUS_TRADE]          = TRADE ? true: false )
if(Status.OpenSELLLIMIT[number][STATUS_TRADE_UP]       = TRADE_UP ? true: false )
if(Status.OpenSELLLIMIT[number][STATUS_MAIN_ON]        = MAIN_ON ? true: false )
if(Status.OpenSELLLIMIT[number][STATUS_TRADE_MAIN_UP]  = TRADE_MAIN_UP ? true: false )
if(Status.OpenSELLLIMIT[number][STATUS_SCOPE_ON]       = ScopeLevel != 0 ? true: false )
if(Status.OpenSELLLIMIT[number][STATUS_COUNT]          = GetCountPendByPREFIX(NAME_PREFIX_SL) != 0 ||  GetCountPositionsByPREFIX(NAME_PREFIX_SL) !=0 ? true: false )
if(Status.OpenSELLLIMIT[number][STATUS_SCOPE_LEVEL]    = isPriceInScopeSELLLIMIT( PRICE_ScopeLevel_UP_BID )  ? true: false )

SignalOpenSellLimitScope[number] = true; 
   if(SignalOpenSellLimitScope[number]){
     //Print(__FUNCTION__, "%%%%%%%%%%%%%%%%%%%%%%% SELLLIMIT Scope  %%%%%%%%%%%%%%%%%% " );
     //Print(__FUNCTION__, " --------------- STATUS_WORK = "         , WorkingHour() );
     //Print(__FUNCTION__, " --------------- STATUS_TRADE = "        , TRADE  );
     //Print(__FUNCTION__, " --------------- STATUS_TRADE_UP = "     , TRADE_UP  ); 
     //Print(__FUNCTION__, " --------------- STATUS_MAIN_ON = "      , MAIN_ON  );       
     //Print(__FUNCTION__, " --------------- STATUS_TRADE_MAIN_UP = ", TRADE_MAIN_UP  );  
     //Print(__FUNCTION__, " --------------- STATUS_SCOPE_LEVEL = "  , isPriceInScopeSELLLIMIT( PRICE_ScopeLevel_DN_BID ) );  
   }
}

  