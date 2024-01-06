#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                     >>>>>>>>>>>> OUT <<<<<<<<<<<<                 |
//+------------------------------------------------------------------+
bool isPriceOutScopeLevelPend_DN(double price){
 bool _bool = false;
      for(int i=0;i< OrdersTotal() ;i++){
       if((OrderGetTicket(i)) > 0) {
         if( OrderGetInteger(ORDER_MAGIC) == Magic)
           if( OrderGetDouble(ORDER_PRICE_OPEN) < price) {       
              //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>> ScopeLevelPend_DN >>>>>>>>>>>>>>>>>>>> " );      
              //Print(__FUNCTION__, "-----------------------    tiket = " ,   OrderGetInteger(ORDER_TICKET)   );  
              //Print(__FUNCTION__, "-----------------------    price = " ,  price   );                
              //Print(__FUNCTION__, "-----------------------    ORDER_PRICE_OPEN = " ,  OrderGetDouble(ORDER_PRICE_OPEN)   );                
              //Print(__FUNCTION__, "-----------------------    ORDER_COMMENT = " ,  OrderGetString(ORDER_COMMENT)   );  
             return true;
           }
           
          
       }
     }    
 return _bool; 
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool isPriceOutScopeLevelPend_UP(double price){
 bool _bool = false;
      for(int i=0;i< OrdersTotal() ;i++){
       if((OrderGetTicket(i)) > 0) {
         if( OrderGetInteger(ORDER_MAGIC) == Magic)
           if( OrderGetDouble(ORDER_PRICE_OPEN) > price){           
              //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>> ScopeLevelPend_UP >>>>>>>>>>>>>>>>>> " ); 
              //Print(__FUNCTION__, "-----------------------    tiket = " ,   OrderGetInteger(ORDER_TICKET)   ); 
              //Print(__FUNCTION__, "-----------------------    price = " ,  price   );       
              //Print(__FUNCTION__, "-----------------------    ORDER_PRICE_OPEN = " ,  OrderGetDouble(ORDER_PRICE_OPEN)   );   
              //Print(__FUNCTION__, "-----------------------    ORDER_COMMENT = " ,  OrderGetString(ORDER_COMMENT)   );                           
            return true;
          }
       }
     }    
 return _bool; 
}
//+------------------------------------------------------------------+
//|                     >>>>>>>>>>>> IN <<<<<<<<<<<<                 |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|            IN  SELLLIMIT                                         |
//+------------------------------------------------------------------+
bool isPriceInScopeSELLLIMIT(double price){
 bool _bool = false;
 for(int i=0;i<NUMBER_OF_KNEES;i++){
  string const NameOrder      = Order.arrSELLLIMIT[i];
     int const countPend      = GetCountPendByComment(NameOrder)  ;
     int const countPosition  = GetCountPositionByComment(NameOrder);
     int const count          = countPend + countPosition;
  double const nextPrice      = jSELLLIMIT[NameOrder][NAME_PRICE_OPEN].ToDbl() ;
  double const BID            =  SymbolInfoDouble(NULL,SYMBOL_BID);
    //+------------------------------------------------------------------+         
     if(count == 0)
        if( nextPrice < price ) 
           if( nextPrice > BID )  {
                   return true;
      }
  }
  //+------------------------------------------------------------------+
 return _bool; 
}
//+------------------------------------------------------------------+
//|                BUYLIMIT                                                  |
//+------------------------------------------------------------------+
bool isPriceInScopeBUYLIMIT(double price){
 bool _bool = false;
 for(int i=0;i<NUMBER_OF_KNEES;i++){
  string const NameOrder      = Order.arrBUYLIMIT[i];
     int const countPend      = GetCountPendByComment(NameOrder)  ;
     int const countPosition  = GetCountPositionByComment(NameOrder);
     int const count          = countPend + countPosition;
  double const nextPrice      = jBUYLIMIT[NameOrder][NAME_PRICE_OPEN].ToDbl() ;
  double const ASK            =  SymbolInfoDouble(NULL,SYMBOL_ASK);  
    //+------------------------------------------------------------------+
     if(count == 0)
        if( nextPrice > price ) 
           if( nextPrice < ASK )  {
                   return true;
      } 
    }
    //+------------------------------------------------------------------+
 return _bool; 
}
//+------------------------------------------------------------------+
//|                  SELLSTOP                                                |
//+------------------------------------------------------------------+
bool isPriceInScopeSELLSTOP(double price){
 bool _bool = false;

for(int i=1;i<NUMBER_OF_KNEES;i++){
  
int const kstart = arrStartStop[i][0];
int const kstop  = arrStartStop[i][1];

   for(int k=kstart;k<kstop;k++){ 
     string const MainNameOrder  = Order.arrBUYLIMIT[i];
     string const SubNameOrder   = Order.arrSELLSTOP[k];
     string const fullName       = MainNameOrder + "#" + SubNameOrder;
        int const countPend      = GetCountPendByComment(fullName)  ;
        int const countPosition  = GetCountPositionByComment(fullName);
        int const count          = countPend + countPosition; 
     double const nextPrice      = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_PRICE_OPEN].ToDbl() ;
     double const BID            =  SymbolInfoDouble(NULL,SYMBOL_BID);
    //+------------------------------------------------------------------+
      if(count == 0)
        if( nextPrice > price ) 
           if( nextPrice < BID )  {
                return true;                
         } 
       }
    //+------------------------------------------------------------------+      
   }
 return _bool; 
}
//+------------------------------------------------------------------+
//|               BUYSTOP                                            |
//+------------------------------------------------------------------+
bool isPriceInScopeBUYSTOP(double price){
 bool _bool = false;
   
  for(int i=1;i<NUMBER_OF_KNEES;i++){
  
int const kstart = arrStartStop[i][0];
int const kstop  = arrStartStop[i][1];

   for(int k=kstart;k<kstop;k++){ 
     string const MainNameOrder  = Order.arrSELLLIMIT[i];
     string const SubNameOrder   = Order.arrBUYSTOP[k];
     string const fullName       = MainNameOrder + "#" + SubNameOrder;
        int const countPend      = GetCountPendByComment(fullName)  ;
        int const countPosition  = GetCountPositionByComment(fullName);
        int const count          = countPend + countPosition; 
     double const nextPrice      = jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_PRICE_OPEN].ToDbl() ; 
     double const ASK            =  SymbolInfoDouble(NULL,SYMBOL_ASK);   
      //+------------------------------------------------------------------+
      if(count == 0)
        if( nextPrice < price ) 
           if( nextPrice > ASK )  {        
                return true;
         } 
       }
      //+------------------------------------------------------------------+      
   }
 return _bool; 
}

