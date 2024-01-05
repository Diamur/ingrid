#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
 double CalcVOLUME( string symbol, 
                    ENUM_POSITION_TYPE  type ,
                    int magic){
    double value = 0;
     for(int i=0 ; i<PositionsTotal();i++){
      if( PositionGetSymbol(i) == symbol )
       if( PositionGetInteger(POSITION_MAGIC) == magic)
         if( PositionGetInteger(POSITION_TYPE) == (int)type )   
           //if( PositionGetString(POSITION_COMMENT) == comment ) 
              value += PositionGetDouble(POSITION_VOLUME);
      }
     return (value); 
  }
