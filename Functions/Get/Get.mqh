#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string getPrefix_MAIN(string Prefix_Sub){

for(int i=1;i<NUMBER_OF_KNEES;i++){
  
int const kstart = arrStartStop[i][0];
int const kstop  = arrStartStop[i][1];  
//if(kstart <10)
 for(int k=kstart;k<kstop;k++){ 
  string const MainNameOrder  = Order.arrBUYLIMIT[i];
  string const SubNameOrder   = Order.arrSELLSTOP[k];
   if(Prefix_Sub == SubNameOrder ) return MainNameOrder;
  }
 } 
return "";
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string getPrefix_FULL(string Prefix_Sub){

for(int i=1;i<NUMBER_OF_KNEES;i++){
  
int const kstart = arrStartStop[i][0];
int const kstop  = arrStartStop[i][1];  
//if(kstart <10)
 for(int k=kstart;k<kstop;k++){ 
  string const MainNameOrder  = Order.arrBUYLIMIT[i];
  string const SubNameOrder   = Order.arrSELLSTOP[k];
   if(Prefix_Sub == SubNameOrder ) return MainNameOrder + "#" + SubNameOrder;
  }
 } 
return "";
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetTicket_BY_PREFIX_FULL (string prefix_full){
 int ticket = -1;
  for(int i=0;i<PositionsTotal();i++){ 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic){
           if ( PositionGetString(POSITION_COMMENT) == prefix_full)
                         return (int)PositionGetInteger(POSITION_TICKET);
        }     
      }   
   return   ticket;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetTicket_BY_PREFIX (string prefix){
 int ticket = -1;
  for(int i=0;i<PositionsTotal();i++){ 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic){
           int const pos = StringFind( PositionGetString(POSITION_COMMENT),prefix);
           if(pos != -1){
                return (int)PositionGetInteger(POSITION_TICKET);
           }
        }    
      }   
   return   ticket;
}
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
double GetProfitBUY_PREFIX_FULL( string prefix_full ){
  double profit = 0;
    for(int i=0;i<PositionsTotal();i++)
      { 
       if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY){
            if( PositionGetString(POSITION_COMMENT) == prefix_full ) 
                   profit+= PositionGetDouble(POSITION_PROFIT) ;
            }
      }
   return profit;
}

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
double GetProfitSELL_PREFIX_FULL( string prefix_full ){
  double profit = 0;
    for(int i=0;i<PositionsTotal();i++)
      { 
       if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL){
          if( PositionGetString(POSITION_COMMENT) == prefix_full )
                  profit+= PositionGetDouble(POSITION_PROFIT) ;
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
double GetVolumeBUY_PREFIX_FULL(string prefix_full){
  double volume = 0;
    for(int i=0;i<PositionsTotal();i++)
      { 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY){
           if( PositionGetString(POSITION_COMMENT) == prefix_full  )          
                  volume+= PositionGetDouble(POSITION_VOLUME) ;
          } 
      }   
   return volume;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetVolumeSELL_PREFIX_FULL(string prefix_full){
  double volume = 0;
    for(int i=0;i<PositionsTotal();i++)
      { 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL){
           if( PositionGetString(POSITION_COMMENT) == prefix_full )          
                  volume+= PositionGetDouble(POSITION_VOLUME) ;
          } 
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
double GetVolumeBL_MAIN(string prefix){
  double volume = 0;
  int pos = -1;
    for(int i=0;i<PositionsTotal();i++)
      { 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY){
               pos = StringFind(PositionGetString(POSITION_COMMENT),prefix);
              if(pos != -1){
                  volume+= PositionGetDouble(POSITION_VOLUME) ;
              }
          }
      }   
   for(int i=0;i< OrdersTotal() ;i++){
       if((OrderGetTicket(i)) > 0) {
         if( OrderGetInteger(ORDER_MAGIC) == Magic)
          if( OrderGetInteger(ORDER_TYPE) == ORDER_TYPE_BUY_LIMIT) {
             pos = StringFind(OrderGetString(ORDER_COMMENT),prefix);
              if(pos != -1){
                  volume+= OrderGetDouble(ORDER_VOLUME_INITIAL) ;
              }  
          }        

        }
     }   
   return volume;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetVolumeSL_MAIN(string prefix){
  double volume = 0;
    int pos = -1;
    for(int i=0;i<PositionsTotal();i++)
      { 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL){
             pos = StringFind(PositionGetString(POSITION_COMMENT),prefix);
              if(pos != -1){
                  volume+= PositionGetDouble(POSITION_VOLUME) ;
              }
          }
      }   
   for(int i=0;i< OrdersTotal() ;i++){
       if((OrderGetTicket(i)) > 0) {
         if( OrderGetInteger(ORDER_MAGIC) == Magic)
          if( OrderGetInteger(ORDER_TYPE) == ORDER_TYPE_SELL_LIMIT) {
             pos = StringFind(OrderGetString(ORDER_COMMENT),prefix);
              if(pos != -1){
                  volume+= OrderGetDouble(ORDER_VOLUME_INITIAL) ;
              }    
           }   
        }
     }   
   return volume;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetVolumeBS_SUB(string prefix){
  double volume = 0;
    int pos = -1;
    for(int i=0;i<PositionsTotal();i++)
      { 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY){
            pos = StringFind(PositionGetString(POSITION_COMMENT),prefix);
              if(pos != -1){
                  volume+= PositionGetDouble(POSITION_VOLUME) ;
              }
          }
      }   
   for(int i=0;i< OrdersTotal() ;i++){
       if((OrderGetTicket(i)) > 0) {
         if( OrderGetInteger(ORDER_MAGIC) == Magic)
          if( OrderGetInteger(ORDER_TYPE) == ORDER_TYPE_BUY_STOP) {
                 int const pos = StringFind(OrderGetString(ORDER_COMMENT),prefix);
              if(pos != -1){
                  volume+= OrderGetDouble(ORDER_VOLUME_INITIAL) ;
              }     
           }     
        }
     }   
   return volume;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetVolumeSS_SUB(string prefix){
  double volume = 0;
    int pos = -1;
    for(int i=0;i<PositionsTotal();i++)
      { 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL){
            pos = StringFind(PositionGetString(POSITION_COMMENT),prefix);
              if(pos != -1){
                  volume+= PositionGetDouble(POSITION_VOLUME) ;
              }
          }
      }   
   for(int i=0;i< OrdersTotal() ;i++){
       if((OrderGetTicket(i)) > 0) {
         if( OrderGetInteger(ORDER_MAGIC) == Magic)
          if( OrderGetInteger(ORDER_TYPE) == ORDER_TYPE_SELL_STOP){
             pos = StringFind(OrderGetString(ORDER_COMMENT),prefix);
              if(pos != -1){
                  volume+= OrderGetDouble(ORDER_VOLUME_INITIAL) ;
              }     
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
      int pos = -1;
    for(int i=0;i<PositionsTotal();i++)
      { 
      if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_BUY){
            pos = StringFind(PositionGetString(POSITION_COMMENT),prefix);
              if(pos != -1){
                  volume+= PositionGetDouble(POSITION_VOLUME) ;
                }
          } 
         if( PositionGetInteger(POSITION_TYPE) == POSITION_TYPE_SELL){
             pos = StringFind(PositionGetString(POSITION_COMMENT),prefix);
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
int GetPipsProfitSELL_Prefix_Full(string prefix_full){     
  if(GetVolumeSELL_PREFIX_FULL(prefix_full) != 0){
      return  (int)( GetProfitSELL_PREFIX_FULL(prefix_full)/GetVolumeSELL_PREFIX_FULL(prefix_full));
    }
   return  0;
} 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int GetPipsProfitBUY_Prefix_Full(string prefix_full){   
  
  if(GetVolumeBUY_PREFIX_FULL(prefix_full) != 0){
      return  (int)( GetProfitBUY_PREFIX_FULL(prefix_full)/GetVolumeBUY_PREFIX_FULL(prefix_full));
    }
   return  0;
}  
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
 //Print(__FUNCTION__, " ----------------------- MathAbs(GetVolumeBUY_SELL_PREFIX(prefix) ) = ",MathAbs(GetVolumeBUY_SELL_PREFIX(prefix)) );
 //Print(__FUNCTION__, " ----------------------- GetProfitBUY_SELL_PREFIX(prefix)= ", GetProfitBUY_SELL_PREFIX(prefix)); 
 
 
 
  if(MathAbs(GetVolumeBUY_SELL_PREFIX(prefix,revers)) != 0){
      return  (int)( GetProfitBUY_SELL_PREFIX(prefix)/  MathAbs(GetVolumeBUY_SELL_PREFIX(prefix,revers))  ) ;
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

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double Get_Lot_BY_Money_Risk( string symbol, double risk  ){   
     
//   string depo_symbol1 ="";
//   string depo_symbol2 ="";
//   
   double sum_money_risk = 0;
   
   double minlot           = SymbolInfoDouble(symbol,SYMBOL_VOLUME_MIN);
   double maxlot           = SymbolInfoDouble(symbol,SYMBOL_VOLUME_MAX);
   double steplot          = SymbolInfoDouble(symbol,SYMBOL_VOLUME_STEP); 
   
   double lot = minlot ;
   
   //Свободные средства

   double _EQUITY       = AccountInfoDouble(ACCOUNT_EQUITY) ;
   double _MONEY        = _EQUITY ;
   double _MARGIN_FREE  = AccountInfoDouble(ACCOUNT_MARGIN_FREE) ;
   
   if( _EQUITY > _MARGIN_FREE ) _MONEY = _MARGIN_FREE;   
   
   // Кол-во денег с риском
   double money_risk = _MONEY * risk /100 ;
   
   //Кредитное плечо
   long _ACCOUNT_LEVERAGE = AccountInfoInteger(ACCOUNT_LEVERAGE);
   
   //Объем 1 лот 100 000 c учетом кредитого плеча
   double lot_1 = (double)( 100000 / _ACCOUNT_LEVERAGE);  
   
   // Цена пары
   double price = iClose(symbol,PERIOD_CURRENT,0); 
     
   //Сумма 1 лота
   double summa_1_lot = lot_1 * price; 


//   //Валюта депозита
//   string valuta_depo   = AccountInfoString(ACCOUNT_CURRENCY);
//  
//   // Берем валюты по отдельности
//   string symbol1 = StringSubstr(symbol,0,3);
//   string symbol2 = StringSubstr(symbol,3,3);
      
   // Цена депо со 2 символом пары
   //double price_depo_symbol1 = 0;   
   
   // Цена депо со 1 символом пары
   //double price_depo_symbol2 = 0;   
      
   //Перебор всех доступных валют
   
   // Когда депо == символ 1
//   if( valuta_depo == symbol1  )  { 
//        sum_money_risk = money_risk;
//        price_depo_symbol1 = 1;
//   }
//   // Когда депо == символ 2
//   
//   if( valuta_depo == symbol2  )  { 
//       sum_money_risk = money_risk * price ;
//       price_depo_symbol1 = price;
//   }  
   
//  if( valuta_depo != symbol2 && valuta_depo != symbol1  )  { 
//   for (int i =0 ; i< SymbolsTotal(false) ;i++ ){
//     
//      int pos_valuta_depo  = StringFind( SymbolName(i,false) , valuta_depo ) ;
//      int pos_symbol1      = StringFind( SymbolName(i,false) , symbol1 ) ;
//      int pos_symbol2      = StringFind( SymbolName(i,false) , symbol2 ) ;
//      
//      if( pos_valuta_depo != -1 && pos_symbol1 != -1 ) {
//       depo_symbol1 =  SymbolName(i,false);
//       price_depo_symbol1 = iClose(depo_symbol1,PERIOD_CURRENT,0);
//       // Если Депо базовая валюта в позиции = 1
//       if(pos_valuta_depo < 3){
//         //Cумма денежных рисков в валюте второго символ
//         sum_money_risk = money_risk * price_depo_symbol1 ;       
//       }
//       // Если Депо НЕ базовая валюта в позиции = 2
//       if(pos_valuta_depo > 1 )  {
//          //Cумма денежных рисков в валюте второго символ
//        if( price_depo_symbol1 != 0)  
//         sum_money_risk = money_risk / price_depo_symbol1 ;
//       }       
//      }     
//    }  
//   }

   
   lot = money_risk / summa_1_lot ;
   
   if(lot < minlot)  lot = minlot;
   if(lot > maxlot)  lot = maxlot; 
   if(lot > minlot && lot < maxlot )  {
   int k = (int)( (lot - minlot)/steplot );
   lot = NormalizeDouble(minlot + k * steplot ,2); 
   }
   
   return lot;
   }                         