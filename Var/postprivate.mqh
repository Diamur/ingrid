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

//string terminal_data_path=TerminalInfoString(TERMINAL_DATA_PATH);
//string dir =  getNameFILE() + "_" +_Symbol+"_"+(string)Magic ;
//string filepath=terminal_data_path+"\\MQL5\\Files\\"+ dir +"\\"; 
//
//
//   
//string file_MAGIC          = dir + "\\" + "MAGIC.txt";
//string file_BALANCE_START  = dir + "\\" + "START_BALANCE.txt"; 
//string file_START_DATETIME = dir + "\\" + "START_DATETIME.txt"; 
//
//string file_LAST_BALANCE   = dir + "\\" + "LAST_BALANCE.txt"; 
//   
//string file_DAY0_ID        = dir + "\\" + "DAY0_ID.txt";
//string file_WEEK0_ID       = dir + "\\" + "WEEK0_ID.txt"; 
//string file_MONTH0_ID      = dir + "\\" + "MONTH0_ID.txt"; 
//string file_TODAY          = dir + "\\" + "TODAY.txt"; 
//string file_YESTERDAY      = dir + "\\" + "YESTERDAY.txt"; 
//
//string file_CURRENT_WEEK   = dir + "\\" + "CURRENT_WEEK.txt"; 
//string file_LAST_WEEK      = dir + "\\" + "LAST_WEEK.txt";
//
//string file_CURRENT_MONTH  = dir + "\\" + "CURRENTMONTH.txt"; 
//string file_LAST_MONTH     = dir + "\\" + "LAST_MONTH.txt";
//
//string file_ENTIRE_PERIOD  = dir + "\\" + "ENTIRE_PERIOD.txt";
//string file_MAXDRAWDOWN    = dir + "\\" + "MAXDRAWDOWN.txt";  

 
   
string dir =  getNameFILE() + "_" +_Symbol+"_"+(string)Magic ;
//string filepath=terminal_data_path+"\\MQL5\\Files\\"+ dir +"\\"; ''

string file_ZP          = dir + "\\" + "jZP.txt";
   
string file_MAGIC          = dir + "\\" + "MAGIC.txt";
//string file_BALANCE_START  = dir + "\\" + "START_BALANCE.txt"; 
//string file_START_DATETIME = dir + "\\" + "START_DATETIME.txt"; 

//string file_LAST_BALANCE   = dir + "\\" + "LAST_BALANCE.txt"; 
   
string file_DAY0_ID        = dir + "\\" + "DAY0_ID.txt";
string file_WEEK0_ID       = dir + "\\" + "WEEK0_ID.txt"; 
string file_MONTH0_ID      = dir + "\\" + "MONTH0_ID.txt"; 
string file_TODAY          = dir + "\\" + "TODAY.txt"; 
string file_YESTERDAY      = dir + "\\" + "YESTERDAY.txt"; 

string file_CURRENT_WEEK   = dir + "\\" + "CURRENT_WEEK.txt"; 
string file_LAST_WEEK      = dir + "\\" + "LAST_WEEK.txt";

string file_CURRENT_MONTH  = dir + "\\" + "CURRENTMONTH.txt"; 
string file_LAST_MONTH     = dir + "\\" + "LAST_MONTH.txt";

string file_ENTIRE_PERIOD  = dir + "\\" + "ENTIRE_PERIOD.txt";
string file_MAXDRAWDOWN    = dir + "\\" + "MAXDRAWDOWN.txt";   
   
//   struct _Profit{
//
//   int DAY0;
//   int DAY1 ;
//   
//   int WEEK0 ;
//   int WEEK1;
//   
//   int MONTH0 ;
//   int MONTH1 ;
//   
//   double Profit_DAY0 ;
//   double Profit_DAY1 ;
//   
//   double Profit_WEEK0;
//   double Profit_WEEK1 ;
//   
//   double Profit_MONTH0 ;
//   double Profit_MONTH1 ;
//   
//   double Profit_Full; 
//     
//   };
//       
//   _Profit PRFT = {0,0, 0,0, 0,0, 0,0, 0,0, 0,0, 0};
   


   