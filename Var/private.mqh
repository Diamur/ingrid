#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime    dateStop =  D'2022.10.14 10:32:00';    
bool   _chekServer     = false ;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
#define  NUMBER_OF_SYMBOLS             1   //Кол-во символов

#define  NUMBER_OF_KNEES               12   
#define  NUMBER_OF_SUB_KNEES           122


#define  NUMBER_OF_BUYLIMITS           NUMBER_OF_KNEES   
#define  NUMBER_OF_SELLLIMITS          NUMBER_OF_KNEES  

#define  NUMBER_OF_SELLSTOP            122  
#define  NUMBER_OF_BUYSTOP             122  

#define  NUMBER_OF_STATUSES            50 

#define  STATUS_TRADE                  0 
#define  STATUS_WORK                   1 
#define  STATUS_FRIDAY                 2 
#define  STATUS_COUNT                  3 
#define  STATUS_NEWBAR                 4 

#define  STATUS_STO_UP                 5
#define  STATUS_STO_DN                 6
#define  STATUS_MA_UP                  7 
#define  STATUS_MA_DN                  8
#define  STATUS_CCI_UP                 9 
#define  STATUS_CCI_DN                 10 

#define  STATUS_STEP_A                 11
#define  STATUS_STEP_B                 12

#define  STATUS_SPRED_WIDTH            13 

#define  STATUS_TRADE_ON               14 

#define  STATUS_COMMENT_BUYLIMIT       19 
#define  STATUS_COMMENT_SELLLIMITL     20 
 
#define  STATUS_COMMENT_BUYSTOP        21 
#define  STATUS_COMMENT_SELLLSTOP      22 

#define  STATUS_PROFIT_BUY           15 
#define  STATUS_PROFIT_SELL          16 

#define  STATUS_VOLUME_BUY             23 
#define  STATUS_VOLUME_SELL            24 

#define  STATUS_DT_START_STEP          25 
#define  STATUS_PEND                   26 
#define  STATUS_MAIN_ON                27 
#define  STATUS_SCOPE_LEVEL            28 
#define  STATUS_TRADE_UP               29 
#define  STATUS_TRADE_DN               30 
#define  STATUS_STOPLOSS               31 
#define  STATUS_SUB_ON                 32 
#define  STATUS_TRADE_MAIN_UP          33 
#define  STATUS_TRADE_MAIN_DN          34 
#define  STATUS_TRADE_SUB_UP           35 
#define  STATUS_TRADE_SUB_DN           36 
#define  STATUS_SCOPE_ON               37 
#define  STATUS_PROFIT_FULL            38 
#define  STATUS_TRALL                  39 
#define  STATUS_COUNT_POS              40 
#define  STATUS_STATE_UP               41
#define  STATUS_STATE_DN               42
#define  STATUS_STATE_STOP             43 
#define  STATUS_STO                    44
#define  STATUS_ASK                    45
#define  STATUS_BID                    46
#define  STATUS_PIPS_OUT               47
#define  STATUS_DT_OUT                 48




//+------------------------------------------------------------------+
struct _Status {  
     bool OpenBUYLIMIT [NUMBER_OF_SYMBOLS][NUMBER_OF_STATUSES];
     bool OpenSELLLIMIT[NUMBER_OF_SYMBOLS][NUMBER_OF_STATUSES];
 
     bool OpenSELLSTOP [NUMBER_OF_SYMBOLS][NUMBER_OF_STATUSES];
     bool OpenBUYSTOP  [NUMBER_OF_SYMBOLS][NUMBER_OF_STATUSES];

     bool CloseSELLLIMIT[NUMBER_OF_SYMBOLS][NUMBER_OF_STATUSES];
     bool CloseBUYLIMIT[NUMBER_OF_SYMBOLS][NUMBER_OF_STATUSES];  

     bool CloseSELLSTOP[NUMBER_OF_SYMBOLS][NUMBER_OF_STATUSES]; 
     bool CloseBUYSTOP[NUMBER_OF_SYMBOLS][NUMBER_OF_STATUSES];   
     
     bool CloseALL[NUMBER_OF_SYMBOLS][NUMBER_OF_STATUSES]; 
     
     bool CloseBUY[NUMBER_OF_SYMBOLS][NUMBER_OF_STATUSES]; 
     bool CloseSELL[NUMBER_OF_SYMBOLS][NUMBER_OF_STATUSES];
     
     bool CloseBL[NUMBER_OF_SYMBOLS][NUMBER_OF_STATUSES];
     bool CloseSL[NUMBER_OF_SYMBOLS][NUMBER_OF_STATUSES];
   
     bool CloseBS[NUMBER_OF_SYMBOLS][NUMBER_OF_STATUSES];
     bool CloseSS[NUMBER_OF_SYMBOLS][NUMBER_OF_STATUSES];     
      
};
_Status Status;
//+------------------------------------------------------------------+
struct _Step { 
     int StartStep ; 
     int AStep   ;
     int B1Step  ;
     int B2Step  ;
     int B3Step  ;
     int B4Step  ;
     int B5Step  ;
     int B6Step  ;
     int B7Step  ;
     int B8Step  ;
};
_Step Step;
//---
struct _Lot { 
     double LotA ; 
     double LotB1 ;
     double LotB2 ;
     double LotB3 ;
     double LotB4 ;
     double LotB5 ;
     double LotB6 ;
     double LotB7 ;
     double LotB8 ;     
};
_Lot Lot;
//+------------------------------------------------------------------+
#define  COMMENT_BUYLIMIT_A0  "_A0BL" // комментарий для закрывающего отложника
#define  COMMENT_SELLLIMIT_A0 "_A0SL" // ккомментарий для закрывающего отложника

