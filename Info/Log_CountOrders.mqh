#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Log_CountOrders(int number){
 
   _addInfoLine();       
   _addInfo("OT = ", (string)(_OrdersTotal));
   _addInfo("PT = ", (string)(_PositionsTotal));
   _addInfo("HO = ", (string)(_HistoryOrdersTotal));
   _addInfo("HD = ", (string)(_HistoryDealsTotal));
   _addInfoLine(); 
   _addInfo("BUY = ", (string)(_count_BUY[number]));
   _addInfo("SELL = ", (string)(_count_SELL[number]));
   _addInfo("BUYSTOP = ", (string)(_count_BUYSTOP[number]));
   _addInfo("SELLSTOP = ", (string)(_count_SELLSTOP[number]));
   _addInfo("BUYLIMIT = ", (string)(_count_BUYLIMIT[number]));
   _addInfo("SELLLIMIT = ", (string)(_count_SELLLIMIT[number]));
   _addInfoLine();   
      
   //Comment(info);
}
  