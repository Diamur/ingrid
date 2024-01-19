#include  "..\..\..\setting\FilePathMain.mqh" 
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><>    PROFIT      <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//+------------------------------------------------------------------+
//|                PRICE OUT FOOD SL  PROFIT < 1                                          |
//+------------------------------------------------------------------+
void SetSignalCloseSL_OUT_PRICE ( int number){
  SignalCloseSL_OUT_PRICE[number] = false; 
 //---
  if(Status.CloseSL[number][STATUS_PIPS_OUT]    = PipsOutPrice !=0 ? true: false )  
  if(Status.CloseSL[number][STATUS_ASK]         = SymbolInfoDouble(NULL,SYMBOL_ASK) < PriceMIN_UP   ? true: false )  
  if(Status.CloseSL[number][STATUS_DT_OUT]      = (PriceMIN_UP - SymbolInfoDouble(NULL,SYMBOL_ASK) )/POINT > PipsOutPrice ? true: false )
  if(Status.CloseBL[number][STATUS_PROFIT_SELL] =  GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_SL) < 0 ? true: false )  
 //---
 SignalCloseSL_OUT_PRICE[number] = true; 
//---
}
//+------------------------------------------------------------------+
//|                PRICE OUT FOOD BL  PROFIT < 1                                          |
//+------------------------------------------------------------------+
void SetSignalCloseBL_OUT_PRICE ( int number){
  SignalCloseBL_OUT_PRICE[number] = false; 
 //---
  if(Status.CloseBL[number][STATUS_PIPS_OUT]    = PipsOutPrice !=0 ? true: false )  
  if(Status.CloseBL[number][STATUS_BID]         = SymbolInfoDouble(NULL,SYMBOL_BID) > PriceMAX_DN  ? true: false )  
  if(Status.CloseBL[number][STATUS_DT_OUT]      = ( SymbolInfoDouble(NULL,SYMBOL_BID) - PriceMAX_DN )/POINT > PipsOutPrice ? true: false )
  if(Status.CloseBL[number][STATUS_PROFIT_BUY]  =  GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_BL) < 0 ? true: false )  
 //---
 SignalCloseBL_OUT_PRICE[number] = true; 
//---
}
//+------------------------------------------------------------------+
//|                  PROFIT                                          |
//+------------------------------------------------------------------+
void SetSignalCloseAll_PROFIT ( int number){
 SignalCloseAll_PROFIT[number] = false; 
//---
  //if(Status.CloseALL[number][STATUS_TRADE]           = TRADE ? true: false )
  if(Status.CloseALL[number][STATUS_PROFIT_FULL]     = Profit_Eqity !=0 ? true: false )  
  //if(Status.CloseALL[number][STATUS_TRALL]           = TRALL==0 ? true: false )  
  if(Status.CloseALL[number][STATUS_PROFIT_BUY]      = EQITY - BALANCE_START > Profit_Eqity && EQITY - BALANCE_START != 0 ? true: false )
//---
 SignalCloseAll_PROFIT[number] = true; 
//---
}
//+------------------------------------------------------------------+
//|                 LOW PROFIT                                          |
//+------------------------------------------------------------------+
void SetSignalCloseAll_LOWPROFIT ( int number){
 SignalCloseAll_LOWPROFIT[number] = false; 
//---
  //if(Status.CloseALL[number][STATUS_TRADE]           = TRADE ? true: false )
  if(Status.CloseALL[number][STATUS_PROFIT_FULL]     = LowProfit_Eqity !=0 ? true: false )  
  //if(Status.CloseALL[number][STATUS_TRALL]           = TRALL==0 ? true: false )  
  if(Status.CloseALL[number][STATUS_PROFIT_BUY]      = EQITY - BALANCE_START < LowProfit_Eqity && EQITY - BALANCE_START != 0 ? true: false )
//---
 SignalCloseAll_LOWPROFIT[number] = true; 
//---
}

//+------------------------------------------------------------------+
//|                  PROFIT UP SL                                         |
//+------------------------------------------------------------------+
void SetSignalCloseSL_PROFIT ( int number){
 SignalCloseSL_PROFIT[number] = false; 
//---
  if(Status.CloseSL[number][STATUS_TRALL]           = Trall_SL==0 ? true: false )  
  if(Status.CloseSL[number][STATUS_PROFIT_SELL]      =  GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_SL,true) > ProfitPips_SL ? true: false )
