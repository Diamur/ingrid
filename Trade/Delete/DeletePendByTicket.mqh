#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool DeletePendByTicket( int  number,
                       CTrade &trade[],
                       string symbol,
                       int    ticket,
                       int    magic                       
                       ){
 for(int i=0;i<=OrdersTotal();i++)
      {
       if((OrderGetTicket(i))>0) 
        if( OrderGetString(ORDER_SYMBOL) == symbol)
         if( OrderGetInteger(ORDER_TICKET) == ticket)
          if( OrderGetInteger(ORDER_MAGIC) == magic)
          //if(  OrderGetString(ORDER_COMMENT) == comment )
           if( ! trade[number].OrderDelete( OrderGetTicket(i) ) ){           
               Print(__FUNCTION__," error ticket" + (string)(ticket) + " = ", GetLastError());
           } else return true;           
      }       
   return false;           
  }
  

  
