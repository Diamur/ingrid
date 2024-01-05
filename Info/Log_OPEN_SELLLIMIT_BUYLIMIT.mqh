#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Log_OPEN_SELLLIMIT_BUYLIMIT(int number){
   // _addInfo((string) (  ) , " < "  );
   // _addInfo(  " > " , (string) (  )  );
   // _addInfo(  " > " , DoubleToString( , )  );
   if(TRADE_UP){
   _addInfoLine();  
      _addInfo("ScopeLevel->ASK UP > " , DoubleToString(PRICE_ScopeLevel_UP_ASK ,DIGIT )  );
      _addInfo("ScopeLevel->BID DN > " , DoubleToString(PRICE_ScopeLevel_UP_BID ,DIGIT )  );  
  _addInfoLine(); 
    _addInfo("Price-BID MAX UP  > " , DoubleToString( PriceMAX_UP ,DIGIT )  + " | " + (string)(getDTPriceMAX_UP(SymbolInfoDouble(NULL,SYMBOL_BID)) )  );
    _addInfo("Price-BID MIN UP  > " , DoubleToString(PriceMIN_UP ,DIGIT )  + " | " + (string)(getDTPriceMIN_UP(SymbolInfoDouble(NULL,SYMBOL_BID)) ) );
 
   }  

   if(TRADE_DN){

   
 _addInfoLine(); 
   _addInfo("ASK-Price MAX_DN  > " , DoubleToString( PriceMAX_DN ,DIGIT )  + " | " + (string)(getDTPriceMAX_DN(SymbolInfoDouble(NULL,SYMBOL_ASK)) )  );
   _addInfo("BID-Price MAX_DN  > " , DoubleToString( PriceMAX_DN ,DIGIT )  + " | " + (string)(getDTPriceMAX_DN(SymbolInfoDouble(NULL,SYMBOL_BID)) )  );
 _addInfoLine();
   _addInfo("ASK-Price MIN_DN  > " , DoubleToString(PriceMIN_DN ,DIGIT )  + " | " + (string)(getDTPriceMIN_DN(SymbolInfoDouble(NULL,SYMBOL_ASK)) ) );
   _addInfo("BID-Price MIN_DN  > " , DoubleToString(PriceMIN_DN ,DIGIT )  + " | " + (string)(getDTPriceMIN_DN(SymbolInfoDouble(NULL,SYMBOL_BID)) ) );


_addInfoLine();  
   _addInfo("ASK->ScopeLevel DN > " , DoubleToString(PRICE_ScopeLevel_DN_ASK ,DIGIT )  );
   _addInfo("BID->ScopeLevel_DN > " , DoubleToString(PRICE_ScopeLevel_DN_BID ,DIGIT )  );

_addInfoLine(); 

 _addInfo((string) ( !MAIN_ON ) , " < STATUS_MAIN_ON "  );
_addInfo((string) (  BarReMOVE != iTime(NULL,PERIOD_CURRENT,0) ) , " < STATUS_NEWBAR "  );
_addInfo((string) ( getDTPriceMAX_DN(SymbolInfoDouble(NULL,SYMBOL_BID)) > StartStep+StepPEND+SymbolInfoInteger(NULL,SYMBOL_SPREAD) ) , " < STATUS_DT_START_STEP"  );

_addInfoLine(); 

    _addInfo("BarReMOVE > " , (string)BarReMOVE   );
    _addInfo("iTime(NULL,PERIOD_CURRENT,0) > " , (string)iTime(NULL,PERIOD_CURRENT,0)   );
    _addInfo("getDTPriceMAX_DN > " , (string)getDTPriceMAX_DN(SymbolInfoDouble(NULL,SYMBOL_BID))  );
    _addInfo("Step > " , (string)( StartStep+StepPEND+SymbolInfoInteger(NULL,SYMBOL_SPREAD) )  );
 
  _addInfoLine(); 
       _addInfo("isPriceOutScopeLevelPend_DN(PRICE_ScopeLevel_DN_BID) > " , (string)isPriceOutScopeLevelPend_DN(PRICE_ScopeLevel_DN_BID)   ); 
  
    
    
    


   }