//---
 SignalCloseSL_PROFIT[number] = true; 
//---
}
//+------------------------------------------------------------------+
//|                  PROFIT DN BL                                         |
//+------------------------------------------------------------------+
void SetSignalCloseBL_PROFIT ( int number){
 SignalCloseBL_PROFIT[number] = false; 
 //---
  if(Status.CloseBL[number][STATUS_TRALL]           = Trall_BL==0 ? true: false )  
  if(Status.CloseBL[number][STATUS_PROFIT_BUY]      =  GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_BL) > ProfitPips_BL ? true: false )
 //---
  SignalCloseBL_PROFIT[number] = true; 
  
  if(  SignalCloseBL_PROFIT[number] ) {
      
      Print(__FUNCTION__, " --------------- GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_BL)= ",GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_BL));
      Print(__FUNCTION__, " --------------- ProfitPips_BL= ",ProfitPips_BL );
      
      
    }
  
 //---
}

//+------------------------------------------------------------------+
//|                           BUY                                       |
//+------------------------------------------------------------------+
//void SetSignalCloseBUY_PROFIT( int number){
// SignalCloseBUY_PROFIT[number] = false; 
// 
//  if(Status.CloseBUY[number][STATUS_TRADE]           = TRADE ? true: false )
//  if(Status.CloseBUY[number][STATUS_PROFIT_FULL]     = !Profit_FULL_ON ? true: false )  
//  if(Status.CloseBUY[number][STATUS_PROFIT_BUY]      = TRALL==0 && GetPipsProfitBUY() > ProfitPipsPLUS_BUY ? true: false )
// SignalCloseBUY_PROFIT[number] = true; 
//}
//+------------------------------------------------------------------+
//|                       SELL                                           |
//+------------------------------------------------------------------+
//void SetSignalCloseSELL_PROFIT( int number){
// SignalCloseSELL_PROFIT[number] = false; 
// 
//  if(Status.CloseSELL[number][STATUS_TRADE]           = TRADE ? true: false )
//  if(Status.CloseSELL[number][STATUS_PROFIT_FULL]     = !Profit_FULL_ON ? true: false )  
//  if(Status.CloseSELL[number][STATUS_PROFIT_SELL]     = TRALL==0 && GetPipsProfitSELL() > ProfitPipsPLUS_SELL ? true: false )
// SignalCloseSELL_PROFIT[number] = true; 
//}