#define  COMMENT_BUYLIMIT_A1  "_A1BL" // комментарий для закрывающего отложника
#define  COMMENT_SELLLIMIT_A1 "_A1SL" // ккомментарий для закрывающего отложника

#define  COMMENT_BUYLIMIT_A2  "_A2BL" // комментарий для закрывающего отложника
#define  COMMENT_SELLLIMIT_A2 "_A2SL" // ккомментарий для закрывающего отложника

#define  COMMENT_BUYLIMIT_A3  "_A3BL" // комментарий для закрывающего отложника
#define  COMMENT_SELLLIMIT_A3 "_A3SL" // ккомментарий для закрывающего отложника

#define  COMMENT_BUYLIMIT_A4  "_A4BL" // комментарий для закрывающего отложника
#define  COMMENT_SELLLIMIT_A4 "_A4SL" // ккомментарий для закрывающего отложника

#define  COMMENT_BUYLIMIT_A5  "_A5BL" // комментарий для закрывающего отложника
#define  COMMENT_SELLLIMIT_A5 "_A5SL" // ккомментарий для закрывающего отложника

#define  COMMENT_BUYLIMIT_A6  "_A6BL" // комментарий для закрывающего отложника
#define  COMMENT_SELLLIMIT_A6 "_A6SL" // ккомментарий для закрывающего отложника

#define  COMMENT_BUYLIMIT_A7  "_A7BL" // комментарий для закрывающего отложника
#define  COMMENT_SELLLIMIT_A7 "_A7SL" // ккомментарий для закрывающего отложника

#define  COMMENT_BUYLIMIT_A8  "_A8BL" // комментарий для закрывающего отложника
#define  COMMENT_SELLLIMIT_A8 "_A8SL" // ккомментарий для закрывающего отложника
//---
#define  COMMENT_BUYLIMIT_B1  "_B1BL" // комментарий для закрывающего отложника
#define  COMMENT_SELLLIMIT_B1 "_B1SL" // ккомментарий для закрывающего отложника

#define  COMMENT_BUYLIMIT_B2  "_B2BL" // комментарий для закрывающего отложника
#define  COMMENT_SELLLIMIT_B2 "_B2SL" // ккомментарий для закрывающего отложника

#define  COMMENT_BUYLIMIT_B3  "_B3BL" // комментарий для закрывающего отложника
#define  COMMENT_SELLLIMIT_B3 "_B3SL" // ккомментарий для закрывающего отложника

#define  COMMENT_BUYLIMIT_B4  "_B4BL" // комментарий для закрывающего отложника
#define  COMMENT_SELLLIMIT_B4 "_B4SL" // ккомментарий для закрывающего отложника

#define  COMMENT_BUYLIMIT_B5  "_B5BL" // комментарий для закрывающего отложника
#define  COMMENT_SELLLIMIT_B5 "_B5SL" // ккомментарий для закрывающего отложника

#define  COMMENT_BUYLIMIT_B6  "_B6BL" // комментарий для закрывающего отложника
#define  COMMENT_SELLLIMIT_B6 "_B6SL" // ккомментарий для закрывающего отложника

#define  COMMENT_BUYLIMIT_B7  "_B7BL" // комментарий для закрывающего отложника
#define  COMMENT_SELLLIMIT_B7 "_B7SL" // ккомментарий для закрывающего отложника

#define  COMMENT_BUYLIMIT_B8  "_B8BL" // комментарий для закрывающего отложника
#define  COMMENT_SELLLIMIT_B8 "_B8SL" // ккомментарий для закрывающего отложника



#define  TYPE_BUY             0
#define  TYPE_SELL            1
#define  TYPE_BUYSTOP         2
#define  TYPE_SELLSTOP        3
#define  TYPE_BUYLIMIT        4
#define  TYPE_SELLLIMIT       5

#define  TRADEMODE_OPEN        0
#define  TRADEMODE_CLOSE       1
#define  TRADEMODE_MODIF       2

#define  TRADE_BUY          false
#define  TRADE_SELL         false

#define  TRADE_BUYSTOP      true
#define  TRADE_SELLSTOP     true

#define  TRADE_BUYLIMIT     true
#define  TRADE_SELLLIMIT    true

//#define  TRADE_iMA           false
#define  TRADE_iSTO          true
//#define  TRADE_iCCI          false

//CPositionInfo  a_position;
CTrade   a_trade[NUMBER_OF_SYMBOLS];
CJAVal   jSymbol;
CDealInfo deal;

CJAVal   jBUYLIMIT;
CJAVal   jSELLLIMIT;

CJAVal   jData;
CJAVal   jTicket;

CJAVal   jZP;
CJAVal   jFN;

CJAVal   jFILE;

