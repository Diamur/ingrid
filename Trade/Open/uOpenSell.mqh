#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool uOpenSell( string symbol, double lots , double price_sl = 0 , double price_tp = 0 ){      
    MqlTradeRequest request;
    MqlTradeResult result;
    
    ZeroMemory(request);
    ZeroMemory(result);
    
    if (!PositionSelect(symbol))
    {
        request.type      = ORDER_TYPE_SELL;
        request.price     = SymbolInfoDouble(symbol, SYMBOL_BID);
        request.action    = TRADE_ACTION_DEAL;
        request.symbol    = symbol;
        request.volume    = lots;
        request.sl        = price_sl;
        request.tp        = price_tp;
        request.deviation = Slippage;
        request.type_filling = ORDER_FILLING_FOK;
    }
    if (!OrderSend(request, result))
    {
        Print("error uOpenBuy : " + IntegerToString(result.retcode));
        return(false);
    }    
    return(true);
  }
  

  
