#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalOpenBuyLimitMoveScope( int number){
SignalOpenBuyLimitMoveScope[number] = false; 
if(Status.OpenBUYLIMIT[number][STATUS_WORK]     = WorkingHour() ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_TRADE_DN] = TRADE_DN ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_MAIN_ON]  = MAIN_ON ? true: false )
//if(Status.OpenBUYLIMIT[number][STATUS_TRADE]    = TRADE ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_SCOPE_ON] = ScopeLevel != 0 ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_COUNT]    = ( GetCountPendByPREFIX(NAME_PREFIX_BL) == 0  &&  GetCountPositionsByPREFIX(NAME_PREFIX_BL) ==0 )? true: false )
          
SignalOpenBuyLimitMoveScope[number] = true;

//if(SignalOpenBuyLimitMoveScope[number]){
//     Print(__FUNCTION__, "%%%%%%%%%%%%%%%%%%%%%%% BUYLIMIT MOVE SCOPE  %%%%%%%%%%%%%%%%%% " );
// 
//     Print(__FUNCTION__, " --------------- STATUS_TRADE     = ", WorkingHour()  );
//     Print(__FUNCTION__, " --------------- STATUS_WORK      = ", TRADE  );
//     Print(__FUNCTION__, " --------------- STATUS_TRADE_DN  = ", TRADE_DN  );
//     Print(__FUNCTION__, " --------------- STATUS_MAIN_ON   = ", MAIN_ON );
//     Print(__FUNCTION__, " --------------- STATUS_SCOPE_ON  = ", ScopeLevel == 0  );     
//     Print(__FUNCTION__, " --------------- STATUS_COUNT     = ", GetCountPendByPREFIX(NAME_PREFIX_BL) ==0   );
//  }
}


