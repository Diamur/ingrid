#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetLotBYMoneyRisk( string symbol, double money, double risk  ){   
     
   string depo_symbol1 ="";
   string depo_symbol2 ="";
   
   double sum_money_risk = 0;
   
   double minlot           = SymbolInfoDouble(symbol,SYMBOL_VOLUME_MIN);
   double maxlot           = SymbolInfoDouble(symbol,SYMBOL_VOLUME_MAX);
   double steplot          = SymbolInfoDouble(symbol,SYMBOL_VOLUME_STEP); 
   
   double lot = minlot ;
   
   //Свободные средства
   double _ACCOUNT_MARGIN_FREE =  AccountInfoDouble(ACCOUNT_MARGIN_FREE);
   if(money > _ACCOUNT_MARGIN_FREE) money = _ACCOUNT_MARGIN_FREE;
   
   // Кол-во денег с риском
   double money_risk = money * risk /100 ;
   
   //Кредитное плечо
   long _ACCOUNT_LEVERAGE = AccountInfoInteger(ACCOUNT_LEVERAGE);
   
   //Объем 1 лот 100 000 c учетом кредитого плеча
   double lot_1 = (double)( 100000 / _ACCOUNT_LEVERAGE);  
   
   // Цена пары
   double price = iClose(symbol,PERIOD_CURRENT,0); 
     
   //Сумма 1 лота
   double summa_1_lot = lot_1 * price;  
  
   //Валюта депозита
   string valuta_depo   = AccountInfoString(ACCOUNT_CURRENCY);
  
   // Берем валюты по отдельности
   string symbol1 = StringSubstr(symbol,0,3);
   string symbol2 = StringSubstr(symbol,3,3);
      
   // Цена депо со 2 символом пары
   double price_depo_symbol1 = 0;   
   
   // Цена депо со 1 символом пары
   double price_depo_symbol2 = 0;   
      
   //Перебор всех доступных валют
   
   // Когда депо == символ 1
   if( valuta_depo == symbol1  )  { 
        sum_money_risk = money_risk;
        price_depo_symbol1 = 1;
   }
   // Когда депо == символ 2
   
   if( valuta_depo == symbol2  )  { 
       sum_money_risk = money_risk * price ;
       price_depo_symbol1 = price;
   }  
   
  if( valuta_depo != symbol2 && valuta_depo != symbol1  )  { 
   for (int i =0 ; i< SymbolsTotal(false) ;i++ ){     
      int pos_valuta_depo  = StringFind( SymbolName(i,false) , valuta_depo ) ;
      int pos_symbol1      = StringFind( SymbolName(i,false) , symbol1 ) ;
      int pos_symbol2      = StringFind( SymbolName(i,false) , symbol2 ) ;      
      if( pos_valuta_depo != -1 && pos_symbol1 != -1 ) {
       depo_symbol1 =  SymbolName(i,false);
       price_depo_symbol1 = iClose(depo_symbol1,PERIOD_CURRENT,0);
       // Если Депо базовая валюта в позиции = 1
       if(pos_valuta_depo < 3){
         //Cумма денежных рисков в валюте второго символ
         sum_money_risk = money_risk * price_depo_symbol1 ;       
       }
       // Если Депо НЕ базовая валюта в позиции = 2
       if(pos_valuta_depo > 1 )  {
          //Cумма денежных рисков в валюте второго символ
        if( price_depo_symbol1 != 0)  
         sum_money_risk = money_risk / price_depo_symbol1 ;
       }       
      }     
    }  
   }
   
   lot = sum_money_risk / summa_1_lot ;
   
   if(lot < minlot)  lot = minlot;
   if(lot > maxlot)  lot = maxlot; 
   if(lot > minlot && lot < maxlot )  {
   int k = (int)( (lot - minlot)/steplot );
   lot = NormalizeDouble(minlot + k * steplot ,2); 
   }
   
   return lot;
   }