string arrSymbol[NUMBER_OF_SYMBOLS] ;
bool   Trade[NUMBER_OF_SYMBOLS];
//int    Trall[NUMBER_OF_SYMBOLS];
//int    TrallStep[NUMBER_OF_SYMBOLS];
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int   in_count_BUY[NUMBER_OF_SYMBOLS];
int   in_count_SELL[NUMBER_OF_SYMBOLS];
int   in_count_BUYSTOP[NUMBER_OF_SYMBOLS];
int   in_count_SELLSTOP[NUMBER_OF_SYMBOLS];
int   in_count_BUYLIMIT[NUMBER_OF_SYMBOLS];
int   in_count_SELLLIMIT[NUMBER_OF_SYMBOLS];
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool  SignalCloseAll_TRALL[NUMBER_OF_SYMBOLS] ;
bool  SignalCloseAll_PROFIT[NUMBER_OF_SYMBOLS] ;
bool  SignalCloseAll_LOWPROFIT[NUMBER_OF_SYMBOLS] ;

bool  SignalCloseSL_OUT_PRICE[NUMBER_OF_SYMBOLS] ;
bool  SignalCloseBL_OUT_PRICE[NUMBER_OF_SYMBOLS] ;


bool  SignalCloseBL_PROFIT[NUMBER_OF_SYMBOLS] ;
bool  SignalCloseSL_PROFIT[NUMBER_OF_SYMBOLS] ;

bool  SignalCloseBS_PROFIT[NUMBER_OF_SYMBOLS] ;
bool  SignalCloseSS_PROFIT[NUMBER_OF_SYMBOLS] ;

bool  SignalCloseBUY_TRALL[NUMBER_OF_SYMBOLS] ;
bool  SignalCloseSELL_TRALL[NUMBER_OF_SYMBOLS] ;

bool  SignalCloseBS_TRALL[NUMBER_OF_SYMBOLS] ;
bool  SignalCloseSL_TRALL[NUMBER_OF_SYMBOLS] ;
bool  SignalCloseBL_TRALL[NUMBER_OF_SYMBOLS] ;
bool  SignalCloseSS_TRALL[NUMBER_OF_SYMBOLS] ;


bool  SignalCloseBUY_PROFIT[NUMBER_OF_SYMBOLS] ;
bool  SignalCloseSELL_PROFIT[NUMBER_OF_SYMBOLS] ;

bool  SignalCloseUP_MOVE[NUMBER_OF_SYMBOLS] ;
bool  SignalCloseDN_MOVE[NUMBER_OF_SYMBOLS] ;

bool  SignalCloseBuy[NUMBER_OF_SYMBOLS] ;
bool  SignalCloseSell[NUMBER_OF_SYMBOLS];

bool  SignalOpenBuy[NUMBER_OF_SYMBOLS] ;
bool  SignalOpenSell[NUMBER_OF_SYMBOLS];
//+------------------------------------------------------------------+
bool  SignalCloseBuyStop[NUMBER_OF_SYMBOLS];
bool  SignalCloseBuyStopScope[NUMBER_OF_SYMBOLS];
bool  SignalCloseBuyStopMove[NUMBER_OF_SYMBOLS];
bool  SignalCloseBuyStopMoveScope[NUMBER_OF_SYMBOLS];
bool  SignalCloseBuyStopProfit[NUMBER_OF_SYMBOLS];

bool  SignalCloseSellStop[NUMBER_OF_SYMBOLS];
bool  SignalCloseSellStopScope[NUMBER_OF_SYMBOLS];
bool  SignalCloseSellStopMove[NUMBER_OF_SYMBOLS];
bool  SignalCloseSellStopMoveScope[NUMBER_OF_SYMBOLS];
bool  SignalCloseSellStopProfit[NUMBER_OF_SYMBOLS];

bool  SignalCloseBuyLimit[NUMBER_OF_SYMBOLS];
bool  SignalCloseBuyLimitScope[NUMBER_OF_SYMBOLS];
bool  SignalCloseBuyLimitMove[NUMBER_OF_SYMBOLS];
bool  SignalCloseBuyLimitMoveScope[NUMBER_OF_SYMBOLS];
bool  SignalCloseBuyLimitProfit[NUMBER_OF_SYMBOLS];

bool  SignalCloseSellLimit[NUMBER_OF_SYMBOLS];
bool  SignalCloseSellLimitScope[NUMBER_OF_SYMBOLS];
bool  SignalCloseSellLimitMove[NUMBER_OF_SYMBOLS];
bool  SignalCloseSellLimitMoveScope[NUMBER_OF_SYMBOLS];
bool  SignalCloseSellLimitProfit[NUMBER_OF_SYMBOLS];
//+------------------------------------------------------------------+
bool  SignalOpenBuyStop[NUMBER_OF_SYMBOLS];
bool  SignalOpenBuyStopScope[NUMBER_OF_SYMBOLS];
bool  SignalOpenBuyStopMove[NUMBER_OF_SYMBOLS];
bool  SignalOpenBuyStopMoveScope[NUMBER_OF_SYMBOLS];
bool  SignalOpenBuyStopProfit[NUMBER_OF_SYMBOLS];

bool  SignalOpenSellStop[NUMBER_OF_SYMBOLS];
bool  SignalOpenSellStopScope[NUMBER_OF_SYMBOLS];
bool  SignalOpenSellStopMove[NUMBER_OF_SYMBOLS];
bool  SignalOpenSellStopMoveScope[NUMBER_OF_SYMBOLS];
bool  SignalOpenSellStopProfit[NUMBER_OF_SYMBOLS];

