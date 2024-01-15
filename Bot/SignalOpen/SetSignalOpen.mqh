#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalOpen(int  number ){   
   //if( TRADE_BUY      ) SetSignalOpenBuy      (number);
   //if( TRADE_SELL     ) SetSignalOpenSell     (number);
   
   if( TRADE_BUYSTOP  ) SetSignalOpenBuyStop  (number);
   if( TRADE_BUYSTOP  ) SetSignalOpenBuyStopScope  (number);
   
   if( TRADE_SELLSTOP ) SetSignalOpenSellStop (number);
   if( TRADE_SELLSTOP ) SetSignalOpenSellStopScope (number);
   
   if( TRADE_BUYLIMIT ) SetSignalOpenBuyLimit (number);  
   if( TRADE_BUYLIMIT ) SetSignalOpenBuyLimitScope (number);
   //if( TRADE_BUYLIMIT ) SetSignalOpenBuyLimitMove (number);
   //if( TRADE_BUYLIMIT ) SetSignalOpenBuyLimitMoveScope (number);    
 
   if( TRADE_SELLLIMIT) SetSignalOpenSellLimit(number);
   if( TRADE_SELLLIMIT) SetSignalOpenSellLimitScope(number);
   
      
}


