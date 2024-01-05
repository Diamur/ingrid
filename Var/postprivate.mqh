#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//CSymbolInfo    a_symbol; 
//Подсчитываемые значения
int      _count_BUY[NUMBER_OF_SYMBOLS];
int      _count_SELL[NUMBER_OF_SYMBOLS];

int      _count_BUYSTOP[NUMBER_OF_SYMBOLS];
int      _count_SELLSTOP[NUMBER_OF_SYMBOLS];
int      _count_BUYLIMIT[NUMBER_OF_SYMBOLS];
int      _count_SELLLIMIT[NUMBER_OF_SYMBOLS];

int      _count_BUYSTOP_TRADE[NUMBER_OF_SYMBOLS];
int      _count_SELLSTOP_TRADE[NUMBER_OF_SYMBOLS];
int      _count_BUYLIMIT_TRADE[NUMBER_OF_SYMBOLS];
int      _count_SELLLIMIT_TRADE[NUMBER_OF_SYMBOLS];

//int      _count_BUYSTOP_NOPROFIT[NUMBER_OF_SYMBOLS];
//int      _count_SELLSTOP_NOPROFIT[NUMBER_OF_SYMBOLS];
//int      _count_BUYLIMIT_NOPROFIT[NUMBER_OF_SYMBOLS];
//int      _count_SELLLIMIT_NOPROFIT[NUMBER_OF_SYMBOLS];

int      _count_BUYSTOP_PROFIT[NUMBER_OF_SYMBOLS];
int      _count_SELLSTOP_PROFIT[NUMBER_OF_SYMBOLS];
int      _count_BUYLIMIT_PROFIT[NUMBER_OF_SYMBOLS];
int      _count_SELLLIMIT_PROFIT[NUMBER_OF_SYMBOLS];

int      _count_BUYSTOP_SAFE[NUMBER_OF_SYMBOLS];
int      _count_SELLSTOP_SAFE[NUMBER_OF_SYMBOLS];
int      _count_BUYLIMIT_SAFE[NUMBER_OF_SYMBOLS];
int      _count_SELLLIMIT_SAFE[NUMBER_OF_SYMBOLS];

int      _countTXT_BUY[NUMBER_OF_SYMBOLS];
int      _countTXT_SELL[NUMBER_OF_SYMBOLS];
int      _countTXT_BUYSTOP[NUMBER_OF_SYMBOLS];
int      _countTXT_SELLSTOP[NUMBER_OF_SYMBOLS];
int      _countTXT_BUYLIMIT[NUMBER_OF_SYMBOLS];
int      _countTXT_SELLLIMIT[NUMBER_OF_SYMBOLS];

int     _countTXT = 0;

datetime W_time_1;
datetime W_time_2;

datetime S_time_1;
datetime S_time_2;

int _D1 = 0;
bool _WorkingHour = false;
bool _StopLossMinusHour;
MqlDateTime  _dt;
   