bool  SignalOpenBuyLimit[NUMBER_OF_SYMBOLS];
bool  SignalOpenBuyLimitScope[NUMBER_OF_SYMBOLS];
bool  SignalOpenBuyLimitMove[NUMBER_OF_SYMBOLS];
bool  SignalOpenBuyLimitMoveScope[NUMBER_OF_SYMBOLS];
bool  SignalOpenBuyLimitProfit[NUMBER_OF_SYMBOLS];

bool  SignalOpenSellLimit[NUMBER_OF_SYMBOLS];
bool  SignalOpenSellLimitScope[NUMBER_OF_SYMBOLS];
bool  SignalOpenSellLimitMove[NUMBER_OF_SYMBOLS];
bool  SignalOpenSellLimitMoveScope[NUMBER_OF_SYMBOLS];
bool  SignalOpenSellLimitProfit[NUMBER_OF_SYMBOLS];
//+------------------------------------------------------------------+
bool  SignalModBuy[NUMBER_OF_SYMBOLS] ;
bool  SignalModSell[NUMBER_OF_SYMBOLS];
bool  SignalModBuyStop[NUMBER_OF_SYMBOLS];
bool  SignalModSellStop[NUMBER_OF_SYMBOLS];
bool  SignalModBuyLimit[NUMBER_OF_SYMBOLS];
bool  SignalModSellLimit[NUMBER_OF_SYMBOLS];


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int      h_iMA[NUMBER_OF_SYMBOLS]     ;
int      h_iMA_low[NUMBER_OF_SYMBOLS]     ;

double   arr_iMA[];
double   arr_iMA_low[];

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int      h_Sto[NUMBER_OF_SYMBOLS]     ;
double   arr_iStoMain[];
double   arr_iStoSignal[];
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int      h_CCI[NUMBER_OF_SYMBOLS]     ;
double   arr_iCCIMain[];
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool     hiddenIndikator = false;  
int      countbars =0;
datetime Told[];
//bool     Status[NUMBER_OF_SYMBOLS][3][6][NUMBER_OF_STATUSES];
int      StopLoss[NUMBER_OF_SYMBOLS];
int      TakeProfit[NUMBER_OF_SYMBOLS];
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
datetime BarOpenBUY[NUMBER_OF_SYMBOLS];
datetime BarOpenSELL[NUMBER_OF_SYMBOLS];

datetime BarOpenBUYSTOP[NUMBER_OF_SYMBOLS];
datetime BarOpenSELLSTOP[NUMBER_OF_SYMBOLS];
datetime BarOpenBUYLIMIT[NUMBER_OF_SYMBOLS];
datetime BarOpenSELLLIMIT[NUMBER_OF_SYMBOLS];

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   int _HistoryOrdersTotal =  0;
   int _HistoryDealsTotal  =  0;
   int _OrdersTotal        =  0;
   int _PositionsTotal     =  0;   
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int multBUY[NUMBER_OF_SYMBOLS];
int multSELL[NUMBER_OF_SYMBOLS];
int multBUYSTOP[NUMBER_OF_SYMBOLS];
int multSELLSTOP[NUMBER_OF_SYMBOLS];
int multBUYLIMIT[NUMBER_OF_SYMBOLS];
int multSELLLIMIT[NUMBER_OF_SYMBOLS];
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int lastTiketBUY[NUMBER_OF_SYMBOLS];
int lastTiketSELL[NUMBER_OF_SYMBOLS];
double lastProfitBUY[NUMBER_OF_SYMBOLS];
double lastProfitSELL[NUMBER_OF_SYMBOLS];
double lastVolumeBUY[NUMBER_OF_SYMBOLS];
double lastVolumeSELL[NUMBER_OF_SYMBOLS];
double lastPriceBUY[NUMBER_OF_SYMBOLS];
double lastPriceSELL[NUMBER_OF_SYMBOLS];
double ProfitSymbol[NUMBER_OF_SYMBOLS]; 
double ProfitFull = 0;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int TICKET_CLOSE_PROFIT_BUYSTOP [NUMBER_OF_SYMBOLS];//= -1;
int TICKET_CLOSE_PROFIT_SELLSTOP [NUMBER_OF_SYMBOLS];//= -1;

int TICKET_CLOSE_PROFIT_BUYLIMIT [NUMBER_OF_SYMBOLS];//= -1;
int TICKET_CLOSE_PROFIT_SELLLIMIT[NUMBER_OF_SYMBOLS];//= -1;
//---
int TICKET_CLOSE_SAFE_BUYSTOP [NUMBER_OF_SYMBOLS];//= -1;
int TICKET_CLOSE_SAFE_SELLSTOP [NUMBER_OF_SYMBOLS];//= -1;

int TICKET_CLOSE_SAFE_BUYLIMIT [NUMBER_OF_SYMBOLS];//= -1;
int TICKET_CLOSE_SAFE_SELLLIMIT [NUMBER_OF_SYMBOLS];//= -1;
//---
double VOLUME_CLOSE_PROFIT_BUYSTOP [NUMBER_OF_SYMBOLS];
double VOLUME_CLOSE_PROFIT_SELLSTOP[NUMBER_OF_SYMBOLS];

