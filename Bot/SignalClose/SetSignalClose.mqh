#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalClose(int  number){   
//   if( TRADE_BUY      ) SetSignalCloseBuy      ( number);
//   if( TRADE_SELL     ) SetSignalCloseSell     ( number);
//   
   if( TRADE_BUYSTOP  ) SetSignalCloseBuyStop  ( number);   
   if( TRADE_BUYSTOP  ) SetSignalCloseBuyStopScope ( number); 
    
   if( TRADE_SELLSTOP ) SetSignalCloseSellStop ( number);
   if( TRADE_SELLSTOP ) SetSignalCloseSellStopScope ( number);
   
   if( TRADE_BUYLIMIT ) SetSignalCloseBuyLimit ( number);
   if( TRADE_BUYLIMIT ) SetSignalCloseBuyLimitScope( number);
   
   //if( TRADE_BUYLIMIT ) SetSignalCloseBuyLimitProfit ( number);
   
   if( TRADE_SELLLIMIT) SetSignalCloseSellLimit( number);
   if( TRADE_SELLLIMIT) SetSignalCloseSellLimitScope( number);
   
   
   //SetSignalCloseAll ( number);
   SetSignalCloseAll_PROFIT( number);
   
   //SetSignalCloseBUY_PROFIT( number);
   //SetSignalCloseSELL_PROFIT( number);
   
   SetSignalCloseBL_PROFIT( number);
   SetSignalCloseSL_PROFIT( number);
   
   SetSignalCloseUP_MOVE( number);
   SetSignalCloseDN_MOVE( number);

   //SetSignalCloseBUY_TRALL( number);
   //SetSignalCloseSELL_TRALL( number);
   
   SetSignalCloseBS_TRALL( number);
   SetSignalCloseSL_TRALL( number);
   SetSignalCloseBL_TRALL( number);
   SetSignalCloseSS_TRALL( number);
   
   
   //if( TRADE_SELLLIMIT) SetSignalCloseSellLimitProfit( number);
   //if( TRADE_SELLLIMIT) SetSignalCloseSellLimitSafe( number);
}


  