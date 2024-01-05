#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool DeletePendByType( int             number,
                       CTrade          &trade[],
                       string          symbol,
                       ENUM_ORDER_TYPE type                                      
                       ){
 for(int i=0;i<=OrdersTotal();i++)
      {
       if( ( OrderGetTicket(i) ) > 0 ) 
        if( OrderGetString(ORDER_SYMBOL) == symbol)
         if( OrderGetInteger(ORDER_TYPE)  == type)
          if( OrderGetInteger(ORDER_MAGIC)  == Magic)
           if( ! trade[number].OrderDelete( OrderGetTicket(i) ) ){           
              Print(__FUNCTION__," error DeletePendByType = ", GetLastError());
           } else return true;           
      }       
   return false;           
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool DeletePendByComment( int             number,
                       CTrade          &trade[],
                       string          symbol,                                     
                       string          comment ){
 for(int i=0;i<=OrdersTotal();i++)
      {
       if((OrderGetTicket(i))>0) 
        if( OrderGetString(ORDER_SYMBOL) == symbol)
          if( OrderGetInteger(ORDER_MAGIC) == Magic)
          if(  OrderGetString(ORDER_COMMENT) == comment )
           if( ! trade[number].OrderDelete( OrderGetTicket(i) ) ){           
               Print(__FUNCTION__," error DeletePendByComment = ", GetLastError());
           } else return true;           
      }       
   return false;           
  }
 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool DeleteAllPend    ( int             number,
                       CTrade          &trade[],
                       string          symbol){
 bool _del = false;
   for(int i=0;i<=OrdersTotal();i++){
       if((OrderGetTicket(i))>0) 
          if( OrderGetInteger(ORDER_MAGIC) == Magic)
            if( ! trade[number].OrderDelete( OrderGetTicket(i) ) ){           
               Print(__FUNCTION__," error DeleteAllPend " +  " = ", GetLastError());
           } else _del = true;           
   }       
 return _del;           
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool DeletePendByPREFIX (    int number,
                          string prefix,
                          CTrade &trade[],
                          string symbol){
 bool _del = false;
   for(int i=0;i<=OrdersTotal();i++){
       if((OrderGetTicket(i))>0) 
          if( OrderGetInteger(ORDER_MAGIC) == Magic){
            int const pos = StringFind( OrderGetString(ORDER_COMMENT),prefix);
            if(pos==0){
                 if( ! trade[number].OrderDelete( OrderGetTicket(i) ) ){           
                   Print(__FUNCTION__," error DeletePendByPREFIX " +  " = ", GetLastError());
                 } else _del = true; 
            }
          }          
   }       
 return _del;           
}
  

  
