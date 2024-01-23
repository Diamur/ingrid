#property copyright     "Copyright 2022, MetaQuotes Ltd."
#property link          "https://www.mql5.com"
#property version       "1.00"
#property description   "Cameron EA"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string getNameFILE(){ return __FILE__ ;}
//+------------------------------------------------------------------+
//#include  <Trade\PositionInfo.mqh>
//#include  <Trade\_Trade.mqh>
//#include  <Trade\SymbolInfo.mqh>
#include  "class\SymbolInfo.mqh" 
#include  "class\_Trade.mqh" 
#include  "class\JAson.mqh" 
#include  "class\Panel.mqh" 
//+------------------------------------------------------------------+
#include  "setting\FilePathMain.mqh" 
#include  "Var\Var.mqh" 
//+------------------------------------------------------------------+
#include  "Grafics\Grafics.mqh" 
//+------------------------------------------------------------------+
//#include  "indicators\MA.mqh" 
#include  "indicators\STO.mqh"
//#include  "indicators\CCI.mqh" 
//+------------------------------------------------------------------+
#include  "Trade\Trade.mqh" 
//#include  "Trade\DealInfo.mqh" 
#include  "Bot\Bot.mqh"
#include  "Lot\Lot.mqh" 
#include  "Functions\Functions.mqh" 
#include  "Time\Time.mqh" 
#include  "Info\Info.mqh" 
//+------------------------------------------------------------------+
//#include  "events\_OnTrade.mqh" 
#include  "events\OnTester.mqh"
#include  "events\OnInit.mqh" 
#include  "events\OnDeinit.mqh" 
#include  "events\OnTrade.mqh" 
#include  "events\OnTradeTransaction.mqh" 
#include  "events\OnTimer.mqh" 
#include  "events\OnTick.mqh"
#include  "events\OnChartEvent.mqh"
//+------------------------------------------------------------------+
