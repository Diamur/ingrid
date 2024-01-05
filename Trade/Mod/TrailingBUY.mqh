#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TrailingBUY(    string   symbol,
                     int      trailingstop , 
                     int      stoploss ,
                     bool     autoTrall, 
                     int      trallStep,
                     double   minPriceBUY,
                     bool     shiftStopLoss, 
                     //string   comment,
                     int magic
                      ){
  int _positionsTotal = PositionsTotal();                                  
  if (_positionsTotal == 0)  return; 
  if ( shiftStopLoss == false && trailingstop == 0  ) return;
     
   MqlTradeRequest   _request;     
   MqlTradeResult    _result;
    
  double _uPoint  = SymbolInfoDouble(symbol,SYMBOL_POINT) ; 
  double _uBID    = SymbolInfoDouble(symbol,SYMBOL_BID);
  int    _uSpread = (int)SymbolInfoInteger(symbol,SYMBOL_SPREAD) ;
  
  for(int i=0; i <  _PositionsTotal; i++ ){ 
        int _TICKET = (int)PositionGetTicket(i) ;
      if(  _TICKET > 0 ){ 
        double _SL         = PositionGetDouble(POSITION_SL);
        double _PRICE_OPEN = PositionGetDouble(POSITION_PRICE_OPEN);
        double _VOLUME     = PositionGetDouble(POSITION_VOLUME);
           int _TYPE       = (int)PositionGetInteger(POSITION_TYPE);
        string _COMMENT    = PositionGetString(POSITION_COMMENT);
        
       if(  _TYPE == (int)POSITION_TYPE_BUY  && PositionGetString(POSITION_SYMBOL) == symbol )
          //if( _COMMENT == comment ){             
           //+------------------------------------------------------------------+
           // Если Стоплосс НИЖЕ Цены
            if(   _SL < _PRICE_OPEN ){
              //+------------------------------------------------------------------+
                 if( shiftStopLoss &&  stoploss > _uSpread ) { 
               //+------------------------------------------------------------------+
                  if(_uBID > _SL + stoploss * _uPoint   ) {                     
                     ///////////////////////////////////////////////////////////////////////////////////////                     
                      ZeroMemory(_request); 
                      ZeroMemory(_result);                       
                     _request.action  = TRADE_ACTION_SLTP;
                     _request.position= PositionGetInteger(POSITION_TICKET);
                     _request.symbol  = symbol;
                     _request.magic   = magic;
                     _request.sl      = NormalizeDouble(_uBID - stoploss * _uPoint , (int)SymbolInfoInteger(symbol,SYMBOL_DIGITS ) );
                     _request.tp      = PositionGetDouble(POSITION_TP);                     
                   if( _request.sl  != _SL)   
                   if( !OrderSend(_request,_result) )
                         Print(__FUNCTION__, " ------ shiftStopLoss   EROOR > ", GetLastError() )  ;
                  }
                     ///////////////////////////////////////////////////////////////////////////////////////                      
               } 
             }                        
            // Если Стоплосс ВЫШЕ Цены
           if( trailingstop != 0 ){
                  // Если у КАЖДОГО свой ТРАЛ
                  if( autoTrall ) trailingstop  =  trailingstop + (int)( (  _PRICE_OPEN - minPriceBUY )/ _uPoint); 
                  //  ТРАЛЛ | плюс ТРАЛСТЕП 
                  if( _uBID -  _PRICE_OPEN  > ( trailingstop  + trallStep  ) * _uPoint ){ 
                     // перемещаем стоплосс
                     if( _SL < (_uBID   - trailingstop  *  _uPoint )   ){                  
                     ///////////////////////////////////////////////////////////////////////////////////////
                      ZeroMemory(_request); 
                      ZeroMemory(_result);  
                     _request.action   = TRADE_ACTION_SLTP;
                     _request.position = _TICKET;
                     _request.symbol   = symbol;
                     _request.magic    = magic;
                     _request.sl       = NormalizeDouble( _uBID - trailingstop * _uPoint , (int)SymbolInfoInteger( symbol, SYMBOL_DIGITS ) ) ;
                     _request.tp       = PositionGetDouble(POSITION_TP);
                     if( _request.sl  != _SL)   
                     if( !OrderSend(_request,_result) )
                       Print( __FUNCTION__, "  trailingstop EROOR  > ", GetLastError())  ;                      
                     /////////////////////////////////////////////////////////////////////////////////////// 
                  }
               } 
             }
           //}   
         }
       }
    }