#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
 double CalcProfitByTicket(string symbol, 
                              int ticket ,
                              int magic){
    double profit = 0;
     for(int i=0 ; i<PositionsTotal();i++){
      if(PositionGetSymbol(i) == symbol )
       if( PositionGetInteger(POSITION_MAGIC) == magic)
         if( PositionGetInteger(POSITION_TICKET) == ticket )   
           //if( PositionGetString(POSITION_COMMENT) == comment ) 
              profit += PositionGetDouble(POSITION_PROFIT) ;

      }
     return (profit); 
  }
