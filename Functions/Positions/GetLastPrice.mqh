#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetLastPrice( string symbol,
                     ENUM_POSITION_TYPE  type ,                    
                     int magic)
  {
   double price = 0;
     for(int i=PositionsTotal() ; i>=0;i--){
      if( PositionGetSymbol(i) == symbol )
       if( PositionGetInteger(POSITION_MAGIC) == magic)
         if( PositionGetInteger(POSITION_TYPE) == (int)type )         
         price = PositionGetDouble(POSITION_PRICE_OPEN);
         }
   return price;
  }
  
  
  