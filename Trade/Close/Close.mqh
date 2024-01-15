#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseAll_PREFIX(int number, CTrade &trade[]){

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
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseSL_PREFIX(int number, CTrade &trade[]){

   int p = 50; 
   //---
   while( GetCountPendByPREFIX( NAME_PREFIX_SL ) > 0 && p > 0){
        DeletePendByPREFIX ( number, NAME_PREFIX_SL, trade, _Symbol );
     p--;
   }
   p = 50; 
   //---
   while( GetCountPositionsByPREFIX( NAME_PREFIX_SL ) > 0 && p > 0){
        ClosePositionByPREFIX ( number, NAME_PREFIX_SL, trade, _Symbol );
     p--;
   }  
   
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseBL_PREFIX(int number, CTrade &trade[]){

   int p = 50; 
   //---
   while( GetCountPendByPREFIX( NAME_PREFIX_BL ) > 0 && p > 0){
        DeletePendByPREFIX ( number, NAME_PREFIX_BL, trade, _Symbol );
     p--;
   }
   p = 50; 
   //---
   while( GetCountPositionsByPREFIX( NAME_PREFIX_BL ) > 0 && p > 0){
        ClosePositionByPREFIX ( number, NAME_PREFIX_BL, trade, _Symbol );
     p--;
   }  
   
}    
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseBS_PREFIX(int number, CTrade &trade[]){

   int p = 50; 
   //---
   while( GetCountPendByPREFIX( NAME_PREFIX_BS ) > 0 && p > 0){
        DeletePendByPREFIX ( number, NAME_PREFIX_BS, trade, _Symbol );
     p--;
   }
   p = 50; 
   //---
   while( GetCountPositionsByPREFIX( NAME_PREFIX_BS ) > 0 && p > 0){
        ClosePositionByPREFIX ( number, NAME_PREFIX_BS, trade, _Symbol );
     p--;
   }  
   
}  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseSS_PREFIX(int number, CTrade &trade[]){

   int p = 50; 
   //---
   while( GetCountPendByPREFIX( NAME_PREFIX_SS ) > 0 && p > 0){
        DeletePendByPREFIX ( number, NAME_PREFIX_SS, trade, _Symbol );
     p--;
   }
   p = 50; 
   //---
   while( GetCountPositionsByPREFIX( NAME_PREFIX_SS ) > 0 && p > 0){
        ClosePositionByPREFIX ( number, NAME_PREFIX_SS, trade, _Symbol );
     p--;
   }  
   
}  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseUP_MOVE(int number, CTrade &trade[]){

   int p = 50; 
   //---
   while( GetCountPendByPREFIX( NAME_PREFIX_SL ) > 0 && p > 0){
        DeletePendByPREFIX ( number, NAME_PREFIX_SL, trade, _Symbol );
     p--;
   }

}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void CloseDN_MOVE(int number, CTrade &trade[]){

   int p = 50; 
   //---
   while( GetCountPendByPREFIX( NAME_PREFIX_BL ) > 0 && p > 0){
        DeletePendByPREFIX ( number, NAME_PREFIX_BL, trade, _Symbol );
     p--;
   }

}