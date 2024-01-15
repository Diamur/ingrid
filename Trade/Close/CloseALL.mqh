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

  
void CloseAll_PREFIX(){

  int p = 50; 
   //---
   while( GetCountPendByPREFIX( NAME_PREFIX_SL ) > 0 && p > 0){
        DeletePendByPREFIX ( number, NAME_PREFIX_SL, trade, _Symbol );
     p--;
   }
   p = 50; 
   //---
   while( GetCountPendByPREFIX( NAME_PREFIX_BL ) > 0 && p > 0){
        DeletePendByPREFIX ( number, NAME_PREFIX_BL, trade, _Symbol );
     p--;
   }
   p = 50; 
   
   //---
   while( GetCountPositionsByPREFIX( NAME_PREFIX_SL ) > 0 && p > 0){
        ClosePositionByPREFIX ( number, NAME_PREFIX_SL, trade, _Symbol );
     p--;
   }
    p = 50; 
   //---
   while( GetCountPositionsByPREFIX( NAME_PREFIX_BL ) > 0 && p > 0){
        ClosePositionByPREFIX ( number, NAME_PREFIX_BL, trade, _Symbol );
     p--;
   }
   SetPARAMETRS_START(NAME_ALL);

}