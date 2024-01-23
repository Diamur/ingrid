#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ClosePositionByTicket(  int number,
                             int ticket,
                        CTrade &trade[],
                        string symbol){
   for(int i = 0; i < PositionsTotal(); i++){     
     if(PositionGetSymbol(i) == symbol )
       if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TICKET) ==  ticket  )  
              if(!trade[number].PositionClose( PositionGetInteger(POSITION_TICKET) ) ){
                 Print(__FUNCTION__," error  = ", GetLastError());
            } else return true;
     };
     return false;         
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ClosePositionByType(  int number,
                        CTrade &trade[],
                        ENUM_POSITION_TYPE type,
                        string symbol){
   for(int i = 0; i < PositionsTotal(); i++){     
     if(PositionGetSymbol(i) == symbol )
       if( PositionGetInteger(POSITION_MAGIC) == Magic)
         if( PositionGetInteger(POSITION_TYPE) ==  type  )  
              if(!trade[number].PositionClose( PositionGetInteger(POSITION_TICKET) ) ){
                 Print(__FUNCTION__," error " + (string)type + " = ", GetLastError());
            } else return true;
     };
     return false;         
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool CloseAllPosition( int         number,
                    CTrade         &trade[],
                    string        symbol ){
  bool _close = false;                      
    for(int i = 0; i < PositionsTotal()  ; i++) {     
     if(PositionGetSymbol(i) == symbol )
       if( PositionGetInteger(POSITION_MAGIC) == Magic)               
          if(!trade[number].PositionClose( PositionGetInteger(POSITION_TICKET) ) ){
                 Print(__FUNCTION__," CloseAllPosition error "  + " = ", GetLastError());
           } else _close =  true;
     };     
    return _close;         
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool ClosePositionByPREFIX(    int number,
                            string prefix,
                            CTrade &trade[],
                            string symbol){
  bool _close = false;                      
    for(int i = 0; i < PositionsTotal()  ; i++) {     
     if(PositionGetSymbol(i) == symbol )
       if( PositionGetInteger(POSITION_MAGIC) == Magic)  {
          int const pos = StringFind( PositionGetString(POSITION_COMMENT),prefix);
          if(pos != -1 ){
               if(!trade[number].PositionClose( PositionGetInteger(POSITION_TICKET) ) ){
                 Print(__FUNCTION__," CloseAllPosition error "  + " = ", GetLastError());
              } else _close =  true;
           }
         }
     };     
    return _close;         
}  
  
bool ClosePositionByPREFIX_FULL(    int number,
                            string prefix,
                            CTrade &trade[],
                            string symbol){
  bool _close = false;                      
    for(int i = 0; i < PositionsTotal()  ; i++) {     
     if(PositionGetSymbol(i) == symbol )
       if( PositionGetInteger(POSITION_MAGIC) == Magic)  {
         if( PositionGetString(POSITION_COMMENT) == prefix)
               if(!trade[number].PositionClose( PositionGetInteger(POSITION_TICKET) ) ){
                 Print(__FUNCTION__," CloseAllPosition error "  + " = ", GetLastError());
              } else _close =  true;
           
         }
     };     
    return _close;         
}  
 