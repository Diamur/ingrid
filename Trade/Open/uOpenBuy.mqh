#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool uOpenBuy( string symbol, double lots , double price_sl = 0 , double price_tp = 0, string comments = "" ){      
    
    
    
    
     // создаем экземпляры 
    
    MqlTradeRequest request;
    MqlTradeResult result;
    
    //обнуляем экземпляры сохраняя структуру
    
    ZeroMemory(request);
    ZeroMemory(result);
    /*
    // заполняем структуру request
   
    request.action         = TRADE_ACTION_DEAL;       //действие соответствующее немедленной сделке
    request.type           = ORDER_TYPE_BUY;            //тип сделки
    request.symbol         = symbol;                  // имя торгового инструмента
    request.volume         = lots;                     //Объем позиции    
    request.type_filling   = ORDER_FILLING_FOK;    //что делать в случае нехватики объема по указанной цене   
    request.price          = SymbolInfoDouble(request.symbol,SYMBOL_ASK);              //цена 
    request.sl             = NormalizeDouble( price_sl, (int)SymbolInfoInteger(symbol,SYMBOL_DIGITS) ) ;
    request.tp             = NormalizeDouble( price_tp, (int)SymbolInfoInteger(symbol,SYMBOL_DIGITS) );
    request.deviation      = Slippage;                    //проскальзывание
    request.magic          = Magic;                            //идентификатор торгового робота    
    
    for(int i = 0;i < 10;i++){                      //отправка запроса на сервер, говорят лучше делать несколько раз =)
        if(!OrderSend(request,result)){
            Print("Позиция Селл не открыта. Ошибка №",result.retcode); //в случаее отказа в журнал выведется сообщение с кодом ошибки
            //можно заморочистья и расписать каждый код по его значению)
            Sleep(500);     //ждем полсекунды и репит
        }else{
            ulong deal_ticket = result.deal;    //уникальный идентификатор сделки
            if(deal_ticket == 0) break;         //если был выставлен отложенный ордер то прерываем цикл
            
            if(deal_ticket > 0){                // знак "больше" потому что result.deal возвращает ulong
                                                //похоже на лишнюю проверку?
             if(HistoryDealSelect(deal_ticket)){  //если сделка состоялась(а как иначе сюда попасть?)
                 long pos_ticket = HistoryDealGetInteger(deal_ticket,DEAL_POSITION_ID);   //вытаскиваем id позиции
                 return true;
                 //return pos_ticket;   //возвращаем во внешнюю функцию id позиции
             }
            }
        }
    }
    return false;  //иначе возвращаем -1, что в дальнейшем нам подскажем что нихуя мы не сделали
    */
    
    
    //+------------------------------------------------------------------+
    //|                                                                  |
    //+------------------------------------------------------------------+
    
    
//    MqlTradeRequest request;
//    MqlTradeResult result;
//    
//    ZeroMemory(request);
//    ZeroMemory(result);
   

   request.type         = ORDER_TYPE_BUY;
   request.price        = SymbolInfoDouble(symbol, SYMBOL_ASK);
   request.action       = TRADE_ACTION_DEAL;
   request.symbol       = symbol;
   request.volume       = lots;
   request.sl           = NormalizeDouble( price_sl, (int)SymbolInfoInteger(symbol,SYMBOL_DIGITS) ) ;
   request.tp           = NormalizeDouble( price_tp, (int)SymbolInfoInteger(symbol,SYMBOL_DIGITS) );
   request.deviation    = Slippage;
   request.type_filling = ORDER_FILLING_FOK;
   request.magic        = Magic;                            
   request.comment      = comments;  
     
    if (!OrderSend(request, result))
    {
        Print("error uOpenBuy : " + IntegerToString(result.retcode));
        return(false);
    }    
    return(true);
    
  }
  

  
