#include  "..\setting\FilePathMain.mqh" 

int OnInit()
  {    
  
    if(ScopeLevel < StartStep + StepPEND && ScopeLevel !=0 ){
        Alert("ВНИМАНИЕ! ScopeLevel должен болльше > ",StartStep + StepPEND , " или равен 0" );
           return(INIT_FAILED);
      }
    
    if(ReSubStep > ScopeLevel && ScopeLevel !=0 ){
        Alert("ВНИМАНИЕ! ReSubStep должен меньше < ",ScopeLevel  );
           return(INIT_FAILED);
      }
    
      
      
  
    DIGIT               = (int)SymbolInfoInteger(NULL,SYMBOL_DIGITS);
    POINT               = SymbolInfoDouble(NULL,SYMBOL_POINT);
    TRADE_STOPS_LEVEL   = (int)SymbolInfoInteger(NULL,SYMBOL_TRADE_STOPS_LEVEL) ;
    BALANCE_START       = AccountInfoDouble(ACCOUNT_BALANCE );
    
    
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
       Order.arrBUYSTOP[i]  = "BS_"+(string)i;
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
   if(Stochastic_ON)
   h_Sto[i] = ini_iSto(arrSymbol[0],STO_TF,STOKperiod,STODperiod,STOSlowing,MODE_SMA,STO_LOWHIGH, hiddenIndikator );
   if(h_Sto[i] < 0){
      Print(__FUNCTION__, " h_Sto[0] error =  ", GetLastError() ); 
      return(INIT_FAILED);
     }        
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
   
   
   //--- установка флага получения событий создания объектов графика 
   ChartSetInteger(ChartID(),CHART_EVENT_OBJECT_CREATE,true); 
//--- установка флага получения событий удаления объектов графика 
   ChartSetInteger(ChartID(),CHART_EVENT_OBJECT_DELETE,true); 
//--- включение сообщений о прокрутке колесика мышки 
   ChartSetInteger(0,CHART_EVENT_MOUSE_WHEEL,1); 
//--- принудительное обновление свойств графика гарантирует готовность к обработке событий 
   ChartRedraw(); 
   
   //Print(__FUNCTION__, " -----------------------------------------  MQLInfoInteger(MQL_TESTER)  =  ", (bool)MQLInfoInteger(MQL_TESTER) );
   //Print(__FUNCTION__, " -----------------------------------------  MQLInfoInteger(MQL_OPTIMIZATION)  =  ", (bool)MQLInfoInteger(MQL_OPTIMIZATION) );
   
   jZP[ZP_BALANCE_START]               = AccountInfoDouble(ACCOUNT_BALANCE);
   jZP[ZP_DATETIME_START]              = (int)TimeLocal();

  //SetStringFile(file_BALANCE_START,(string)(BALANCE_START),false);
   
   jZP[ZP_TODAY][NAME_KEY]             = ZP_TODAY ;
   jZP[ZP_TODAY][NAME_VAL]             = ZP_PROFIT_TODAY ;
   jZP[ZP_TODAY][TEXT]                 = ZP_TEXT_TODAY ;
   jZP[ZP_TODAY][VAL]                  = 0 ;
   jZP[ZP_TODAY][DATE]                 = (int)iTime(NULL,PERIOD_D1,0) ;
   jZP[ZP_TODAY][FILE]                 = dir + "\\" + ZP_TODAY + ".txt";   
      
   jZP[ZP_YESTERDAY][NAME_KEY]         = ZP_YESTERDAY ;
   jZP[ZP_YESTERDAY][NAME_VAL]         = ZP_PROFIT_YESTERDAY ;
   jZP[ZP_YESTERDAY][TEXT]             = ZP_TEXT_YESTERDAY ;
   jZP[ZP_YESTERDAY][VAL]              = 0 ;
   jZP[ZP_YESTERDAY][DATE]             = (int)iTime(NULL,PERIOD_D1,1) ;
   jZP[ZP_YESTERDAY][FILE]             = dir + "\\" + ZP_YESTERDAY + ".txt"; 
   
   jZP[ZP_CURRENT_WEEK][NAME_KEY]      = ZP_CURRENT_WEEK ;
   jZP[ZP_CURRENT_WEEK][NAME_VAL]      = ZP_PROFIT_CURRENT_WEEK ;   
   jZP[ZP_CURRENT_WEEK][TEXT]          = ZP_TEXT_CURRENT_WEEK ;
   jZP[ZP_CURRENT_WEEK][VAL]           = 0 ;
   jZP[ZP_CURRENT_WEEK][DATE]          = (int)iTime(NULL,PERIOD_W1,0) ;
   jZP[ZP_CURRENT_WEEK][FILE]          = dir + "\\" + ZP_CURRENT_WEEK + ".txt"; 
   
   jZP[ZP_LAST_WEEK][NAME_KEY]         = ZP_LAST_WEEK ;
   jZP[ZP_LAST_WEEK][NAME_VAL]         = ZP_PROFIT_LAST_WEEK ;   
   jZP[ZP_LAST_WEEK][TEXT]             = ZP_TEXT_LAST_WEEK ;
   jZP[ZP_LAST_WEEK][VAL]              = 0 ;
   jZP[ZP_LAST_WEEK][DATE]             = (int)iTime(NULL,PERIOD_W1,1) ;
   jZP[ZP_LAST_WEEK][FILE]             = dir + "\\" + ZP_LAST_WEEK + ".txt"; 
   
   jZP[ZP_CURRENT_MONTH][NAME_KEY]     = ZP_CURRENT_MONTH ;
   jZP[ZP_CURRENT_MONTH][NAME_VAL]     = ZP_PROFIT_CURRENT_MONTH ;   
   jZP[ZP_CURRENT_MONTH][TEXT]         = ZP_TEXT_CURRENT_MONTH ;
   jZP[ZP_CURRENT_MONTH][VAL]          = 0 ;
   jZP[ZP_CURRENT_MONTH][DATE]         = (int)iTime(NULL,PERIOD_MN1,0) ;
   jZP[ZP_CURRENT_MONTH][FILE]         = dir + "\\" + ZP_CURRENT_MONTH + ".txt"; 
   
   jZP[ZP_LAST_MONTH][NAME_KEY]        = ZP_LAST_MONTH ;
   jZP[ZP_LAST_MONTH][NAME_VAL]        = ZP_PROFIT_LAST_MONTH ;
   jZP[ZP_LAST_MONTH][TEXT]            = ZP_TEXT_LAST_MONTH ;
   jZP[ZP_LAST_MONTH][VAL]             = 0 ;
   jZP[ZP_LAST_MONTH][DATE]            = (int)iTime(NULL,PERIOD_MN1,1) ;
   jZP[ZP_LAST_MONTH][FILE]            = dir + "\\" + ZP_LAST_MONTH + ".txt"; 
   
   jZP[ZP_ENTIRE_PERIOD][NAME_KEY]     = ZP_ENTIRE_PERIOD ;
   jZP[ZP_ENTIRE_PERIOD][NAME_VAL]     = ZP_PROFIT_ENTIRE_PERIOD ;   
   jZP[ZP_ENTIRE_PERIOD][TEXT]         = ZP_TEXT_ENTIRE_PERIOD ;
   jZP[ZP_ENTIRE_PERIOD][VAL]          = 0 ;
   jZP[ZP_ENTIRE_PERIOD][DATE]         = 0 ;
   jZP[ZP_ENTIRE_PERIOD][FILE]         = dir + "\\" + ZP_ENTIRE_PERIOD + ".txt"; 
    
   jZP[ZP_COMMISION][NAME_KEY]         = ZP_COMMISION ;
   jZP[ZP_COMMISION][NAME_VAL]         = ZP_VAL_COMMISION ; 
   jZP[ZP_COMMISION][TEXT]             = ZP_TEXT_COMMISION;  
   jZP[ZP_COMMISION][VAL]              = 0 ;
   
   jZP[ZP_SWAP][NAME_KEY]              = ZP_SWAP ;
   jZP[ZP_SWAP][NAME_VAL]              = ZP_VAL_SWAP ; 
   jZP[ZP_SWAP][TEXT]                  = ZP_TEXT_SWAP;  
   jZP[ZP_SWAP][VAL]                   = 0 ;
     
   jFN[(FN_KEY_BALANCE)][NAME_KEY]     =   FN_KEY_BALANCE;
   jFN[(FN_KEY_BALANCE)][NAME_VAL]     =   FN_VAL_BALANCE;
   jFN[(FN_KEY_BALANCE)][TEXT]         =   FN_TEXT_BALANCE;
   jFN[(FN_KEY_BALANCE)][VAL]          =   0;
   
   jFN[(FN_KEY_EQITY)][NAME_KEY]       =   FN_KEY_EQITY;
   jFN[(FN_KEY_EQITY)][NAME_VAL]       =   FN_VAL_EQITY;
   jFN[(FN_KEY_EQITY)][TEXT]           =   FN_TEXT_EQITY;
   jFN[(FN_KEY_EQITY)][VAL]            =   0;
   
   jFN[(FN_KEY_MARGINFREE)][NAME_KEY]  =   FN_KEY_MARGINFREE;
   jFN[(FN_KEY_MARGINFREE)][NAME_VAL]  =   FN_VAL_MARGINFREE;
   jFN[(FN_KEY_MARGINFREE)][TEXT]      =   FN_TEXT_MARGINFREE;
   jFN[(FN_KEY_MARGINFREE)][VAL]       =   0;
   
   jFN[(FN_KEY_PROFIT)][NAME_KEY]      =   FN_KEY_PROFIT;
   jFN[(FN_KEY_PROFIT)][NAME_VAL]      =   FN_VAL_PROFIT;
   jFN[(FN_KEY_PROFIT)][TEXT]          =   FN_TEXT_PROFIT;
   jFN[(FN_KEY_PROFIT)][VAL]           =   0;
  
 
   jFN[(FN_KEY_PROFIT_DN)][NAME_KEY]  =   FN_KEY_PROFIT_DN;
   jFN[(FN_KEY_PROFIT_DN)][NAME_VAL]  =   FN_VAL_PROFIT_DN;
   jFN[(FN_KEY_PROFIT_DN)][TEXT]      =   FN_TEXT_PROFIT_DN;
   jFN[(FN_KEY_PROFIT_DN)][VAL]       =   0;
  
 
   jFN[(FN_KEY_PROFIT_UP)][NAME_KEY]  =   FN_KEY_PROFIT_UP;
   jFN[(FN_KEY_PROFIT_UP)][NAME_VAL]  =   FN_VAL_PROFIT_UP;
   jFN[(FN_KEY_PROFIT_UP)][TEXT]      =   FN_TEXT_PROFIT_UP;
   jFN[(FN_KEY_PROFIT_UP)][VAL]       =   0;
   
     
   //SetStartParams();
   
    //if(! _chekServer ){
   ShowPanel(true);
   


  
  
  // если файл не существует         
   if( !FileIsExist(file_MAGIC) ){
      Print(__FUNCTION__, " ----------------------------------------- NO file_MAGIC  =  ", file_MAGIC  );
      Print(__FUNCTION__, " ----------------------------------------- FolderCreate(dir) =  ",  FolderCreate(dir) );
       FolderCreate(dir) ;
       SetStringFile(file_MAGIC,(string)(Magic),false);
       SetZP_IntoFile ();    
   }
   // если файл существует
   else if(GetStringFile(file_MAGIC) != (string)Magic  ){  


            //SetStartParams();       
            //SetParamsTntoFile();
            SetStringFile(file_MAGIC,(string)(Magic),false);
            SetZP_IntoFile ();
         
   }else {      
     //GetParamsFromFile(); 
     Print(__FUNCTION__, " ----------------------------------------- file_MAGIC  =  ", file_MAGIC  );
     Print(__FUNCTION__, " ----------------------------------------- GetStringFile(file_MAGIC)  =  ", GetStringFile(file_MAGIC)  ); 
     SetZP_FromFile();                         
   }
   
   
   ShowZP_Trade();
   
      //}
      
   EventSetTimer(1);
   
   return(INIT_SUCCEEDED);
   
  }