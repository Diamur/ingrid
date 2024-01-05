#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool Check_money(const string symbol, double volume, ENUM_ORDER_TYPE type=ORDER_TYPE_BUY  )  {    
   return ( GetReMoneyAfterPay ( symbol, volume , type) >= 0 ? true : false );
   }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetReMoneyAfterPay(const string symbol, double volume , ENUM_ORDER_TYPE type=ORDER_TYPE_BUY){
 return   AccountInfoDouble(ACCOUNT_BALANCE) - GetCalcMargin( symbol, volume , type) ;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetCalcMargin(const string symbol, double volume , ENUM_ORDER_TYPE type=ORDER_TYPE_BUY ){ 
   double margin =0;
   MqlTick last_tick;
   if(SymbolInfoTick(Symbol(),last_tick)){
      ResetLastError();      
      double price = (type == ORDER_TYPE_BUY || type == ORDER_TYPE_BUY_LIMIT || type == ORDER_TYPE_BUY_STOP || type == ORDER_TYPE_BUY_STOP_LIMIT) ? last_tick.ask : last_tick.bid;
      bool  check  = OrderCalcMargin(ORDER_TYPE_BUY, symbol, volume, price , margin);
      if(check) {
         //Print("Для операции BUY ", symbol, volume , " price =  " , price , " margin = ",  margin , " ACCOUNT_CURRENCY ",  AccountInfoString(ACCOUNT_CURRENCY));
         return margin ;
        }
      }
       //  Print("Неудачное выполнение функции SymbolInfoTick(), ошибка ",GetLastError());
    return 10000000;      
}

