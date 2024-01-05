#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseALL(int number, CTrade  &trade[], string symbol, ENUM_POSITION_TYPE type,  int magic ){
    double profit = 0;
    if(type  !=-1)
       for(int i=PositionsTotal()-1;i>=0;i--){
           if( a_position.SelectByIndex(i) ){
             if(a_position.Magic() == magic)
              if(a_position.Symbol() == symbol )
               if(a_position.PositionType() == type ||  type == -1  ) //  type == -1  - закрываем все типы           
                 trade[number].PositionClose(a_position.Ticket());
            }
         }  
   }

  
