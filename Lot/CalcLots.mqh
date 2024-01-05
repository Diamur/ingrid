#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double CalcLots( string symbol , double nextlot ){
  
  double new_lots  = NormalizeDouble(nextlot,2);
  double step_lots = SymbolInfoDouble(symbol,SYMBOL_VOLUME_STEP) ;
  
  if(AutoLot){ 
      new_lots = GetLotBYMoneyRisk( _Symbol, AccountInfoDouble(ACCOUNT_EQUITY) , RiskMoney  );
      Print(__FUNCTION__, " Get_Lot_BY_Money_Risk = ", new_lots);
   };
   
  if(step_lots >0)
       new_lots = step_lots * MathFloor( new_lots/step_lots);
  
  double min_lots =  SymbolInfoDouble(symbol,SYMBOL_VOLUME_MIN) ;
  
  if(new_lots < min_lots ) 
         new_lots = min_lots;
  
  double max_lots = SymbolInfoDouble(symbol,SYMBOL_VOLUME_MAX) ;
  
  if(new_lots > max_lots ) 
         new_lots = max_lots;
  return (new_lots);
  
 } 