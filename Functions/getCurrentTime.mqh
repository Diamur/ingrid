#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
 datetime Tnew[];
datetime getCurrentTime(string symbol, ENUM_TIMEFRAMES timeframe){     
    CopyTime(symbol, timeframe, 0, 1, Tnew);
 return Tnew[0];
}