#include  "..\setting\FilePathMain.mqh" 
void TraderGrafic(int      number,  CTrade   &trade[]  )
{
//+------------------------------------------------------------------+
//|         >>>>>>>>>>>>>>> MODIFICATION <<<<<<<<<<<<<<<<<<<<<<<
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|         ПЕРЕМЕЩЕНИЕ PRICE/SL/TP ОТЛОЖНИКОВ  | Массовая обработка                               
//+------------------------------------------------------------------+ 
//MovePend(symbol);
//+------------------------------------------------------------------+
//|        Тралл открытых ордеров   | Массовая обработка                               
//+------------------------------------------------------------------+
//TrailingPositions(number);  
//====================================================================    
//+------------------------------------------------------------------+
//|         >>>>>>>>>>>>>>> CLOSE <<<<<<<<<<<<<<<<<<<<<<<
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                         BUY                               
//+------------------------------------------------------------------+
if(SignalCloseBuy[number]){ 

}
//+------------------------------------------------------------------+
//|                         SELL                                  
//+------------------------------------------------------------------+
if(SignalCloseSell[number]){

}
//+------------------------------------------------------------------+
//|                     BUYSTOP                                 
//+------------------------------------------------------------------+
if(SignalCloseBuyStop[number]){ 

}
//+------------------------------------------------------------------+
//|                     SELLSTOP                                 
//+------------------------------------------------------------------+
if(SignalCloseSellStop[number]){ 

}
//+------------------------------------------------------------------+
//|                     BUYLIMIT                                 
//+------------------------------------------------------------------+
if(SignalCloseBuyLimit[number]){ 

}
//+------------------------------------------------------------------+
//|                     SELLLIMIT                                 
//+------------------------------------------------------------------+
if(SignalCloseSellLimit[number]){ 
 
 
 }
//+------------------------------------------------------------------+
//|           >>>>>>>>>>>>>>> OPEN <<<<<<<<<<<<<<<<<<<<<<<
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                         BUY                               
//+------------------------------------------------------------------+
if(SignalOpenBuy[number]){ 
             /*
             setTextSignal(number, 
                           "BUY_" + (string)(GetLastTiket(arrSymbol[number],POSITION_TYPE_BUY,Magic) ) , 
                           GetLastPrice(arrSymbol[number],POSITION_TYPE_BUY,Magic) , 
                           _countTXT_BUY, 
                           clrDodgerBlue 
                          ) ;
            */
}
//+------------------------------------------------------------------+
//|                         SELL                                  
//+------------------------------------------------------------------+
if(SignalOpenSell[number]){
/*
             setTextSignal(number,
                           "SELL_"+ (string)(GetLastTiket(arrSymbol[number],POSITION_TYPE_SELL,Magic) ) , 
                           GetLastPrice(arrSymbol[number],POSITION_TYPE_SELL,Magic) , 
                           _countTXT_SELL, 
                           clrFuchsia 
                           ) ;
                           */
                           
}
//+------------------------------------------------------------------+
//|                     BUYSTOP                                 
//+------------------------------------------------------------------+
if(SignalOpenBuyStop[number]){ 

  // setTextSignal(number,"BUYSTOP", GetPriceBUYSTOP(arrSymbol[number],StepBUYSTOP) , _countTXT_BUYSTOP, clrRoyalBlue ) ;
      
}
//+------------------------------------------------------------------+
//|                     SELLSTOP                                 
//+------------------------------------------------------------------+
if(SignalOpenSellStop[number]){ 

  //  setTextSignal(number,"SELLSTOP", GetPriceSELLSTOP(arrSymbol[number],StepSELLSTOP) , _countTXT_SELLSTOP , clrViolet ) ;
      
}
//+------------------------------------------------------------------+
//|                     BUYLIMIT                                 
//+------------------------------------------------------------------+
//if(SignalOpenBuyLimit[number]){ 

   //    setTextSignal(number,"BUYLIMIT", GetPriceBUYLIMIT(arrSymbol[number],StepBUYLIMIT) , _countTXT_BUYLIMIT, clrCyan ) ;
//}

//if(SignalOpenBuyLimitProfit[number]){ 
//  setTextNAME(arrSymbol[number],"LimitProfit"," BUY: " + DoubleToString(VOLUME_CLOSE_PROFIT_BUYLIMIT[number],2 )+"  " , 50, clrYellow );
//  }
//
//if(SignalOpenBuyLimitSafe[number]){ 
//  setTextNAME(arrSymbol[number],"LimitProfit"," BUY SF: " + DoubleToString(VOLUME_CLOSE_SAFE_BUYLIMIT[number],2 )+"  " , 50, clrAqua );
//  }


//+------------------------------------------------------------------+
//|                     SELLLIMIT                                 
//+------------------------------------------------------------------+
//if(SignalOpenSellLimit[number]){ 
    
   //   setTextSignal(number,"SELLLIMIT", GetPriceSELLLIMIT(arrSymbol[number],StepSELLLIMIT) , _countTXT_SELLLIMIT , clrPink ) ;

//}

//if(SignalOpenSellLimitProfit[number]){ 
//
//  //setTextSignal(number,"BUYLIMIT", GetPriceBUYLIMIT(arrSymbol[number],StepBUYLIMIT) , _countTXT_BUYLIMIT, clrCyan ) ;
//  setTextNAME(arrSymbol[number],"LimitProfit"," SELL: " + DoubleToString(VOLUME_CLOSE_PROFIT_SELLLIMIT[number],2 ) +"  ", 50, clrYellow );
//  
//}
//
//if(SignalOpenSellLimitSafe[number]){ 
//
//  //setTextSignal(number,"BUYLIMIT", GetPriceBUYLIMIT(arrSymbol[number],StepBUYLIMIT) , _countTXT_BUYLIMIT, clrCyan ) ;
//  setTextNAME(arrSymbol[number],"LimitProfit"," SELL SF: " + DoubleToString(VOLUME_CLOSE_SAFE_SELLLIMIT[number],2 ) +"  ", 50, clrAqua );
//  
//}




// Если надо показать прибыль Селла или Бая
//if(true)
    //setTextProfit( number ) ;

 
  SetTextLabel();
  
  SetHLine_Scope();
//if(HLINE_ON)
   //SetHLINE();

}