double VOLUME_CLOSE_PROFIT_BUYLIMIT [NUMBER_OF_SYMBOLS];
double VOLUME_CLOSE_PROFIT_SELLLIMIT[NUMBER_OF_SYMBOLS];
//---
double VOLUME_CLOSE_SAFE_BUYSTOP [NUMBER_OF_SYMBOLS];
double VOLUME_CLOSE_SAFE_SELLSTOP [NUMBER_OF_SYMBOLS];

double VOLUME_CLOSE_SAFE_BUYLIMIT [NUMBER_OF_SYMBOLS];
double VOLUME_CLOSE_SAFE_SELLLIMIT [NUMBER_OF_SYMBOLS];

double MAX_PRICE_SELLLIMIT [NUMBER_OF_SYMBOLS];
double MIN_PRICE_SELLLIMIT [NUMBER_OF_SYMBOLS];

double MAX_PRICE_BUYLIMIT [NUMBER_OF_SYMBOLS];
double MIN_PRICE_BUYLIMIT [NUMBER_OF_SYMBOLS];

double MAX_PRICE_BUYSTOP [NUMBER_OF_SYMBOLS];
double MIN_PRICE_BUYSTOP [NUMBER_OF_SYMBOLS];

double MAX_PRICE_SELLSTOP [NUMBER_OF_SYMBOLS];
double MIN_PRICE_SELLSTOP [NUMBER_OF_SYMBOLS];

bool CCI_TRAND_UP = false;
bool CCI_TRAND_DN = false;

//datetime CurrentTime ;
string   info = "";

double ProfitA = 0;
double ProfitB = 0;

int NextMultBUYLIMIT = 1;
int NextMultSELLLIMIT = 1;
//+------------------------------------------------------------------+
#define  NAME_BUYSTOP   "BUYSTOP"
#define  NAME_SELLSTOP  "SELLSTOP"
#define  NAME_BUYLIMIT  "BUYLIMIT"
#define  NAME_SELLLIMIT "SELLLIMIT"
#define  NAME_ALL       "ALL"
#define  NAME_UP        "UP"
#define  NAME_DN        "DN"
#define  NAME_MOVE_UP   "MOVE_UP"
#define  NAME_MOVE_DN   "MOVE_DN"


#define  NAME_BL_0 "BL_0"
#define  NAME_BL_1 "BL_1"
#define  NAME_BL_2 "BL_2"
#define  NAME_BL_3 "BL_3"
#define  NAME_BL_4 "BL_4"
#define  NAME_BL_5 "BL_5"
#define  NAME_BL_6 "BL_6"
#define  NAME_BL_7 "BL_7"
#define  NAME_BL_8 "BL_8"
#define  NAME_BL_9 "BL_9"
#define  NAME_BL_10 "BL_10"
#define  NAME_BL_11 "BL_11"

#define  NAME_SL_0 "SL_0"
#define  NAME_SL_1 "SL_1"
#define  NAME_SL_2 "SL_2"
#define  NAME_SL_3 "SL_3"
#define  NAME_SL_4 "SL_4"
#define  NAME_SL_5 "SL_5"
#define  NAME_SL_6 "SL_6"
#define  NAME_SL_7 "SL_7"
#define  NAME_SL_8 "SL_8"
#define  NAME_SL_9 "SL_9"
#define  NAME_SL_10 "SL_10"
#define  NAME_SL_11 "SL_11"


#define  NAME_BS_0 "BS_0"
#define  NAME_BS_1 "BS_1"
#define  NAME_BS_2 "BS_2"
#define  NAME_BS_3 "BS_3"
#define  NAME_BS_4 "BS_4"
#define  NAME_BS_5 "BS_5"
#define  NAME_BS_6 "BS_6"
#define  NAME_BS_7 "BS_7"
#define  NAME_BS_8 "BS_8"
#define  NAME_BS_9 "BS_9"
#define  NAME_BS_10 "BS_10"
#define  NAME_BS_11 "BS_11"
#define  NAME_BS_12 "BS_12"
#define  NAME_BS_13 "BS_13"
#define  NAME_BS_14 "BS_14"
#define  NAME_BS_15 "BS_15"
#define  NAME_BS_16 "BS_16"
#define  NAME_BS_17 "BS_17"
#define  NAME_BS_18 "BS_18"
#define  NAME_BS_19 "BS_19"
#define  NAME_BS_20 "BS_20"
#define  NAME_BS_21 "BS_21"
#define  NAME_BS_22 "BS_22"
#define  NAME_BS_23 "BS_23"
#define  NAME_BS_24 "BS_24"
#define  NAME_BS_25 "BS_25"
#define  NAME_BS_26 "BS_26"
#define  NAME_BS_27 "BS_27"
#define  NAME_BS_28 "BS_28"
#define  NAME_BS_29 "BS_29"
#define  NAME_BS_30 "BS_30"
#define  NAME_BS_31 "BS_31"
#define  NAME_BS_32 "BS_32"
#define  NAME_BS_33 "BS_33"
#define  NAME_BS_34 "BS_34"
#define  NAME_BS_35 "BS_35"
#define  NAME_BS_36 "BS_36"

