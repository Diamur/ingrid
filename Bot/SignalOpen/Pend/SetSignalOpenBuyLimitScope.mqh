#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalOpenBuyLimitScope( int number){
SignalOpenBuyLimitScope[number] = false; 

if(Status.OpenBUYLIMIT[number][STATUS_WORK]           = WorkingHour() ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_TRADE_DN]       = TRADE_DN ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_MAIN_ON]        = MAIN_ON ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_TRADE]          = TRADE ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_TRADE_MAIN_DN]  = TRADE_MAIN_DN ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_SCOPE_ON]       = ScopeLevel != 0 ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_COUNT]          = GetCountPendByPREFIX(NAME_PREFIX_BL) != 0 ||  GetCountPositijnsByPREFIX(NAME_PREFIX_BL) !=0 ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_SCOPE_LEVEL]    = isPriceInScopeBUYLIMIT( PRICE_ScopeLevel_DN_ASK )  ? true: false )
          
SignalOpenBuyLimitScope[number] = true; 

//if(SignalOpenBuyLimitScope[number]){
//     Print(__FUNCTION__, "%%%%%%%%%%%%%%%%%%%%%%% BUYLIMIT Scope  %%%%%%%%%%%%%%%%%% " );
// 
//     Print(__FUNCTION__, " --------------- STATUS_TRADE = ",  WorkingHour()  );
//     Print(__FUNCTION__, " --------------- STATUS_TRADE_DN = ", TRADE_DN  );
//     Print(__FUNCTION__, " --------------- STATUS_MAIN_ON = ",  MAIN_ON );
//     Print(__FUNCTION__, " --------------- STATUS_WORK = ",  TRADE  );    
//     Print(__FUNCTION__, " --------------- STATUS_TRADE_MAIN_DN = ",  TRADE_MAIN_DN  );     
//     Print(__FUNCTION__, " --------------- STATUS_SCOPE_ON = ",  ScopeLevel != 0   );
//     Print(__FUNCTION__, " --------------- STATUS_COUNT = ",  GetCountPendByPREFIX(NAME_PREFIX_BL) != 0 ||  GetCountPositijnsByPREFIX(NAME_PREFIX_BL) !=0   );
//     Print(__FUNCTION__, " --------------- STATUS_SCOPE_LEVEL = ",  isPriceInScopeBUYLIMIT( PRICE_ScopeLevel_DN_ASK )   );  
//  }
}


