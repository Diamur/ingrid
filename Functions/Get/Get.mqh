#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetTicket_SELLSTOP_CLOSE (double price){
 int ticket = -1;
      for(int i=0;i< OrdersTotal() ;i++){
       if((OrderGetTicket(i)) > 0) {
         if( OrderGetInteger(ORDER_MAGIC) == Magic)
          if( OrderGetInteger(ORDER_TYPE) == ORDER_TYPE_SELL_STOP)         
            if( OrderGetDouble(ORDER_PRICE_OPEN) < price) {       
                 return (int)OrderGetInteger(ORDER_TICKET);              
           }
        }
     }    
   return   ticket;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetCountAllTotalByMagic(){
  int count = 0;
   for(int i=0;i< OrdersTotal() ;i++){
       if((OrderGetTicket(i))>0) {
         if( OrderGetInteger(ORDER_MAGIC) == Magic)
           count++;
       }
     }    
  for(int i=0;i<PositionsTotal();i++)
      { 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
           count++;
      } 
   return count;
 }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetCountPositionsByPREFIX( string prefix ){
  int count = 0;    
  for(int i=0;i<PositionsTotal();i++){ 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic){
           int const pos = StringFind( PositionGetString(POSITION_COMMENT),prefix);
           if(pos != -1){
                count++;
           }
        }    
      } 
   return count;
 } 
 //+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetCountPendByPREFIX(string prefix){
  int count = 0;
   for(int i=0;i< OrdersTotal() ;i++){
       if((OrderGetTicket(i)) >0 ) {
         if( OrderGetInteger(ORDER_MAGIC) == Magic){
          int const pos = StringFind(  OrderGetString(ORDER_COMMENT),prefix);
            if(pos != -1){
                count++;
            }   
          
          }
        }
     }
   return count;
 }
 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetCountPendByComment(string comment){
  int count = 0;
   for(int i=0;i< OrdersTotal() ;i++){
       if((OrderGetTicket(i))>0) {
         if( OrderGetInteger(ORDER_MAGIC) == Magic)
           if( OrderGetString(ORDER_COMMENT) == comment)         
           count++;
       }
     }
   return count;
 }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetCountPendByType(ENUM_ORDER_TYPE type){
  int count = 0;
   for(int i=0;i< OrdersTotal() ;i++){
       if((OrderGetTicket(i))>0) {
         if( OrderGetInteger(ORDER_MAGIC) == Magic)
          if(OrderGetInteger(ORDER_TYPE) == type )
           count++;
       }
     }    
   return count;
 }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetCountPositionByType(ENUM_POSITION_TYPE type){
  int count = 0;
    for(int i=0;i<PositionsTotal();i++)
      { 
       if( PositionGetSymbol(i) != "" )  
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == type)
           count++;
      }   
   return count;
 } 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetCountPositionByComment(string comment){
  int count = 0;
    for(int i=0;i<PositionsTotal();i++)
      { 
       if( PositionGetSymbol(i) != "" )  
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetString(POSITION_COMMENT) == comment)
           count++;
      }   
   return count;
 } 
 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int  getMULT( ENUM_POSITION_TYPE type ){  
  int mult = 1;
  if(type == POSITION_TYPE_BUY)  return (int)MathPow(  2, GetCountPositionByType(POSITION_TYPE_BUY)) ;     
  if(type == POSITION_TYPE_SELL) return (int)MathPow(  2, GetCountPositionByType(POSITION_TYPE_SELL));     
    return mult; 
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string GetCommentBUYLIMIT( int mult  ){ 
  if(mult == 1   ) return COMMENT_BUYLIMIT_A0;
  if(mult == 2   ) return COMMENT_BUYLIMIT_A1;
  if(mult == 4   ) return COMMENT_BUYLIMIT_A2;
  if(mult == 8   ) return COMMENT_BUYLIMIT_A3;
  if(mult == 16  ) return COMMENT_BUYLIMIT_A4;
  if(mult == 32  ) return COMMENT_BUYLIMIT_A5;
  if(mult == 64  ) return COMMENT_BUYLIMIT_A6;
  if(mult == 128 ) return COMMENT_BUYLIMIT_A7;
  if(mult == 256 ) return COMMENT_BUYLIMIT_A8;
  return "";
}
 //+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string GetCommentSELLLIMIT( int mult  ){
  if(mult == 1   ) return COMMENT_SELLLIMIT_A0;
  if(mult == 2   ) return COMMENT_SELLLIMIT_A1;
  if(mult == 4   ) return COMMENT_SELLLIMIT_A2;
  if(mult == 8   ) return COMMENT_SELLLIMIT_A3;
  if(mult == 16  ) return COMMENT_SELLLIMIT_A4;
  if(mult == 32  ) return COMMENT_SELLLIMIT_A5;
  if(mult == 64  ) return COMMENT_SELLLIMIT_A6;
  if(mult == 128 ) return COMMENT_SELLLIMIT_A7;
  if(mult == 256 ) return COMMENT_SELLLIMIT_A8;
    return "";
}
//<><><><><><><><><><><><><><><><><><><><><><><><><  PROFIT  ><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetProfitBUY_PREFIX( string prefix ){
  double profit = 0;
    for(int i=0;i<PositionsTotal();i++)
      { 
       if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY){
          int const pos = StringFind(PositionGetString(POSITION_COMMENT), prefix );
              if(pos != -1){
                  profit+= PositionGetDouble(POSITION_PROFIT) ;
              }
          }
      }   
   return profit;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetProfitSELL_PREFIX( string prefix ){
  double profit = 0;
    for(int i=0;i<PositionsTotal();i++)
      { 
       if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL){
          int const pos = StringFind(PositionGetString(POSITION_COMMENT),prefix);
              if(pos != -1){
                  profit+= PositionGetDouble(POSITION_PROFIT) ;
              }
          }
      }   
   return profit;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetProfitBUY_SELL_PREFIX( string prefix ){
  double profit = 0;
    for(int i=0;i<PositionsTotal();i++){ 
       if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic){
          int const pos = StringFind(PositionGetString(POSITION_COMMENT),prefix);
              if(pos != -1){
                  profit+= PositionGetDouble(POSITION_PROFIT) ;
              }
          }
      }   
   return profit;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetProfitBUY(){
  double profit = 0;
    for(int i=0;i<PositionsTotal();i++){ 
       if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY)
           profit+= PositionGetDouble(POSITION_PROFIT) ;
      }   
   return profit;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetProfitSELL(){
  double profit = 0;
    for(int i=0;i<PositionsTotal();i++)
      { 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL)
           profit+= PositionGetDouble(POSITION_PROFIT) ;
      }   
   return profit;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetProfit(){
   return  ( GetProfitBUY() +  GetProfitSELL());
}
//<><><><><><><><><><><><><><><><><><><><><><><><><  VOLUME  ><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetVolumeBUY(){
  double volume = 0;
    for(int i=0;i<PositionsTotal();i++)
      { 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY)
           volume+= PositionGetDouble(POSITION_VOLUME) ;
           
      }   
   return volume;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetVolumeSELL(){
  double volume = 0;
    for(int i=0;i<PositionsTotal();i++)
      { 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL)
           volume+= PositionGetDouble(POSITION_VOLUME) ;
           
      }   
   return volume;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetVolumeSELL_PREFIX(string prefix){
  double volume = 0;
    for(int i=0;i<PositionsTotal();i++)
      { 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL){
            int const pos = StringFind(PositionGetString(POSITION_COMMENT),prefix);
              if(pos != -1){
                  volume+= PositionGetDouble(POSITION_VOLUME) ;
                }
          } 
      }   
   return volume;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetVolumeBUY_PREFIX(string prefix){
  double volume = 0;
    for(int i=0;i<PositionsTotal();i++)
      { 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY){
            int const pos = StringFind(PositionGetString(POSITION_COMMENT),prefix);
              if(pos != -1){
                  volume+= PositionGetDouble(POSITION_VOLUME) ;
                }
          } 
      }   
   return volume;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetVolumeBUY_SELL_PREFIX(string prefix, bool revers = false ){
  double volume = 0;
    for(int i=0;i<PositionsTotal();i++)
      { 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY){
            int const pos = StringFind(PositionGetString(POSITION_COMMENT),prefix);
              if(pos != -1){
                  volume+= PositionGetDouble(POSITION_VOLUME) ;
                }
          } 
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL){
            int const pos = StringFind(PositionGetString(POSITION_COMMENT),prefix);
              if(pos != -1){
                  volume-= PositionGetDouble(POSITION_VOLUME) ;
                }
          } 
          
      }   
   return ( revers? -1 : 1 ) *volume;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetVolume(){
   return  GetVolumeBUY() -  GetVolumeSELL();
}
//<><><><><><><><><><><><><><><><><><><><><><><><><  PIPS  ><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetPipsProfitBUY_Prefix(string prefix){     
  if(GetVolumeBUY_PREFIX(prefix) != 0){
      return  (int)( GetProfitBUY_PREFIX(prefix)/GetVolumeBUY_PREFIX(prefix));
    }
   return  0;
}  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetPipsProfitSELL_Prefix(string prefix){     
  if(GetVolumeSELL_PREFIX(prefix) != 0){
      return  (int)( GetProfitSELL_PREFIX(prefix)/GetVolumeSELL_PREFIX(prefix));
    }
   return  0;
}  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetPipsProfitBUY_SELL_Prefix(string prefix, bool revers = false){    
 
 //Print(__FUNCTION__, " ----------------------- prefix = ", prefix );  
 //Print(__FUNCTION__, " ----------------------- GetVolumeBUY_SELL_PREFIX(prefix)= ",GetVolumeBUY_SELL_PREFIX(prefix) );
 //Print(__FUNCTION__, " ----------------------- GetProfitBUY_SELL_PREFIX(prefix)= ", GetProfitBUY_SELL_PREFIX(prefix)); 
 
  if(GetVolumeBUY_SELL_PREFIX(prefix,revers) != 0){
      return  (int)( GetProfitBUY_SELL_PREFIX(prefix)/  GetVolumeBUY_SELL_PREFIX(prefix,revers)  ) ;
  }
    
   return  0;
}  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetPipsProfitBUY(){     
  if(GetVolumeBUY() != 0){
      return  (int)( GetProfitBUY()/GetVolumeBUY());
    }
   return  0;
}                  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetPipsProfitSELL(){     
   if(GetVolumeSELL() != 0){
      return  (int)( GetProfitSELL()/GetVolumeSELL());
    }
   return  0;
}                  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetPipsProfit(){  
  
  if(GetVolume() != 0){
      return  (int)( GetProfit()/ MathAbs(GetVolume()) ) ;
    }   
  return 0;
}                  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetProfitMainBUY(){
  double profit = 0;
    for(int i=0;i<PositionsTotal();i++)
      { 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY)
          if( PositionGetString(POSITION_COMMENT) == NAME_BL_0 )   profit+= PositionGetDouble(POSITION_PROFIT) ;
          if( PositionGetString(POSITION_COMMENT) == NAME_BL_1 )   profit+= PositionGetDouble(POSITION_PROFIT) ;
          if( PositionGetString(POSITION_COMMENT) == NAME_BL_2 )   profit+= PositionGetDouble(POSITION_PROFIT) ;
          if( PositionGetString(POSITION_COMMENT) == NAME_BL_3 )   profit+= PositionGetDouble(POSITION_PROFIT) ;
          if( PositionGetString(POSITION_COMMENT) == NAME_BL_4 )   profit+= PositionGetDouble(POSITION_PROFIT) ;
          if( PositionGetString(POSITION_COMMENT) == NAME_BL_5 )   profit+= PositionGetDouble(POSITION_PROFIT) ;
          if( PositionGetString(POSITION_COMMENT) == NAME_BL_6 )   profit+= PositionGetDouble(POSITION_PROFIT) ;
      }   
   return profit;
}
//---
double GetVolumeMainBUY(){
  double volume = 0;
    for(int i=0;i<PositionsTotal();i++)
      { 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY)
          if( PositionGetString(POSITION_COMMENT) == NAME_BL_0 )   volume+= PositionGetDouble(POSITION_VOLUME) ;
          if( PositionGetString(POSITION_COMMENT) == NAME_BL_1 )   volume+= PositionGetDouble(POSITION_VOLUME) ;
          if( PositionGetString(POSITION_COMMENT) == NAME_BL_2 )   volume+= PositionGetDouble(POSITION_VOLUME) ;
          if( PositionGetString(POSITION_COMMENT) == NAME_BL_3 )   volume+= PositionGetDouble(POSITION_VOLUME) ;
          if( PositionGetString(POSITION_COMMENT) == NAME_BL_4 )   volume+= PositionGetDouble(POSITION_VOLUME) ;
          if( PositionGetString(POSITION_COMMENT) == NAME_BL_5 )   volume+= PositionGetDouble(POSITION_VOLUME) ;
          if( PositionGetString(POSITION_COMMENT) == NAME_BL_6 )   volume+= PositionGetDouble(POSITION_VOLUME) ;
      }   
   return volume;
}
//---
int GetPipsProfitMainBUY(){
     //Print(__FUNCTION__, " =================================================== ");
     
  int pips = 0;
     if( GetVolumeMainBUY() != 0){
        pips = (int)( GetProfitMainBUY() / GetVolumeMainBUY() ) ;
     }
     
     //Print(__FUNCTION__, " --------------- GetProfitMainBUY()  = ",GetProfitMainBUY());
     //Print(__FUNCTION__, " ---------------  GetVolumeMainBUY() = ",  GetVolumeMainBUY() );
     //Print(__FUNCTION__, " --------------- pips = ", pips);
     
     
   return pips;
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//double GetProfitMainSELL(){
//  double profit = 0;
//    for(int i=0;i<PositionsTotal();i++)
//      { 
//      if( PositionGetSymbol(i) != "" ) 
//        if( PositionGetInteger(POSITION_MAGIC) == Magic)
//         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL)
//          if( PositionGetString(POSITION_COMMENT) == NAME_BL_0 )   profit+= PositionGetDouble(POSITION_PROFIT) ;
//          if( PositionGetString(POSITION_COMMENT) == NAME_BL_1 )   profit+= PositionGetDouble(POSITION_PROFIT) ;
//          if( PositionGetString(POSITION_COMMENT) == NAME_BL_2 )   profit+= PositionGetDouble(POSITION_PROFIT) ;
//          if( PositionGetString(POSITION_COMMENT) == NAME_BL_3 )   profit+= PositionGetDouble(POSITION_PROFIT) ;
//          if( PositionGetString(POSITION_COMMENT) == NAME_BL_4 )   profit+= PositionGetDouble(POSITION_PROFIT) ;
//          if( PositionGetString(POSITION_COMMENT) == NAME_BL_5 )   profit+= PositionGetDouble(POSITION_PROFIT) ;
//          if( PositionGetString(POSITION_COMMENT) == NAME_BL_6 )   profit+= PositionGetDouble(POSITION_PROFIT) ;
//      }   
//   return profit;
//}
             
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+                
int GetPipsDT_StartStep_UP(){
return (int)( (  jSELLLIMIT[NAME_SL_0][NAME_PRICE_OPEN].ToDbl() - SymbolInfoDouble(NULL,SYMBOL_BID)  )/POINT ); 
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetPipsDT_StartStep_DN(){
return (int)( (SymbolInfoDouble(NULL,SYMBOL_ASK) - jBUYLIMIT[NAME_BL_0][NAME_PRICE_OPEN].ToDbl()   )/POINT ); 
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int getDTPriceMAX_UP(double price){ return POINT !=0 ?  (int)( ( PriceMAX_UP - price ) / POINT) : 0 ; }
int getDTPriceMIN_UP(double price){ return POINT !=0 ?  (int)( ( PriceMIN_UP - price ) / POINT) : 0 ; }
int getDTPriceMAX_DN(double price){ return POINT !=0 ?  (int)( ( price - PriceMAX_DN ) / POINT) : 0 ; }
int getDTPriceMIN_DN(double price){ return POINT !=0 ?  (int)( ( price - PriceMIN_DN ) / POINT) : 0 ; }

                         