#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
 double CalcProfitByType( string symbol, 
                    ENUM_POSITION_TYPE  type ,
                    int magic){
    double profit = 0;
     for(int i=0 ; i<PositionsTotal();i++){
      if(PositionGetSymbol(i) == symbol )
       if( PositionGetInteger(POSITION_MAGIC) == magic)
         if( PositionGetInteger(POSITION_TYPE) == (int)type )   
           //if( PositionGetString(POSITION_COMMENT) == comment ) 
              profit += PositionGetDouble(POSITION_PROFIT) ;

      }
     return (profit); 
  }