/*
if(Status.CloseSELLSTOP[number][STATUS_MAIN_ON]       =  !MAIN_ON ? true: false )
if(Status.CloseSELLSTOP[number][STATUS_NEWBAR]        =  BarReMOVE != iTime(NULL,PERIOD_CURRENT,0) ? true: false )
if(Status.CloseSELLSTOP[number][STATUS_DT_START_STEP] =  getDTPriceMAX_DN(SymbolInfoDouble(NULL,SYMBOL_BID)) > StartStep  ? true: false )
*/
   
    //_addInfo((string) ( SignalOpenSellLimit[number] ), " < OPEN SELLLIMIT"  );
//    _addInfo((string) ( SignalOpenBuyLimit[number] ) , " < OPEN BUYLIMIT"  );                   
//   
//   _addInfoLine();  
//   
//   _addInfo((string) ( Status.OpenBUYLIMIT[number][0][STATUS_WORK]  ) , " < STATUS_WORK"  );
//   _addInfo((string) ( GetCountPendByComment(COMMENT_BUYLIMIT_A0) ) , " < STATUS_COUNT_BL0"  );
//   _addInfo((string) ( GetCountPositionByType(POSITION_TYPE_BUY) ) , " < STATUS_COUNT_BUY"  );
   //_addInfo((string) (  ) , " < "  );
   
/*
if(Status.OpenBUYLIMIT[number][0][STATUS_WORK]  = WorkingHour() ? true: false )
if(Status.OpenBUYLIMIT[number][0][STATUS_COUNT] = GetCountPendByComment(COMMENT_BUYLIMIT_A0) == 0  ? true: false)              
if(Status.OpenBUYLIMIT[number][0][STATUS_COUNT] = GetCountPositionByType(POSITION_TYPE_BUY) == 0  ? true: false)        
_addInfo((string) (  ) , " < "  );
*/
   //_addInfoLine();  
//   _addInfo((" BUY_LIMIT  > ") , (string) GetCountPendByType(ORDER_TYPE_BUY_LIMIT) );
//   _addInfo((" SELL_LIMIT  > ") , (string) GetCountPendByType(ORDER_TYPE_SELL_LIMIT)  ) ;
//   
//   _addInfo((" BUY_MULT  > "), (string) getMULT(POSITION_TYPE_BUY)   );
//   _addInfo((" SELL_MULT  > "), (string)getMULT(POSITION_TYPE_SELL) );

  //_addInfoLine(); 
   
//   _addInfo((" GetPipsProfit  > "), (string)( GetPipsProfit() ) );
//   _addInfo((" GetPipsProfitSELL  > "), (string)( GetPipsProfitSELL() ) );
//   _addInfo((" GetPipsProfitBUY  > "), (string)( GetPipsProfitBUY() ) );
//   _addInfoLine();   
//   _addInfo((" GetVolume  > "), (string)( GetVolume() ) );
//   _addInfo((" GetVolumeSELL  > "), (string)( GetVolumeSELL() ) );
//   _addInfo((" GetVolumeBUY  > "), (string)( GetVolumeBUY() ) );
//   _addInfoLine();   
//   _addInfo((" GetProfit  > "), (string)( GetProfit() ) );
//   _addInfo((" GetProfitSELL  > "), (string)( GetProfitSELL() ) );
//   _addInfo((" GetProfitBUY  > "), (string)( GetProfitBUY() ) );
//   _addInfoLine(); 
//   
   //_addInfo((" GetStep SL  > "), (string)( GetStep(ORDER_TYPE_SELL_LIMIT) ) ); 
  //_addInfo((" GetStep BL  > "), (string)( GetStep(ORDER_TYPE_BUY_LIMIT) ) ); 

// _addInfo((" NextMultBUYLIMIT  > "), (string)( NextMultBUYLIMIT ) ); 
// _addInfo((" NextMultSELLLIMIT  > "), (string)( NextMultSELLLIMIT ) ); 
// 
//  _addInfoLine(); 
//  _addInfo(("BUY > ") , (string)( GetCountPositionByType(POSITION_TYPE_BUY) )); 
//  _addInfo(("SELL > "), (string)( GetCountPositionByType(POSITION_TYPE_SELL))); 
//  
//  




  
  /*
  GetPipsProfit;
GetPipsProfitSELL;
GetPipsProfitBUY;
GetVolume;
GetVolumeSELL;
GetVolumeBUY;
GetProfit;
GetProfitSELL;
GetProfitBUY;
GetStep;

  
  */        
}
  
 