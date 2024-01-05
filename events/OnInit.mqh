#include  "..\setting\FilePathMain.mqh" 

int OnInit()
  {    
  
    if(ScopeLevel < StartStep + StepPEND && ScopeLevel !=0 ){
        Alert("ВНИМАНИЕ! ScopeLevel должен болльше > ",StartStep + StepPEND , " или равен 0" );
           return(INIT_FAILED);
      }
  
    DIGIT               = (int)SymbolInfoInteger(NULL,SYMBOL_DIGITS);
    POINT               = SymbolInfoDouble(NULL,SYMBOL_POINT);
    TRADE_STOPS_LEVEL   = (int)SymbolInfoInteger(NULL,SYMBOL_TRADE_STOPS_LEVEL) ;
    
    
    PriceMAX_UP = 0;
    PriceMIN_UP = 0;
    
    PriceMAX_DN = 0;
    PriceMIN_DN = 0;
    
       //TRALL_UP = 0;
       //TRALL_DN = 0;
       
//   Ticket_MAIN_CLOSE_UP = -1;
//   Ticket_MAIN_CLOSE_DN = -1;
//   
//   Ticket_SUB_CLOSE_UP  = -1;
//   Ticket_SUB_CLOSE_DN  = -1; 

     TRALL_FULL_BL = Trall_BL ;
     TRALL_FULL_BS = Trall_BS ;
     TRALL_FULL_SL = Trall_SL ;
     TRALL_FULL_SS = Trall_SS ;
     
     
     //LAST_PROFIT = 0;
     //LAST_PipsPROFIT = 0;  
    
    STOPLOSS_BS = 0;
    STOPLOSS_SL = 0;
    STOPLOSS_BL = 0;
    STOPLOSS_SS = 0;
    
         VECTOR = -1;
    
   //PROFIT_TRALL = ProfitPipsPLUS + TRALL ;
    
   //---
   setXY_Label(); 
   
   ArrayInitialize(arrMain_MULT,1);
   
   if(K_MainLot > 1){
     for(int i=0;i<NUMBER_OF_KNEES;i++){
        if(i==0) arrMain_MULT[i] = 1;
        else  arrMain_MULT[i] = arrMain_MULT[i-1]*K_MainLot;
     }
   }
  
  //---
  for(int i=0;i<NUMBER_OF_KNEES;i++)
     {
       Order.arrBUYLIMIT[i]  = "BL_"+(string)i;
       Order.arrSELLLIMIT[i]  = "SL_"+(string)i;
     }     
  //---
  for(int i=0;i<NUMBER_OF_SUB_KNEES;i++)
     {
       Order.arrBUYSTOP[i]  = "BL_"+(string)i;
       Order.arrSELLSTOP[i]  = "SS_"+(string)i;
     }
   //---
   setSTEP();  
     

    //Print(__FUNCTION__, " ------------------TRADE_STOPS_LEVEL  = ",TRADE_STOPS_LEVEL );
    

    BarReMOVE = iTime(NULL,PERIOD_CURRENT,0);

    setOrderPosiution();
  
    //Инициализация символов ручная инициализация
    if(Symbol1 ==""){
      arrSymbol[0] = _Symbol;           
     }     
    else{
      arrSymbol[0] = Symbol1;   
    }  
   

//    Step.StartStep   = StartStep; // (int)(StepBUYLIMIT/2);
//    Step.AStep       = StepPEND;
//    Step.B1Step      = (int)(StepPEND/( 2 + 2 )); //x2 s/3
//    Step.B2Step      = (int)(StepPEND/( 4 + 2 )); //x4 s/5
//    Step.B3Step      = (int)(StepPEND/( 8 + 2 )); //x8 s/9
//    Step.B4Step      = (int)(StepPEND/( 16 + 2 )); //x16 s/17
//    Step.B5Step      = (int)(StepPEND/( 32 + 2 )); //x32 s/33
//    Step.B6Step      = (int)(StepPEND/( 64 + 2 )); //x64 s/65
//    Step.B7Step      = (int)(StepPEND/( 128 + 2 )); //x128 s/129
//    Step.B8Step      = (int)(StepPEND/( 256 + 2 )); //x256 s/257
//    
//    Lot.LotA         = MinLot;
//    Lot.LotB1        = MinLot*2;
//    Lot.LotB2        = MinLot*4;
//    Lot.LotB3        = MinLot*8;
//    Lot.LotB4        = MinLot*16;
//    Lot.LotB5        = MinLot*32;
//    Lot.LotB6        = MinLot*64;
//    Lot.LotB7        = MinLot*128;
//    Lot.LotB8        = MinLot*256;
//    Lot.LotB9        = MinLot*512;
//    Lot.LotB10        = MinLot*1024;
    
    
    
    //Инициализация Статусов
    //ArrayInitialize(Status,false);
    
    //
   ArrayInitialize(MAX_PRICE_SELLLIMIT,0);
   ArrayInitialize(MIN_PRICE_SELLLIMIT,0);
   
   ArrayInitialize(MAX_PRICE_BUYLIMIT,0);
   ArrayInitialize(MIN_PRICE_BUYLIMIT,0);

   ArrayInitialize(MAX_PRICE_BUYSTOP,0);
   ArrayInitialize(MIN_PRICE_BUYSTOP,0);
   
   ArrayInitialize(MAX_PRICE_SELLSTOP,0); 
   ArrayInitialize(MIN_PRICE_SELLSTOP,0);  
    
    //Инициализация ПО СИМВОЛАМ
   for(int i=0;i<NUMBER_OF_SYMBOLS;i++)
    {
    
    //Инициализация параметров  a_trade    
    a_trade[i].SetExpertMagicNumber(Magic);  
    a_trade[i].SetMarginMode();
    a_trade[i].SetTypeFillingBySymbol( arrSymbol[0]);
    a_trade[i].SetDeviationInPoints(Slippage); 
    
   jSymbol[arrSymbol[i]] = i;
   
   const datetime time =  iTime(arrSymbol[i] , PERIOD_CURRENT,0) ; ; 
   BarOpenBUY[i]       = time ;        
   BarOpenSELL[i]      = time ;
   
   BarOpenBUYSTOP[i]   = time ;
   BarOpenSELLSTOP[i]  = time ;
   BarOpenBUYLIMIT[i]  = time ;
   BarOpenSELLLIMIT[i] = time ;
   

      
   //Инициализация количество ордеров
   //входные значения
//   in_count_BUY[i]        = CountBUY_S1;
//   in_count_SELL[i]       = CountSELL_S1;
//   
//   in_count_BUYSTOP[i]    = CountBUYSTOP_S1;
//   in_count_SELLSTOP[i]   = CountSELLSTOP_S1;
//   in_count_BUYLIMIT[i]   = CountBUYLIMIT_S1;
//   in_count_SELLLIMIT[i]  = CountSELLLIMIT_S1;
   
   //подсчитываемые значения    
   _count_BUY[i]       = 0;
   _count_SELL[i]      = 0;
  
   _count_BUYSTOP[i]   = 0;
   _count_SELLSTOP[i]  = 0;
   _count_BUYLIMIT[i]  = 0;
   _count_SELLLIMIT[i] = 0;
  
   //_count_BUYSTOP_NOPROFIT[i]   = 0;
   //_count_SELLSTOP_NOPROFIT[i]  = 0;
   //_count_BUYLIMIT_NOPROFIT[i]  = 0;
   //_count_SELLLIMIT_NOPROFIT[i] = 0;
   
   _count_BUYSTOP_PROFIT[i]   = 0;
   _count_SELLSTOP_PROFIT[i]  = 0;
   _count_BUYLIMIT_PROFIT[i]  = 0;
   _count_SELLLIMIT_PROFIT[i] = 0;
   
   _count_BUYSTOP_SAFE[i]   = 0;
   _count_SELLSTOP_SAFE[i]  = 0;
   _count_BUYLIMIT_SAFE[i]  = 0;
   _count_SELLLIMIT_SAFE[i] = 0;
   
   _count_BUYSTOP_TRADE[i]   = 0;
   _count_SELLSTOP_TRADE[i]  = 0;
   _count_BUYLIMIT_TRADE[i]  = 0;
   _count_SELLLIMIT_TRADE[i] = 0;
      
   _countTXT_BUY[i]       = 0;
   _countTXT_SELL[i]      = 0;
   _countTXT_BUYSTOP[i]   = 0;
   _countTXT_SELLSTOP[i]  = 0;
   _countTXT_BUYLIMIT[i]  = 0;
   _countTXT_SELLLIMIT[i] = 0;
  
   //Инициализация SL TP 
   //StopLoss[i]   =  StopLoss_S1  ;
   //TakeProfit[i] =  TakeProfit_S1;
   
   //Инициализация разрешений    
   //Trade[i] = Trade_S1;
   
   //Trall[i] = Trall_S1;
   //TrallStep[i] = TrallStep_S1; 
   
   //Инициализация Индикаторов
   //if(TRADE_iMA)
   //h_iMA[i] = ini_iMA(arrSymbol[0],MA_TF,MA_period,MODE_SMA,PRICE_CLOSE, hiddenIndikator );
   //if(h_iMA[i] < 0){
   //   Print(__FUNCTION__, " hMA[0] error =  ", GetLastError() ); 
   //   return(INIT_FAILED);   
   //}  
   
//   h_iMA_low[i] = ini_iMA(arrSymbol[0],MA_TF_LOW,MA_period_low,MODE_SMA,PRICE_CLOSE, hiddenIndikator );
//   if(h_iMA_low[i] < 0){
//      Print(__FUNCTION__, " h_iMA_low[0] error =  ", GetLastError() ); 
//      return(INIT_FAILED);   
//   }  
//   
   
     
   //---
   //if(TRADE_iSTO)
   //h_Sto[i] = ini_iSto(arrSymbol[0],STO_TF,STOKperiod,STODperiod,STOSlowing,MODE_SMA,STO_LOWHIGH, hiddenIndikator );
   //if(h_Sto[i] < 0){
   //   Print(__FUNCTION__, " h_Sto[0] error =  ", GetLastError() ); 
   //   return(INIT_FAILED);
   //  }        
   //---  
   //if(TRADE_iCCI)
   // h_CCI[i] = ini_iCCI(arrSymbol[0],CCI_TF,CCIma_period,PRICE_CLOSE, hiddenIndikator );
   //if(h_CCI[i] < 0){
   //   Print(__FUNCTION__, " h_CCI[0] error =  ", GetLastError() ); 
   //   return(INIT_FAILED);
   //  }        
   } 
   //Инициализация Массивов
   //ArrayInitialize(SignalCloseALL,false);
   ArrayInitialize(SignalCloseBuy,false);
   ArrayInitialize(SignalCloseSell,false);

   ArrayInitialize(SignalCloseAll_TRALL,false);
   ArrayInitialize(SignalCloseBUY_TRALL,false);
   ArrayInitialize(SignalCloseSELL_TRALL,false);
   
   //ArrayInitialize(SignalCloseAll,false);
   ArrayInitialize(SignalCloseBUY_PROFIT,false);
   ArrayInitialize(SignalCloseSELL_PROFIT,false);
   
   ArrayInitialize(SignalCloseUP_MOVE,false);
   ArrayInitialize(SignalCloseDN_MOVE,false);

//bool  SignalCloseAll_TRALL[NUMBER_OF_SYMBOLS] ;
//bool  SignalCloseBUY_TRALL[NUMBER_OF_SYMBOLS] ;
//bool  SignalCloseSELL_TRALL[NUMBER_OF_SYMBOLS] ;
//
//bool  SignalCloseAll_PROFIT[NUMBER_OF_SYMBOLS] ;
//bool  SignalCloseBUY_PROFIT[NUMBER_OF_SYMBOLS] ;
//bool  SignalCloseSELL_PROFIT[NUMBER_OF_SYMBOLS] ;
//
//bool  SignalCloseUP_MOVE[NUMBER_OF_SYMBOLS] ;
//bool  SignalCloseDN_MOVE[NUMBER_OF_SYMBOLS] ;

   ArrayInitialize(SignalCloseBuyStop,false);
   ArrayInitialize(SignalCloseBuyStopScope,false);
  
   ArrayInitialize(SignalCloseSellStop,false);
   ArrayInitialize(SignalCloseSellStopScope,false);
   
   ArrayInitialize(SignalCloseBuyLimit,false);
   ArrayInitialize(SignalCloseBuyLimitScope,false); 
     
   ArrayInitialize(SignalCloseSellLimit,false);
   ArrayInitialize(SignalCloseSellLimitScope,false);
   
   ArrayInitialize(SignalOpenBuy,false);
   ArrayInitialize(SignalOpenSell,false);
   ArrayInitialize(SignalOpenBuyStop,false);
   ArrayInitialize(SignalOpenSellStop,false);
   ArrayInitialize(SignalOpenBuyLimit,false);
   ArrayInitialize(SignalOpenSellLimit,false);
        
   ArrayInitialize(SignalModBuy,false);
   ArrayInitialize(SignalModSell,false);
   ArrayInitialize(SignalModBuyStop,false);
   ArrayInitialize(SignalModSellStop,false);
   ArrayInitialize(SignalModBuyLimit,false);
   ArrayInitialize(SignalModSellLimit,false);   
   
   ArrayInitialize(multBUY,1);
   ArrayInitialize(multSELL,1);
   ArrayInitialize(multBUYSTOP,1);
   ArrayInitialize(multSELLSTOP,1);
   ArrayInitialize(multBUYLIMIT,1);
   ArrayInitialize(multSELLLIMIT,1);
   
   ArrayInitialize(lastTiketBUY,0);
   ArrayInitialize(lastTiketSELL,0);
   ArrayInitialize(lastProfitBUY,0);
   ArrayInitialize(lastProfitSELL,0);
   ArrayInitialize(lastVolumeBUY,0);
   ArrayInitialize(lastVolumeSELL,0);
   ArrayInitialize(lastPriceBUY,0);
   ArrayInitialize(lastPriceSELL,0);
   ArrayInitialize(ProfitSymbol,0);
    
   //Инициализация массива значений индикатора как таймсерия
   //ArraySetAsSeries(arr_iMA,true);
   //ArraySetAsSeries(arr_iMA_low,true);
   //ArraySetAsSeries(arr_iStoMain,true);
   //ArraySetAsSeries(arr_iStoSignal,true);   
   //ArraySetAsSeries(arr_iCCIMain,true);   
   
   //Включена ли проверка на сервере      
   _chekServer = chekServer();   
   Print(__FUNCTION__, " _chekServer =  ", _chekServer );        
   
   Comment("");  
   ObjectsDeleteAll(0);
   
   return(INIT_SUCCEEDED);
   
  }