#define  NAME_SS_0 "SS_0"
#define  NAME_SS_1 "SS_1"
#define  NAME_SS_2 "SS_2"
#define  NAME_SS_3 "SS_3"
#define  NAME_SS_4 "SS_4"
#define  NAME_SS_5 "SS_5"
#define  NAME_SS_6 "SS_6"
#define  NAME_SS_7 "SS_7"
#define  NAME_SS_8 "SS_8"
#define  NAME_SS_9 "SS_9"
#define  NAME_SS_10 "SS_10"
#define  NAME_SS_11 "SS_11"
#define  NAME_SS_12 "SS_12"
#define  NAME_SS_13 "SS_13"
#define  NAME_SS_14 "SS_14"
#define  NAME_SS_15 "SS_15"
#define  NAME_SS_16 "SS_16"
#define  NAME_SS_17 "SS_17"
#define  NAME_SS_18 "SS_18"
#define  NAME_SS_19 "SS_19"
#define  NAME_SS_20 "SS_20"
#define  NAME_SS_21 "SS_21"
#define  NAME_SS_22 "SS_22"
#define  NAME_SS_23 "SS_23"
#define  NAME_SS_24 "SS_24"
#define  NAME_SS_25 "SS_25"
#define  NAME_SS_26 "SS_26"
#define  NAME_SS_27 "SS_27"
#define  NAME_SS_28 "SS_28"
#define  NAME_SS_29 "SS_29"
#define  NAME_SS_30 "SS_30"
#define  NAME_SS_31 "SS_31"
#define  NAME_SS_32 "SS_32"
#define  NAME_SS_33 "SS_33"
#define  NAME_SS_34 "SS_34"
#define  NAME_SS_35 "SS_35"
#define  NAME_SS_36 "SS_36"

#define  NAME_ID           "Id"
#define  NAME_LOT          "Lot"
#define  NAME_MAIN_STEP    "MainStep"
#define  NAME_SUB_STEP     "SubStep"
#define  NAME_FULL_STEP    "FullStep"
#define  NAME_PRICE_OPEN   "PriceOpen"
#define  NAME_TAKEPROFIT   "TakeProfit"
#define  NAME_TRADE        "Trade"
#define  NAME_TICKET       "Ticket"
#define  NAME_TYPE         "Type"
#define  NAME_MAIN         "MainName"
#define  NAME_SUB          "SubName"
#define  NAME_STATUS       "Status"
#define  NAME_STATUS_OPEN  "Status_Open"
#define  NAME_STATUS_PEND  "Status_Pend"
#define  NAME_COMMENT      "Comment"
#define  NAME_PREFIX_SL    "SL"
#define  NAME_PREFIX_BL    "BL"
#define  NAME_PREFIX_SS    "SS"
#define  NAME_PREFIX_BS    "BS"

#define  NAME_TRALL_NULL_BS   "TRALL_NULL_BS"
#define  NAME_TRALL_OPEN_BS   "TRALL_OPEN_BS"
#define  NAME_TRALL_FULL_BS   "TRALL_FULL_BS"

#define  NAME_TRALL_NULL_SL   "TRALL_NULL_SL"
#define  NAME_TRALL_OPEN_SL   "TRALL_OPEN_SL"
#define  NAME_TRALL_FULL_SL   "TRALL_FULL_SL"

#define  NAME_TRALL_NULL_BL   "TRALL_NULL_BL"
#define  NAME_TRALL_OPEN_BL   "TRALL_OPEN_BL"
#define  NAME_TRALL_FULL_BL   "TRALL_FULL_BL"

#define  NAME_TRALL_NULL_SS   "TRALL_NULL_SS"
#define  NAME_TRALL_OPEN_SS   "TRALL_OPEN_SS"
#define  NAME_TRALL_FULL_SS   "TRALL_FULL_SS"

#define  NAME_BUTTON_START     "BUTTON_START"
#define  NAME_BUTTON_STOP      "BUTTON_STOP"

#define  NAME_BUTTON_START_UP  "BUTTON_START_UP"
#define  NAME_BUTTON_START_DN  "BUTTON_START_DN"

#define  NAME_BUTTON_STOP_UP   "BUTTON_STOP_UP"
#define  NAME_BUTTON_STOP_DN   "BUTTON_STOP_DN"

#define  BGCOLOR_BUTTON          C'250,102,0'
#define  COLOR_TEXT              clrGray

#define  TEXT_BUTTON_START     "START AUTO"
#define  TEXT_BUTTON_STOP      "CLOSE&STOP"

#define  TEXT_BUTTON_START_UP  "TRADE UP"
#define  TEXT_BUTTON_STOP_UP   "CLOSE UP"

#define  TEXT_BUTTON_START_DN  "TRADE DOWN"
#define  TEXT_BUTTON_STOP_DN   "CLOSE DOWN"

#define SPEEDCLICK 500 
string name_obj = MQLInfoString(MQL_PROGRAM_NAME);
uint time_click = 0;

