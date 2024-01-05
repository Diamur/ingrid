#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetLastTiket(    string symbol,
                     ENUM_POSITION_TYPE  type ,
                     int magic)
  {
   int tiket = -1;
     for(int i=PositionsTotal() ; i>=0;i--){
      if( PositionGetSymbol(i) == symbol )
       if( PositionGetInteger(POSITION_MAGIC) == magic)
         if( PositionGetInteger(POSITION_TYPE) == (int)type  )
             tiket =  (int)PositionGetInteger(POSITION_TICKET);
         }
   return tiket;
  }
  
  