//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><>    MOVE       <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//+------------------------------------------------------------------+
//|                  MOVE SL UP                                         |
//+------------------------------------------------------------------+
void SetSignalCloseUP_MOVE ( int number){
   //---
    SignalCloseUP_MOVE[number] = false; 
   //---
   if(Status.CloseSL[number][STATUS_TRADE_MAIN_UP]   =  TRADE_MAIN_UP ? true: false )
   if(Status.CloseSL[number][STATUS_MAIN_ON]         =  MAIN_ON ? true: false )
   if(Status.CloseSL[number][STATUS_PEND]            =  jSELLLIMIT[NAME_SL_0][NAME_STATUS].ToStr() == NAME_STATUS_PEND ? true: false )
   if(Status.CloseSL[number][STATUS_NEWBAR]          =  BarReMOVE != iTime(NULL,PERIOD_CURRENT,0) ? true: false )
   if(Status.CloseSL[number][STATUS_COUNT]           =  GetCountPendByPREFIX( NAME_PREFIX_SL) > 0 ? true: false ) 
   if(Status.CloseSL[number][STATUS_COUNT_POS]       =  GetCountPositionsByPREFIX( NAME_PREFIX_SL) == 0 ? true: false ) 
   if(Status.CloseSL[number][STATUS_DT_START_STEP]   =  GetPipsDT_StartStep_UP() > StartStep  +  SymbolInfoInteger(NULL,SYMBOL_SPREAD) ? true: false )
   //---
   SignalCloseUP_MOVE[number] = true;  
//---
}
//+------------------------------------------------------------------+
//|                  MOVE BL DN                                         |
//+------------------------------------------------------------------+
void SetSignalCloseDN_MOVE ( int number){
   //---
    SignalCloseDN_MOVE[number] = false; 
   //---
   if(Status.CloseBL[number][STATUS_TRADE_MAIN_DN]   =  TRADE_MAIN_DN ? true: false )
   if(Status.CloseBL[number][STATUS_MAIN_ON]         =  MAIN_ON ? true: false )
   if(Status.CloseBL[number][STATUS_PEND]            =  jBUYLIMIT[NAME_BL_0][NAME_STATUS].ToStr() == NAME_STATUS_PEND ? true: false )
   if(Status.CloseBL[number][STATUS_NEWBAR]          =  BarReMOVE != iTime(NULL,PERIOD_CURRENT,0) ? true: false )
   if(Status.CloseBL[number][STATUS_COUNT]           =  GetCountPendByPREFIX( NAME_PREFIX_BL) > 0 ? true: false )         
   if(Status.CloseBL[number][STATUS_COUNT_POS]       =  GetCountPositionsByPREFIX( NAME_PREFIX_BL) == 0 ? true: false )                                             
   if(Status.CloseBL[number][STATUS_DT_START_STEP]   =  GetPipsDT_StartStep_DN() > StartStep  +  SymbolInfoInteger(NULL,SYMBOL_SPREAD) ? true: false )
   //---
   SignalCloseDN_MOVE[number] = true; 
   //---
}
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><>  TRALL        <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//+------------------------------------------------------------------+
//|                         SL  SELL                                       |
//+------------------------------------------------------------------+
void SetSignalCloseSL_TRALL( int number){
 SignalCloseSL_TRALL[number] = false; 
 //---
//if(Status.CloseALL[number][STATUS_TRADE]           = TRADE ? true: false )
if(Status.CloseSL[number][STATUS_STOPLOSS]        = STOPLOSS_SL != 0 && SymbolInfoDouble(NULL,SYMBOL_BID) > STOPLOSS_SL ? true: false )
 //---
 SignalCloseSL_TRALL[number] = true; 
}
//+------------------------------------------------------------------+
//|                         SS  SELL                                       |
//+------------------------------------------------------------------+
void SetSignalCloseSS_TRALL( int number){
 SignalCloseSS_TRALL[number] = false; 
 //---
//if(Status.CloseALL[number][STATUS_TRADE]           = TRADE ? true: false )
if(Status.CloseSS[number][STATUS_STOPLOSS]        = STOPLOSS_SS != 0 && SymbolInfoDouble(NULL,SYMBOL_BID) > STOPLOSS_SS ? true: false )
 //---
 SignalCloseSS_TRALL[number] = true; 
 
 //Print(__FUNCTION__, " ============================================================================= ");
 //Print(__FUNCTION__, " -------------------------------------- STOPLOSS_SS = ", STOPLOSS_SS);
 //Print(__FUNCTION__, " -------------------------------------- SymbolInfoDouble(NULL,SYMBOL_BID) = ", SymbolInfoDouble(NULL,SYMBOL_BID));
 // Print(__FUNCTION__, " -------------------------------------- SymbolInfoDouble(NULL,SYMBOL_BID) > STOPLOSS_SS = ", SymbolInfoDouble(NULL,SYMBOL_BID) > STOPLOSS_SS);
 
 
}
//+------------------------------------------------------------------+
//|                       BL    BUY                                       |
//+------------------------------------------------------------------+
void SetSignalCloseBL_TRALL( int number){
 SignalCloseBL_TRALL[number] = false; 
 //---
 //if(Status.CloseALL[number][STATUS_TRADE]           = TRADE ? true: false )
 if(Status.CloseBL[number][STATUS_STOPLOSS]        = STOPLOSS_BL != 0 && SymbolInfoDouble(NULL,SYMBOL_ASK) < STOPLOSS_BL ? true: false )
 //---
 SignalCloseBL_TRALL[number] = true; 
}
//+------------------------------------------------------------------+
//|                       BS    BUY                                       |
//+------------------------------------------------------------------+
void SetSignalCloseBS_TRALL( int number){
 SignalCloseBS_TRALL[number] = false; 
 //---
 //if(Status.CloseALL[number][STATUS_TRADE]           = TRADE ? true: false )
 if(Status.CloseBS[number][STATUS_STOPLOSS]        = STOPLOSS_BS != 0 && SymbolInfoDouble(NULL,SYMBOL_ASK) < STOPLOSS_BS ? true: false )
 //---
 SignalCloseBS_TRALL[number] = true; 
}