//--- идентификаторы служебных клавиш 
#define KEY_NUMPAD_5       12 
#define KEY_LEFT           37 
#define KEY_UP             38 
#define KEY_RIGHT          39 
#define KEY_DOWN           40 
#define KEY_NUMLOCK_DOWN   98 
#define KEY_NUMLOCK_LEFT  100 
#define KEY_NUMLOCK_5     101 
#define KEY_NUMLOCK_RIGHT 102 
#define KEY_NUMLOCK_UP    104 

   #define NAME_PANEL_LOGO  "LOGO"
   #define NAME_PANEL_BKG   "CPanelBkg"
   
   #define NAME_PANEL_HDR1   "CPanelHdr1"
   #define NAME_PANEL_HDR2   "CPanelHdr2"
   #define NAME_PANEL_HDR3   "CPanelHdr3"
      
   #define ZP_BALANCE_START  "BALANCE_START"
   #define ZP_DATETIME_START "DATETIME_STAR"

   #define NAME_KEY        "NAME_KYE"
   #define NAME_VAL        "NAME_VAL"
   
   #define TEXT            "TEXT" 
   #define VAL             "VAL"     
   #define DATE            "DATE" 
   #define FILE            "FILE"     
   //+----------------------(ZP)--------------------------------------------+          
   //--- key
   #define ZP_TODAY                 "TODAY"
   #define ZP_YESTERDAY             "YESTERDAY"
   #define ZP_CURRENT_WEEK          "CURRENT_WEEK"
   #define ZP_LAST_WEEK             "LAST_WEEK"
   #define ZP_CURRENT_MONTH         "CURRENT_MONTH"
   #define ZP_LAST_MONTH            "LAST_MONTH"
   #define ZP_ENTIRE_PERIOD         "ENTIRE_PERIOD"   
   #define ZP_COMMISION             "COMMISION" 
   #define ZP_SWAP                  "SWAP" 
   //--- val  
   #define ZP_PROFIT_TODAY          "PROFIT_TODAY"
   #define ZP_PROFIT_YESTERDAY      "PROFIT_YESTERDAY"
   #define ZP_PROFIT_CURRENT_WEEK   "PROFIT_CURRENT_WEEK"
   #define ZP_PROFIT_LAST_WEEK      "PROFIT_LAST_WEEK"
   #define ZP_PROFIT_CURRENT_MONTH  "PROFIT_CURRENT_MONTH"
   #define ZP_PROFIT_LAST_MONTH     "PROFIT_LAST_MONTH"
   #define ZP_PROFIT_ENTIRE_PERIOD  "PROFIT_ENTIRE_PERIOD"   
   #define ZP_VAL_COMMISION         "VAL_COMMISION" 
   #define ZP_VAL_SWAP              "VAL_SWAP"  
   //--- text        
   #define ZP_TEXT_TODAY            "Current day : "
   #define ZP_TEXT_YESTERDAY        "Last day : "
   #define ZP_TEXT_CURRENT_WEEK     "Current week : "
   #define ZP_TEXT_LAST_WEEK        "Last week : "
   #define ZP_TEXT_CURRENT_MONTH    "Current month : "
   #define ZP_TEXT_LAST_MONTH       "Last month : "
   #define ZP_TEXT_ENTIRE_PERIOD    "Entire period : " 
   #define ZP_TEXT_COMMISION        "Commision : "  
   #define ZP_TEXT_SWAP             "Swap : "  
    //+----------------------(ZP)--------------------------------------------+     
   //--- key 
   #define FN_KEY_BALANCE           "KEY_BALANCE"   
   #define FN_KEY_EQITY             "KEY_EQITY"   
   #define FN_KEY_MARGINFREE        "KEY_MARGINFREE"   
   #define FN_KEY_PROFIT            "KEY_PROFIT"   
   #define FN_KEY_PROFIT_DN         "KEY_PROFIT_DN"   
   #define FN_KEY_PROFIT_UP         "KEY_PROFIT_UP"       
   //--- val  
   #define FN_VAL_BALANCE           "VAL_BALANCE"
   #define FN_VAL_EQITY             "VAL_EQITY"
   #define FN_VAL_MARGINFREE        "VAL_MARGINFREE"
   #define FN_VAL_PROFIT            "VAL_PROFIT"
   #define FN_VAL_PROFIT_DN         "VAL_PROFIT_DN"
   #define FN_VAL_PROFIT_UP         "VAL_PROFIT_UP"
  //--- text       
   #define FN_TEXT_BALANCE           "Balance : "
   #define FN_TEXT_EQITY             "Eqity : "
   #define FN_TEXT_MARGINFREE        "MarginFree : "
   #define FN_TEXT_PROFIT            "Profit FULL : "
   #define FN_TEXT_PROFIT_DN         "Profit UP : "
   #define FN_TEXT_PROFIT_UP         "Profit DOWN : "

   bool isPanelTop = false;






//---


struct _Order
{
string arrBUYLIMIT[NUMBER_OF_BUYLIMITS];
string arrSELLLIMIT[NUMBER_OF_SELLLIMITS];

string arrBUYSTOP[NUMBER_OF_BUYSTOP];
string arrSELLSTOP[NUMBER_OF_SELLSTOP];

};
_Order Order;
//---
struct _Price
{
double arrLIMIT[6][2];
double arrSTOP[26][2];
double arrFULL[32];
};
_Price PriceUP;
_Price PriceDN;
//---
bool TRADE      = false;
bool TRADE_MAIN_UP = false;
bool TRADE_SUB_UP  = false;

bool TRADE_MAIN_DN = false;
bool TRADE_SUB_DN  = false;

//bool TRADE_SS  = false;
//bool TRADE_BS  = false;

int DIGIT;
int TRADE_STOPS_LEVEL; 
double POINT;

datetime BarReMOVE;

   int arrCountSubKNEE[NUMBER_OF_KNEES];

double arrMain_MULT[NUMBER_OF_KNEES] ; //= {1,2,4,8,16,32,64,128, 256,512,1024,2024} ;
   int arrSub_MULT[NUMBER_OF_KNEES]  = {0,1,2,3,4,7,9,11,13,15,19,21};

   int arrFullStep[NUMBER_OF_KNEES];
   int arrMainStep[NUMBER_OF_KNEES];
   int arrSubStep[NUMBER_OF_KNEES];

double TRADE_ASK ;
double TRADE_BID ;
//---
double PRICE_ScopeLevel_UP_ASK ;
double PRICE_ScopeLevel_UP_BID ;

double PRICE_ScopeLevel_DN_ASK ;
double PRICE_ScopeLevel_DN_BID ;

double PriceMAX_UP;
double PriceMIN_UP;

double PriceMAX_DN;
double PriceMIN_DN;

   int Ticket_BUYLIMIT_CLOSE  = -1;
   int Ticket_SELLLIMIT_CLOSE = -1;
   
   int Ticket_BUYSTOP_CLOSE   = -1;
   int Ticket_SELLSTOP_CLOSE  = -1;  
//---

//double TRALL_UP;
//double TRALL_DN;

   int TRALL_FULL_BS;
   int TRALL_FULL_SL;
   int TRALL_FULL_BL;
   int TRALL_FULL_SS;
   
   int TRALL_OPEN_BS;
   int TRALL_OPEN_SL;
   int TRALL_OPEN_BL;
   int TRALL_OPEN_SS;

   //int PROFIT_TRALL;
//double PRICE_PROFIT_NULL;

double PRICE_TRALL_NULL_BS;
double PRICE_TRALL_NULL_SL;
double PRICE_TRALL_NULL_BL;
double PRICE_TRALL_NULL_SS;

double PRICE_TRALL_OPEN_BS;
double PRICE_TRALL_OPEN_SL;
double PRICE_TRALL_OPEN_BL;
double PRICE_TRALL_OPEN_SS;

double PRICE_TRALL_FULL_BS;
double PRICE_TRALL_FULL_SL;
double PRICE_TRALL_FULL_BL;
double PRICE_TRALL_FULL_SS;

   int DT_NULL_OPEN_BS;
   int DT_NULL_OPEN_SL;
   int DT_NULL_OPEN_BL;
   int DT_NULL_OPEN_SS; 

   int DT_OPEN_FULL_BS;
   int DT_OPEN_FULL_SL;
   int DT_OPEN_FULL_BL;
   int DT_OPEN_FULL_SS;

double STOPLOSS_BS;
double STOPLOSS_SL;
double STOPLOSS_BL;
double STOPLOSS_SS;

//---
   int VECTOR;

#define NUMBER_STR 50
#define NUMBER_COL 4

string   arrNameObject[NUMBER_STR][NUMBER_COL];
int      arrXLabel[NUMBER_STR][NUMBER_COL];
int      arrYLabel[NUMBER_STR];

double BALANCE ;
double BALANCE_START ;
double EQITY ;
double DT_EQITY_BALANCE ;

//double   BALANCE  ;//= 0; //          
datetime DATETIME_START;// = 0; //

bool PRICE_Set      = false;

int const arrStartStop[NUMBER_OF_KNEES][2] = {{0,0},{0,2},{2,5},{5,10},{10,17},{17,26},{26,37},{37,50},{50,65},{65,82},{82,101},{101,122}};

   //if(i==0) {  kstart = 0  ; kstop = 0; }
   //if(i==1) {  kstart = 0  ; kstop = 2; }
   //if(i==2) {  kstart = 2  ; kstop = 5; }
   //if(i==3) {  kstart = 5  ; kstop = 10; }
   //if(i==4) {  kstart = 10 ; kstop = 17; }
   //if(i==5) {  kstart = 17 ; kstop = 26; }
   //if(i==6) {  kstart = 26 ; kstop = 37; }
   //if(i==7) {  kstart = 37 ; kstop = 50 ; }
   //if(i==8) {  kstart = 50 ; kstop = 65 ; }
   //if(i==9) {  kstart = 65 ; kstop = 82 ; }
   //if(i==10){  kstart = 82 ; kstop = 101 ; }
   //if(i==11){  kstart = 101; kstop = 122 ; }
   
bool State_BUTTON_START    = false;
bool State_BUTTON_STOP     = true;

bool State_BUTTON_START_UP = false;
bool State_BUTTON_START_DN = false;

bool State_BUTTON_STOP_UP  = true;
bool State_BUTTON_STOP_DN  = true;

int  TIME_CLOSE_FULL = 0;
int  TIME_CLOSE_UP = 0;
int  TIME_CLOSE_DN = 0;



//+------------------------------------------------------------------+ 




//double arrDAY[5] = {0,0,0,0,0};
//double arrWEEK[4] = {0,0,0,0};   
//double arrMONTH[2] = {0,0};

 
