#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetPARAMETRS_START(string type){
 
 if(type == NAME_ALL){
 
      for(int i=0;i<NUMBER_OF_KNEES;i++)     {
       jBUYLIMIT[Order.arrBUYLIMIT[i]][NAME_STATUS] = NAME_STATUS_PEND ;
       jSELLLIMIT[Order.arrSELLLIMIT[i]][NAME_STATUS] = NAME_STATUS_PEND ;
      }       
      
        BALANCE_START  = AccountInfoDouble(ACCOUNT_BALANCE);
        EQITY          = AccountInfoDouble(ACCOUNT_EQUITY);
         
         TRADE          = false;
         
         TRADE_MAIN_UP  = false;
         TRADE_MAIN_DN  = false;
         TRADE_SUB_UP   = false;
         TRADE_SUB_DN   = false;    
      
      PriceMAX_UP = 0;
      PriceMIN_UP = 0;    
      PriceMAX_DN = 0;
      PriceMIN_DN = 0;   
      
      //      TRALL_UP = 0;
      //      TRALL_DN = 0;    
      //      
      //      STOPLOSS_UP = 0;
      //      STOPLOSS_DN = 0;   
      //      
      //      PRICE_TRALL_NULL= 0;
      //      PRICE_TRALL_OPEN= 0;
      //      PRICE_TRALL_FULL= 0;   
      //      
      //      DT_NULL_OPEN= 0;
      //      DT_OPEN_FULL= 0;   
      //      
      //      TRALL_FULL = TRALL ;
   }
    //---
 else if(type == NAME_MOVE_UP){   
      //BarReMOVE = iTime(NULL,PERIOD_CURRENT,0); 
   jSELLLIMIT[NAME_SL_0][NAME_STATUS] = NAME_STATUS_PEND;
   STOPLOSS_SL    = 0;
   STOPLOSS_BS    = 0;
   TRALL_FULL_SL  = Trall_SL;
   TRALL_FULL_BS  = Trall_BS;
   PriceMAX_UP    = 0;
   PriceMIN_UP    = 0;
   TRADE_MAIN_UP  = false;
   TRADE_SUB_UP   = false;

   
  }
 else if(type == NAME_MOVE_DN){
   jBUYLIMIT[NAME_BL_0][NAME_STATUS] = NAME_STATUS_PEND;
   STOPLOSS_BL    = 0;
   STOPLOSS_SS    = 0;   
   TRALL_FULL_BL  = Trall_BL; 
   TRALL_FULL_SS  = Trall_SS;    
   PriceMAX_DN    = 0;
   PriceMIN_DN    = 0;
   TRADE_MAIN_DN  = false; 
   TRADE_SUB_DN   = false;
  } 
 //---
 else if(type == NAME_SELLLIMIT){
   jSELLLIMIT[NAME_SL_0][NAME_STATUS] = NAME_STATUS_PEND;
   STOPLOSS_SL    = 0;
   TRALL_FULL_SL  = Trall_SL;
   PriceMAX_UP    = 0;
   PriceMIN_UP    = 0;
   TRADE_MAIN_UP  = false;
   TRADE_SUB_UP   = false;  
  }
 //---
 else if(type == NAME_BUYSTOP){
   STOPLOSS_BS    = 0;
   TRALL_FULL_BS  = Trall_BS;  
   PriceMAX_UP    = 0;
  }
 //---
 else if(type == NAME_BUYLIMIT){
   jBUYLIMIT[NAME_BL_0][NAME_STATUS] = NAME_STATUS_PEND;
   STOPLOSS_BL    = 0;
   TRALL_FULL_BL  = Trall_BL; 
   PriceMAX_DN    = 0;
   PriceMIN_DN    = 0;
   TRADE_MAIN_DN  = false; 
   TRADE_SUB_DN   = false;
 }
 //---
 else if(type == NAME_SELLSTOP){   
     STOPLOSS_SS    = 0;
     TRALL_FULL_SS  = Trall_SS;    
     PriceMIN_DN    = 0; 
  }  
 //---
 if(GetCountAllTotalByMagic() == 0 ){ 
         BALANCE_START  = AccountInfoDouble(ACCOUNT_BALANCE);
         EQITY          = AccountInfoDouble(ACCOUNT_EQUITY);
         TRADE          = false;
         TRADE_MAIN_UP  = false;
         TRADE_MAIN_DN  = false;
         TRADE_SUB_UP   = false;
         TRADE_SUB_DN   = false;     
 }   
  BarReMOVE      = iTime(NULL,PERIOD_CURRENT,0);
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void setOrderPosiution(){

 double _K_MainLot          = K_MainLot > 0 ? K_MainLot: 1; 
    int _K_SubLot           = K_SubLot > 0? K_SubLot : 1; 
    double minLot           = MinLot ;


 for(int i=0; i< NUMBER_OF_KNEES; i++ ){
    //Print(__FUNCTION__, " >>>>>>>>>>>>>>>",i,">>>>>>>>>>>>>>>>>>>>>>>>>>= " );   
   //+------------------------------------------------------------------+
   //|               UP (SELLIMIT)                                     |
   //+------------------------------------------------------------------+  
     setSELLLIMIT( i ,  minLot , _K_MainLot ,   _K_SubLot  ) ;
   //+------------------------------------------------------------------+
   //|                DN (BUYLIMIT)                                     |
   //+------------------------------------------------------------------+  
     setBUYLIMIT( i ,  minLot , _K_MainLot ,   _K_SubLot  ) ;

       //Print( jSELLLIMIT.Serialize() );  
       //Print( jBUYLIMIT.Serialize() );  
       
   }  
    

    
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void setSELLLIMIT( int  id, double minLot , double _K_MainLot , int  _K_SubLot ){
    CJAVal jdata;
    CJAVal jstop;
    
    int substep               = arrSubStep[id];
    int mainstep              = arrMainStep[id];
    int _fullStep             = arrFullStep[id];
    double MainLot            = minLot* arrMain_MULT[id];
    double SubLot             = minLot*arrSub_MULT[id]*_K_SubLot;
    string nameSELLLIMIT      = Order.arrSELLLIMIT[id];
    string mainCOMMENT        = nameSELLLIMIT;    
    int start =0 ;
    int stop  =0 ;
    //---
    jdata[NAME_ID]            = id;
    jdata[NAME_LOT]           = MainLot;
    jdata[NAME_MAIN_STEP]     = mainstep;
    jdata[NAME_FULL_STEP]     = _fullStep ;  
    jdata[NAME_PRICE_OPEN]    = 0;
    jdata[NAME_TAKEPROFIT]    = 0;
    jdata[NAME_TICKET]        = -1;
    jdata[NAME_STATUS]        = NAME_STATUS_PEND;    
    jdata[NAME_TRADE]         = false;  
    jdata[NAME_COMMENT]       = mainCOMMENT; 
int const kstart = arrStartStop[id][0];
int const kstop  = arrStartStop[id][1];
    
    
   if(id != 0){
    for(int i=kstart;i<kstop;i++) {     
       _fullStep              +=substep; 
       string nameBUYSTOP     = Order.arrBUYSTOP[i];
       string SubCOMMENT      = nameSELLLIMIT + "#"+  nameBUYSTOP;

       jstop[NAME_LOT]        = SubLot;//minLot*kLot;
       jstop[NAME_SUB_STEP]   = substep;
       jstop[NAME_FULL_STEP]  = _fullStep ;
       jstop[NAME_PRICE_OPEN] = 0;
       jstop[NAME_TAKEPROFIT] = 0;
       jstop[NAME_TICKET]     = -1;        
       jstop[NAME_TRADE]      = false;
       jstop[NAME_COMMENT]    = SubCOMMENT;       
       jdata[nameBUYSTOP].Set(jstop);     
       jSELLLIMIT[nameSELLLIMIT].Set(jdata)  ;      
    };    
  }else{
      jSELLLIMIT[nameSELLLIMIT].Set(jdata)  ;      
  }
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void setBUYLIMIT( int  id, double minLot , double _K_MainLot , int  _K_SubLot ){
    CJAVal jdata;
    CJAVal jstop;
    
    int substep               = arrSubStep[id];// (int)(mainstep/k);
    int mainstep              = arrMainStep[id];
    int _fullStep             = arrFullStep[id];
    double MainLot            = minLot* arrMain_MULT[id];//*_K_MainLot;   
    double SubLot             = minLot*arrSub_MULT[id]*_K_SubLot;
    string const nameBUYLIMIT = Order.arrBUYLIMIT[id];    
    string mainCOMMENT        = nameBUYLIMIT;  
    //---
    jdata[NAME_ID]            = id;
    jdata[NAME_LOT]           = MainLot;
    jdata[NAME_MAIN_STEP]     = mainstep;
    jdata[NAME_FULL_STEP]     = _fullStep ;  
    jdata[NAME_PRICE_OPEN]    = 0;
    jdata[NAME_TAKEPROFIT]    = 0;
    jdata[NAME_TICKET]        = -1;
    jdata[NAME_STATUS]        = NAME_STATUS_PEND;    
    jdata[NAME_TRADE]         = false;  
    jdata[NAME_COMMENT]       = mainCOMMENT; 

int const kstart = arrStartStop[id][0];
int const kstop  = arrStartStop[id][1];
    
   if(id != 0){
    for(int i=kstart;i<kstop;i++) {     
       _fullStep               +=substep; 
       string nameSELLSTOP    =  Order.arrSELLSTOP[i];
       string SubCOMMENT      = nameBUYLIMIT + "#"+  nameSELLSTOP;      

       jstop[NAME_LOT]        = SubLot;//minLot*kLot;
       jstop[NAME_SUB_STEP]   = substep;
       jstop[NAME_FULL_STEP]  = _fullStep ;
       jstop[NAME_PRICE_OPEN] = 0;
       jstop[NAME_TAKEPROFIT] = 0;
       jstop[NAME_TICKET]     = -1;        
       jstop[NAME_TRADE]      = false;
       jstop[NAME_COMMENT]    = SubCOMMENT;      
       jdata[nameSELLSTOP].Set(jstop);     
       jBUYLIMIT[nameBUYLIMIT].Set(jdata)  ;      
    };    
  }else{
        jBUYLIMIT[nameBUYLIMIT].Set(jdata)  ;      
  }
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void setSTEP(){

int substep;
int mainstep;
int part;
int spred = (int)SymbolInfoInteger(NULL,SYMBOL_SPREAD);
TRADE_STOPS_LEVEL =  TRADE_STOPS_LEVEL < spred*2? spred*2 : TRADE_STOPS_LEVEL;

/*
int arrMain_MULT[NUMBER_OF_KNEES] = {1,2,4,8,16,32,64,128,256,512,1024,2048} ;
int arrSub_MULT [NUMBER_OF_KNEES] = {0,1,2,3,4 ,7 ,9 ,11 ,13 ,15,19,21};

int arrFullStep[NUMBER_OF_KNEES];
int arrSubStep [NUMBER_OF_KNEES];
*/

for(int i=0; i<NUMBER_OF_KNEES; i++ ){
   if(i==0) arrCountSubKNEE[i] = 0;
   else if(i==1) arrCountSubKNEE[i] = 2;
   else  arrCountSubKNEE[i] = i*2 -1;
}
//---
 for(int i=0;i<NUMBER_OF_KNEES;i++){
    if(i == 0) {
        arrFullStep[i] = StartStep>0? StartStep: 20;
        arrSubStep [i] = 0;
        arrMainStep[i] = StepPEND;           
   }else {
       part           = arrCountSubKNEE[i]+1;
       substep  =  (int)(StepPEND /part ) < TRADE_STOPS_LEVEL+(i*2*KSubStep)  ? TRADE_STOPS_LEVEL+(i*2*KSubStep) : (int)(StepPEND / part ) ;
       mainstep =  substep * part ;//<= StepPEND ? StepPEND :  substep* part ;  

       arrMainStep[i] = mainstep;
       arrFullStep[i] = arrFullStep[i-1] + arrMainStep[i-1]  ;
       arrSubStep [i] = substep ;
    }
  }
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetVECTOR(){
   
   if ( GetPipsProfit() > 0  && GetVolume() > 0) VECTOR = 1;
   else if ( GetPipsProfit() > 0  && GetVolume() < 0) VECTOR = -1;
        else                       VECTOR = -1;
   
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//void SetTRALL_STOPLLOSS(){
//  double const ASK   = SymbolInfoDouble(NULL,SYMBOL_ASK);
//  double const BID   = SymbolInfoDouble(NULL,SYMBOL_BID);  
//     int const SPRED = (int)SymbolInfoInteger(NULL,SYMBOL_SPREAD);  
//  double const dSPRED =   SPRED*POINT; 
//
// /*
//   double TRALL_UP;
//   double TRALL_DN;
//
//   int    PROFIT_TRALL;
//   double PRICE_PROFIT_NULL;
//
//   double STOPLOSS_UP;
//   double STOPLOSS_DN;
//*/
//
////   if( GetPipsProfit() > PROFIT_TRALL ) {
////      
////   }
//
//}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void setXY_Label(){
   int xLabel     = 5;
   int yLabel     = 5;
   int dtyLabel   = 15;
   int dtxLabel   = 80;
   int dtx1 = 2;
   int dtx2 = 4;
   int dtx3 = 8;
 //---
 for(int str=0;str<NUMBER_STR;str++)
     {     
     for(int pos=0;pos<4;pos++)
       {
          arrNameObject[str][pos] =  (string)(str) + (string)(pos) + (string)(Magic)  ;               
       }      
     } 

 //---
 for(int pos=0;pos< NUMBER_COL; pos++ ) {   
    for(int str=0;str< NUMBER_STR ; str++)  {       
      arrXLabel[str][pos] =  xLabel +  dtxLabel * pos ; 
      if(str == 0) arrYLabel[str] =  yLabel ;
          else
               {
                arrYLabel[str] =  arrYLabel[str - 1 ] +   dtyLabel;
                
//                if(str == 5)  arrYLabel[str] =  arrYLabel[str] - 5;                   
//                if(str == 6)  arrYLabel[str] =  arrYLabel[str] - 5;                   
//                
//                if(str == 10) arrYLabel[str] =  arrYLabel[str] - 5;                   
//                if(str == 11) arrYLabel[str] =  arrYLabel[str] - 5;  
//               
//                if(str == 15) arrYLabel[str] =  arrYLabel[str] - 5;  
//                if(str == 16) arrYLabel[str] =  arrYLabel[str] - 5;  
//
//                if(str == 20) arrYLabel[str] =  arrYLabel[str] - 5;  
//                if(str == 21) arrYLabel[str] =  arrYLabel[str] - 5;  
                
               }   
          }    
     }

}

 
 //+------------------------------------------------------------------+
 //|                                                                  |
 //+------------------------------------------------------------------+
 void SetHLine_Scope(){
 
  if(PRICE_ScopeLevel_UP_ASK != 0){
     H_line("Scope_ASK_UP",PRICE_ScopeLevel_UP_ASK,clrDarkOrchid,STYLE_SOLID,2);
   }else
      {
       ObjectDelete(0,"Scope_ASK_UP");
      }

  if(PRICE_ScopeLevel_UP_BID != 0){
      H_line("Scope_BID_UP",PRICE_ScopeLevel_UP_BID,clrGold,STYLE_SOLID,2);
   }else
      {
       ObjectDelete(0,"Scope_BID_UP");
      }
      
 
 if(PRICE_ScopeLevel_DN_ASK != 0){
     H_line("Scope_ASK_DN",PRICE_ScopeLevel_DN_ASK,clrGold,STYLE_SOLID,2);
   }else
      {
       ObjectDelete(0,"Scope_ASK_DN");
      }

  if(PRICE_ScopeLevel_DN_BID != 0){
      H_line("Scope_BID_DN",PRICE_ScopeLevel_DN_BID,clrDarkOrchid,STYLE_SOLID,2);
   }else
      {
       ObjectDelete(0,"Scope_BID_DN");
      }
 
 }
 //+------------------------------------------------------------------+
 //|                                                                  |
 //+------------------------------------------------------------------+
  void  SetTRADE_CLOSE(){
   
   //Print(__FUNCTION__, " =========================== SetTRADE_CLOSE   ==============================") ;
   
     if( GetCountAllTotalByMagic() == 0){
         BALANCE_START  = AccountInfoDouble(ACCOUNT_BALANCE);
         EQITY          = AccountInfoDouble(ACCOUNT_EQUITY);
         TRADE          = false;
         TRADE_MAIN_UP  = false;
         TRADE_MAIN_DN  = false;
         TRADE_SUB_UP   = false;
         TRADE_SUB_DN   = false;
     }
 }
 //+------------------------------------------------------------------+
 //|                                                                  |
 //+------------------------------------------------------------------+
 void  SetTRADE_OPEN(){
   
   //Print(__FUNCTION__, " =========================== SetTRADE_OPEN   ==============================") ;
   //Print(__FUNCTION__, " ========== TRADE = ", TRADE) ;
   //Print(__FUNCTION__, " ========== GetCountPositionByType(POSITION_TYPE_SELL) = ", GetCountPositionByType(POSITION_TYPE_SELL)) ;
   //Print(__FUNCTION__, " ========== TRADE = ", TRADE) ;
   //Print(__FUNCTION__, " ========== TRADE = ", TRADE) ;
   //Print(__FUNCTION__, " ========== TRADE = ", TRADE) ;   
   
   int const count_SELL_LIMIT = GetCountPendByType(ORDER_TYPE_SELL_LIMIT);
   int const count_BUY_LIMIT  = GetCountPendByType(ORDER_TYPE_BUY_LIMIT);
   int const count_SELL_STOP  = GetCountPendByType(ORDER_TYPE_SELL_STOP);
   int const count_BUY_STOP   = GetCountPendByType(ORDER_TYPE_BUY_STOP);
   int const count_full       = count_SELL_LIMIT + count_BUY_LIMIT + count_SELL_STOP +  count_BUY_STOP ;
   
   if(!TRADE  && count_full != 0){
          TRADE  = true;
   }
    
   if(MAIN_ON){
        //--- UP 
        if ( count_SELL_LIMIT !=0)  TRADE_MAIN_UP = true;           
        //--- DN
        if ( count_BUY_LIMIT !=0 ) TRADE_MAIN_DN = true;    
     }
   if(SUB_ON){
        //--- UP 
        if ( count_BUY_STOP !=0  ) TRADE_SUB_UP = true;           
        
        //--- DN
        if ( count_SELL_STOP !=0 )  TRADE_SUB_DN = true;   
      }
//      
// Print(__FUNCTION__, " =========================== SetTRADE_OPEN   ==============================") ;
//   Print(__FUNCTION__, " ========== count_SELL_LIMIT = ", count_SELL_LIMIT) ;
//   Print(__FUNCTION__, " ========== count_BUY_LIMIT = ", count_BUY_LIMIT ) ;
//   Print(__FUNCTION__, " ========== count_BUY_STOP = ",count_BUY_STOP) ;
//   Print(__FUNCTION__, " ========== count_SELL_STOP = ", count_SELL_STOP) ;
//    Print(__FUNCTION__, " ---------------") ;
//   Print(__FUNCTION__, " ========== TRADE_MAIN_UP = ", TRADE_MAIN_UP) ; 
//   Print(__FUNCTION__, " ========== TRADE_MAIN_DN = ", TRADE_MAIN_DN) ; 
//   Print(__FUNCTION__, " ========== TRADE_SUB_UP = ", TRADE_SUB_UP) ; 
//   Print(__FUNCTION__, " ========== TRADE_SUB_DN = ", TRADE_SUB_DN) ; 
         
      
 }
 
 //+------------------------------------------------------------------+
 //|                                                                  |
 //+------------------------------------------------------------------+
void setPRICE_BL(double BID){

  for(int i=0;i<NUMBER_OF_KNEES;i++){
      string const MainName_BL  = Order.arrBUYLIMIT[i];
  //+------------------------------------------------------------------+
  //|                    BUYLIMIT                                      |
  //+------------------------------------------------------------------+
    int const nextFullStep_BL             = (int)jBUYLIMIT[MainName_BL][NAME_FULL_STEP].ToInt();
 double const nextPrice_BL                = BID - nextFullStep_BL * POINT ;    
 jBUYLIMIT[MainName_BL][NAME_PRICE_OPEN]  = nextPrice_BL;  
        
 int const kstart = arrStartStop[i][0];
 int const kstop  = arrStartStop[i][1];  
    
   for(int k=kstart;k<kstop;k++){     
      //+------------------------------------------------------------------+
      //|                   SELLSTOP                                               |
      //+------------------------------------------------------------------+
      string const SubName_SS       = Order.arrSELLSTOP[k];
      string const fullName_SS      = MainName_BL + "#" + SubName_SS;     
         int const nextFullStep_SS  = (int)jBUYLIMIT[MainName_BL][SubName_SS][NAME_FULL_STEP].ToInt();     
         int const nextSubStep_SS   = (int)jBUYLIMIT[MainName_BL][SubName_SS][NAME_SUB_STEP].ToInt();   
         int const spred            = (int)SymbolInfoInteger(NULL,SYMBOL_SPREAD);
      double const nextPrice_SS     = BID - nextFullStep_SS * POINT ;  
      double const nextTP_SS        = nextPrice_SS -  (TakeProfit_SS !=0? TakeProfit_SS: nextSubStep_SS ) * POINT ;          
      jBUYLIMIT[MainName_BL][SubName_SS][NAME_PRICE_OPEN]  = nextPrice_SS;    
      jBUYLIMIT[MainName_BL][SubName_SS][NAME_TAKEPROFIT]  = nextTP_SS; 
     }   
   }
}
 
 //+------------------------------------------------------------------+
 //|                                                                  |
 //+------------------------------------------------------------------+
void setPRICE_SL(double ASK){

  for(int i=0;i<NUMBER_OF_KNEES;i++){
      string const MainName_SL  = Order.arrSELLLIMIT[i];  
  //+------------------------------------------------------------------+
  //|                    SELLIMIT                                      |
  //+------------------------------------------------------------------+
    int const nextFullStep_SL             = (int)jSELLLIMIT[MainName_SL][NAME_FULL_STEP].ToInt();
 double const nextPrice_SL                = ASK + nextFullStep_SL*POINT ;    
 jSELLLIMIT[MainName_SL][NAME_PRICE_OPEN] = nextPrice_SL; 
        
 int const kstart = arrStartStop[i][0];
 int const kstop  = arrStartStop[i][1];  
    
   for(int k=kstart;k<kstop;k++){    
     //+------------------------------------------------------------------+
     //|                   BUYSTOP                                               |
     //+------------------------------------------------------------------+
     string const SubName_BS        = Order.arrBUYSTOP[k];
     string const fullName_BS       = MainName_SL + "#" + SubName_BS;
        int const nextFullStep_BS   = (int)jSELLLIMIT[MainName_SL][SubName_BS][NAME_FULL_STEP].ToInt(); 
        int const nextSubStep_BS    = (int)jSELLLIMIT[MainName_SL][SubName_BS][NAME_SUB_STEP].ToInt();
     double const nextPrice_BS      = ASK + nextFullStep_BS * POINT;  
     double const nextTP_BS         = nextPrice_BS +  (TakeProfit_BS !=0? TakeProfit_BS: nextSubStep_BS ) * POINT ;
     jSELLLIMIT[MainName_SL][SubName_BS][NAME_PRICE_OPEN] = nextPrice_BS;    
     jSELLLIMIT[MainName_SL][SubName_BS][NAME_TAKEPROFIT] = nextTP_BS;  
     }   
   }
}
 
 //+------------------------------------------------------------------+
 //|                                                                  |
 //+------------------------------------------------------------------+
void setPRICE(double ASK, double BID){

   //Print(__FUNCTION__, " =========================== setPRICE   ==============================") ;
   //Print(__FUNCTION__, " ========== ASK = ", ASK) ;
   //Print(__FUNCTION__, " ========== BID = ", BID) ;
   

  for(int i=0;i<NUMBER_OF_KNEES;i++){
      string const MainName_BL  = Order.arrBUYLIMIT[i];
      string const MainName_SL  = Order.arrSELLLIMIT[i];  
  //+------------------------------------------------------------------+
  //|                    SELLIMIT                                      |
  //+------------------------------------------------------------------+
    int const nextFullStep_SL             = (int)jSELLLIMIT[MainName_SL][NAME_FULL_STEP].ToInt();
 double const nextPrice_SL                = ASK + nextFullStep_SL*POINT ;    
 jSELLLIMIT[MainName_SL][NAME_PRICE_OPEN] = nextPrice_SL; 
   //+------------------------------------------------------------------+
  //|                    BUYLIMIT                                      |
  //+------------------------------------------------------------------+
    int const nextFullStep_BL             = (int)jBUYLIMIT[MainName_BL][NAME_FULL_STEP].ToInt();
 double const nextPrice_BL                = BID - nextFullStep_BL * POINT ;    
 jBUYLIMIT[MainName_BL][NAME_PRICE_OPEN]  = nextPrice_BL;  
        
 int const kstart = arrStartStop[i][0];
 int const kstop  = arrStartStop[i][1];  
    
   for(int k=kstart;k<kstop;k++){    
      //+------------------------------------------------------------------+
      //|                   SELLSTOP                                               |
      //+------------------------------------------------------------------+
      string const SubName_SS       = Order.arrSELLSTOP[k];
      string const fullName_SS      = MainName_BL + "#" + SubName_SS;     
         int const nextFullStep_SS  = (int)jBUYLIMIT[MainName_BL][SubName_SS][NAME_FULL_STEP].ToInt();     
         int const nextSubStep_SS   = (int)jBUYLIMIT[MainName_BL][SubName_SS][NAME_SUB_STEP].ToInt();   
         int const spred            = (int)SymbolInfoInteger(NULL,SYMBOL_SPREAD);
      double const nextPrice_SS     = BID - nextFullStep_SS * POINT ;  
      double const nextTP_SS        = nextPrice_SS -  nextSubStep_SS * POINT ;          
      jBUYLIMIT[MainName_BL][SubName_SS][NAME_PRICE_OPEN]  = nextPrice_SS;    
      jBUYLIMIT[MainName_BL][SubName_SS][NAME_TAKEPROFIT]  = nextTP_SS; 
     //+------------------------------------------------------------------+
     //|                   BUYSTOP                                               |
     //+------------------------------------------------------------------+
     string const SubName_BS        = Order.arrBUYSTOP[k];
     string const fullName_BS       = MainName_SL + "#" + SubName_BS;
        int const nextFullStep_BS   = (int)jSELLLIMIT[MainName_SL][SubName_BS][NAME_FULL_STEP].ToInt(); 
        int const nextSubStep_BS    = (int)jSELLLIMIT[MainName_SL][SubName_BS][NAME_SUB_STEP].ToInt();
     double const nextPrice_BS      = ASK + nextFullStep_BS * POINT;  
     double const nextTP_BS         = nextPrice_BS +  nextSubStep_BS * POINT ;
     jSELLLIMIT[MainName_SL][SubName_BS][NAME_PRICE_OPEN] = nextPrice_BS;    
     jSELLLIMIT[MainName_SL][SubName_BS][NAME_TAKEPROFIT] = nextTP_BS;  
     }   
   }
}
//+------------------------------------------------------------------+
//|                                                                   |
//+------------------------------------------------------------------+
void SetTicket_BUYLIMIT_CLOSE (double price){
  Ticket_BUYLIMIT_CLOSE = -1;
      for(int i=0;i< OrdersTotal() ;i++){
       if((OrderGetTicket(i)) > 0) {
         if( OrderGetInteger(ORDER_MAGIC) == Magic)
          if( OrderGetInteger(ORDER_TYPE) == ORDER_TYPE_BUY_LIMIT)         
            if( OrderGetDouble(ORDER_PRICE_OPEN) < price) {       
              Ticket_BUYLIMIT_CLOSE =  (int)OrderGetInteger(ORDER_TICKET);
              break;
           }
        }
     }    
}
//+------------------------------------------------------------------+
//|                                                                   |
//+------------------------------------------------------------------+
void SetTicket_SELLSTOP_CLOSE (double price){
 Ticket_SELLSTOP_CLOSE = -1;
      for(int i=0;i< OrdersTotal() ;i++){
       if((OrderGetTicket(i)) > 0) {
         if( OrderGetInteger(ORDER_MAGIC) == Magic)
          if( OrderGetInteger(ORDER_TYPE) == ORDER_TYPE_SELL_STOP)         
            if( OrderGetDouble(ORDER_PRICE_OPEN) < price) {       
              Ticket_SELLSTOP_CLOSE =  (int)OrderGetInteger(ORDER_TICKET);
              break;
           }
        }
     }    
}
//+------------------------------------------------------------------+
//|                    SELL_LIMIT                                    |
//+------------------------------------------------------------------+
void SetTicket_SELLLIMIT_CLOSE (double price){
 Ticket_SELLLIMIT_CLOSE = -1;
      for(int i=0;i< OrdersTotal() ;i++){
       if((OrderGetTicket(i)) > 0) {
         if( OrderGetInteger(ORDER_MAGIC) == Magic)
          if( OrderGetInteger(ORDER_TYPE) == ORDER_TYPE_SELL_LIMIT)         
            if( OrderGetDouble(ORDER_PRICE_OPEN) > price) {       
              Ticket_SELLLIMIT_CLOSE =  (int)OrderGetInteger(ORDER_TICKET);
              break;
           }
        }
     }    
}
//+------------------------------------------------------------------+
//|                   BUY_STOP                                       |
//+------------------------------------------------------------------+
void SetTicket_BUYSTOP_CLOSE (double price){
 Ticket_BUYSTOP_CLOSE = -1;
      for(int i=0;i< OrdersTotal() ;i++){
       if((OrderGetTicket(i)) > 0) {
         if( OrderGetInteger(ORDER_MAGIC) == Magic)
          if( OrderGetInteger(ORDER_TYPE) == ORDER_TYPE_BUY_STOP)         
            if( OrderGetDouble(ORDER_PRICE_OPEN) > price) {       
              Ticket_BUYSTOP_CLOSE =  (int)OrderGetInteger(ORDER_TICKET);
              break;
           }
        }
     }    
}
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
//<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><> TRALL <><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>
//-----------------------------------------------------------------------------------------------------------------------------------------------------------------
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
 void SetTRALL_UP(double _ASK,double _BID){ 
                //= SymbolInfoDouble (NULL,SYMBOL_ASK) ; 
             //= SymbolInfoDouble (NULL,SYMBOL_BID) ;    
  //---
//+------------------------------------------------------------------+
//|            UP                                                      |
//+------------------------------------------------------------------+
  //--- BS  --- 
 
       
   double Volume_BS          = GetVolumeBUY_SELL_PREFIX(NAME_PREFIX_BS) ;      
      int Pips_BS            = GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_BS);
   string strVECTOR_BS       = Pips_BS > 0  && Volume_BS > 0 ?  "UP" : (  Pips_BS > 0  && Volume_BS < 0 ? "DN":"--" );
    color clrVECTOR_BS       = strVECTOR_BS == "UP" ? clrAqua : (strVECTOR_BS == "DN" ? clrOrangeRed :  clrOlive)  ;       
   
   SetTRALL_BS(_ASK, _BID, TRALL_FULL_BS, TrallStep_BS, Pips_BS, strVECTOR_BS, false);

    for(int i=0;i<PositionsTotal();i++){ 
       if( PositionGetSymbol(i) != "" ) 
        if( PositionGetInteger(POSITION_MAGIC) == Magic){
          int const pos = StringFind(PositionGetString(POSITION_COMMENT),NAME_PREFIX_BS);
              if(pos != -1){
              
                  //    profit+= PositionGetDouble(POSITION_PROFIT) ;
              
              }
          }
      }

  //--- SL  ---      
   double Volume_SL          = GetVolumeBUY_SELL_PREFIX(NAME_PREFIX_SL) ;      
      int Pips_SL            = GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_SL,true);
   string strVECTOR_SL       = Pips_SL > 0  && Volume_SL > 0 ?  "UP" : (  Pips_SL > 0  && Volume_SL < 0 ? "DN":"--" );
    color clrVECTOR_SL       = strVECTOR_SL == "UP" ? clrAqua : (strVECTOR_SL == "DN" ? clrOrangeRed :  clrOlive)  ;       
   
   SetTRALL_SL(_ASK, _BID, TRALL_FULL_SL, TrallStep_SL, Pips_SL, strVECTOR_SL, false);

}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetTRALL_DN(double _ASK,double _BID ){ 
   //double _ASK             = SymbolInfoDouble (NULL,SYMBOL_ASK) ; 
   //double _BID             = SymbolInfoDouble (NULL,SYMBOL_BID) ;    
  //---
//+------------------------------------------------------------------+
//|           DN                                                       |
//+------------------------------------------------------------------+
  //--- BL  ---      
   double Volume_BL          = GetVolumeBUY_SELL_PREFIX(NAME_PREFIX_BL) ;      
      int Pips_BL            = GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_BL);
   string strVECTOR_BL       = Pips_BL > 0  && Volume_BL > 0 ?  "UP" : (  Pips_BL > 0  && Volume_BL < 0 ? "DN":"--" );
    color clrVECTOR_BL       = strVECTOR_BL == "UP" ? clrAqua : (strVECTOR_BL == "DN" ? clrOrangeRed :  clrOlive)  ;       
   
   SetTRALL_BL(_ASK, _BID, TRALL_FULL_BL, TrallStep_BL, Pips_BL, strVECTOR_BL, false);
   
  //--- SS  ---      
   double Volume_SS          = GetVolumeBUY_SELL_PREFIX(NAME_PREFIX_SS) ;      
      int Pips_SS            = GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_SS,true);
   string strVECTOR_SS       = Pips_SS > 0  && Volume_SS > 0 ?  "UP" : (  Pips_SS > 0  && Volume_SS < 0 ? "DN":"--" );
    color clrVECTOR_SS       = strVECTOR_SS == "UP" ? clrAqua : (strVECTOR_SS == "DN" ? clrOrangeRed :  clrOlive)  ;       

   SetTRALL_SS(_ASK, _BID, TRALL_FULL_SS, TrallStep_SS, Pips_SS, strVECTOR_SS, false);
}

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//void SetTRALL_VECTOR(   double _ASK, 
//                        double _BID,
//                           int trall,
//                           int trall_step, 
//                           int PipsALL, 
//                        double stoploss_up,
//                        double stoploss_dn, 
//                        string strVECTOR, 
//                        string nameTRALL_NULL, 
//                        string nameTRALL_OPEN, 
//                        string nameTRALL_FULL,
//                          bool hideline = false){ 
//  if(trall!=0)                
//   if(PipsALL > 0 && strVECTOR == "UP" ){   
//      //---
//       PRICE_TRALL_NULL = _ASK - PipsALL*POINT;
//      //---
//      if(PipsALL > TRALL_FULL)    {
//         TRALL_FULL        = PipsALL;
//         TRALL_OPEN        = TRALL_FULL-trall_step;  
//         PRICE_TRALL_OPEN  = PRICE_TRALL_NULL + TRALL_OPEN * POINT;  
//         PRICE_TRALL_FULL  = PRICE_TRALL_NULL + TRALL_FULL *  POINT;       
//         stoploss_dn       = PRICE_TRALL_OPEN;
//       }else{
//            TRALL_OPEN = TRALL_FULL-trall_step;  
//            PRICE_TRALL_OPEN  = PRICE_TRALL_NULL + TRALL_OPEN * POINT;
//            PRICE_TRALL_FULL  = PRICE_TRALL_NULL + TRALL_FULL *  POINT;                  
//       } 
//   
//    DT_NULL_OPEN = (int)((PRICE_TRALL_OPEN - PRICE_TRALL_NULL)/POINT);
//    DT_OPEN_FULL = (int)((PRICE_TRALL_FULL - PRICE_TRALL_OPEN)/POINT);       
//     
//      H_line(nameTRALL_NULL, PRICE_TRALL_NULL,clrAqua );
//       if(stoploss_up != 0){
//               H_line(nameTRALL_OPEN, PRICE_TRALL_OPEN,clrRed,STYLE_SOLID,2 );   
//        }else{
//               H_line(nameTRALL_OPEN, PRICE_TRALL_OPEN,clrPink );   
//           } 
//      H_line(nameTRALL_FULL, PRICE_TRALL_FULL,clrGold );
//   //---
//   }else if(PipsALL > 0 && strVECTOR == "DN" ) {   
//      //---
//      PRICE_TRALL_NULL = _ASK + PipsALL*POINT;
//      //---
//      if(PipsALL > TRALL_FULL)    {
//         TRALL_FULL        = PipsALL;
//         TRALL_OPEN        = TRALL_FULL-trall_step;  
//         PRICE_TRALL_OPEN  = PRICE_TRALL_NULL - TRALL_OPEN * POINT;  
//         PRICE_TRALL_FULL  = PRICE_TRALL_NULL - TRALL_FULL *  POINT;       
//         stoploss_up       = PRICE_TRALL_OPEN;
//       }else{
//         TRALL_OPEN = TRALL_FULL-trall_step;  
//         PRICE_TRALL_OPEN  = PRICE_TRALL_NULL - TRALL_OPEN * POINT;  
//         PRICE_TRALL_FULL  = PRICE_TRALL_NULL - TRALL_FULL *  POINT;                   
//       }    
//          
//    DT_NULL_OPEN = (int)((PRICE_TRALL_NULL - PRICE_TRALL_OPEN)/POINT);
//    DT_OPEN_FULL = (int)((PRICE_TRALL_OPEN - PRICE_TRALL_FULL)/POINT); 
//       
//      H_line(nameTRALL_NULL, PRICE_TRALL_NULL,clrAqua );
//       if(stoploss_up != 0){
//               H_line(nameTRALL_OPEN, PRICE_TRALL_OPEN,clrRed,STYLE_SOLID,2 );   
//        }else{
//               H_line(nameTRALL_OPEN, PRICE_TRALL_OPEN,clrPink );   
//           }   
//      H_line(nameTRALL_FULL, PRICE_TRALL_FULL,clrGold );   
//   
//   }else{
//      ObjectDelete(0,nameTRALL_NULL);
//      ObjectDelete(0,nameTRALL_OPEN);
//      ObjectDelete(0,nameTRALL_FULL);
//      
//   }
//      
//}
////+------------------------------------------------------------------+
////|                                                                  |
////+------------------------------------------------------------------+
void SetTRALL_BL  (  double _ASK, 
                     double _BID,
                        int trall,
                        int trall_step, 
                        int Pips, 
                     string strVECTOR, 
                       bool hideline = false ){ 
  if(trall ==0 ) return;                
   if(Pips > 0 && strVECTOR == "UP" ){   
     //---
       PRICE_TRALL_NULL_BL = _ASK - Pips*POINT;
     //---
     if(Pips > trall ) {
         TRALL_FULL_BL        = Pips;
         TRALL_OPEN_BL        = TRALL_FULL_BL-trall_step;  
         PRICE_TRALL_OPEN_BL  = PRICE_TRALL_NULL_BL + TRALL_OPEN_BL * POINT;  
         PRICE_TRALL_FULL_BL  = PRICE_TRALL_NULL_BL + TRALL_FULL_BL *  POINT;       
         STOPLOSS_BL          = PRICE_TRALL_OPEN_BL;
       }else{
            TRALL_OPEN_BL        = TRALL_FULL_BL-trall_step;  
            PRICE_TRALL_OPEN_BL  = PRICE_TRALL_NULL_BL + TRALL_OPEN_BL * POINT;
            PRICE_TRALL_FULL_BL  = PRICE_TRALL_NULL_BL + TRALL_FULL_BL *  POINT;                  
       }           
      DT_NULL_OPEN_BL = (int)((PRICE_TRALL_OPEN_BL - PRICE_TRALL_NULL_BL)/POINT);
      DT_OPEN_FULL_BL = (int)((PRICE_TRALL_FULL_BL - PRICE_TRALL_OPEN_BL)/POINT);       
     
      H_line(NAME_TRALL_NULL_BL, PRICE_TRALL_NULL_BL,clrAqua );
       if(STOPLOSS_BL != 0){
               H_line(NAME_TRALL_OPEN_BL, PRICE_TRALL_OPEN_BL,clrRed,STYLE_SOLID,2 );   
        }else{
               H_line(NAME_TRALL_OPEN_BL, PRICE_TRALL_OPEN_BL,clrPink );   
           } 
      H_line(NAME_TRALL_FULL_BL, PRICE_TRALL_FULL_BL,clrGold );        
   //---
   }else{
      ObjectDelete(0,NAME_TRALL_NULL_BL);
      ObjectDelete(0,NAME_TRALL_OPEN_BL);
      ObjectDelete(0,NAME_TRALL_FULL_BL);      
   }
      
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetTRALL_SS  (  double _ASK, 
                     double _BID,
                        int trall,
                        int trall_step, 
                        int Pips, 
                     string strVECTOR, 
                       bool hideline = false ){ 
  if(trall ==0 ) return;                
   if(Pips > 0 && strVECTOR == "DN" ){   
     //---
       PRICE_TRALL_NULL_SS = _BID + Pips*POINT;
     //---
     if(Pips > trall ) {
          //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>Pips > trall>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> ");
          //     Print(__FUNCTION__, " -------------------------------------- Pips > trall = ", Pips > trall);
          //     Print(__FUNCTION__, " -------------------------------------- Pips = ", Pips);
          //     Print(__FUNCTION__, " -------------------------------------- TRALL_FULL_SS = ", TRALL_FULL_SS);
          //      Print(__FUNCTION__, " -------------------------------------- STOPLOSS_SS = ", STOPLOSS_SS);
         TRALL_FULL_SS        = Pips;
         TRALL_OPEN_SS        = TRALL_FULL_SS-trall_step;  
         PRICE_TRALL_OPEN_SS  = PRICE_TRALL_NULL_SS - TRALL_OPEN_SS * POINT;  
         PRICE_TRALL_FULL_SS  = PRICE_TRALL_NULL_SS - TRALL_FULL_SS *  POINT;
                
         STOPLOSS_SS          = PRICE_TRALL_OPEN_SS; //STOPLOSS_SS ==0? PRICE_TRALL_OPEN_SS: (STOPLOSS_SS > PRICE_TRALL_OPEN_SS ? PRICE_TRALL_OPEN_SS : STOPLOSS_SS)  ;
       
       }else{
            TRALL_OPEN_SS        = trall-trall_step;  
            PRICE_TRALL_OPEN_SS  = PRICE_TRALL_NULL_SS - TRALL_OPEN_SS * POINT;
            PRICE_TRALL_FULL_SS  = PRICE_TRALL_NULL_SS - TRALL_FULL_SS *  POINT;                  
     } 
//     Print(__FUNCTION__, " ============================================================================= ");
//     Print(__FUNCTION__, " -------------------------------------- STOPLOSS_SS = ", STOPLOSS_SS);
//     Print(__FUNCTION__, " -------------------------------------- PRICE_TRALL_OPEN_SS = ", PRICE_TRALL_OPEN_SS);
//     
//     Print(__FUNCTION__, " -------------------------------------- Pips = ", Pips);
//     Print(__FUNCTION__, " -------------------------------------- trall = ", trall);
//     Print(__FUNCTION__, " -------------------------------------- Pips > trall = ", Pips > trall);
     
 
    DT_NULL_OPEN_SS = (int)((PRICE_TRALL_NULL_SS - PRICE_TRALL_OPEN_SS)/POINT);
    DT_OPEN_FULL_SS = (int)((PRICE_TRALL_OPEN_SS - PRICE_TRALL_FULL_SS )/POINT);       
     
      H_line(NAME_TRALL_NULL_SS, PRICE_TRALL_NULL_SS,clrAqua );
       if(STOPLOSS_SS != 0){
               H_line(NAME_TRALL_OPEN_SS, STOPLOSS_SS,clrYellow,STYLE_SOLID,2 );   
        }else{
               H_line(NAME_TRALL_OPEN_SS, PRICE_TRALL_OPEN_SS,clrPink );   
           } 
      H_line(NAME_TRALL_FULL_SS, PRICE_TRALL_FULL_SS,clrGold );        
   //---
   } else{
      ObjectDelete(0,NAME_TRALL_NULL_SS);
      ObjectDelete(0,NAME_TRALL_OPEN_SS);
      ObjectDelete(0,NAME_TRALL_FULL_SS);      
   }
      
}
 //+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetTRALL_SL  (  double _ASK, 
                     double _BID,
                        int trall,
                        int trall_step, 
                        int Pips, 
                     string strVECTOR, 
                       bool hideline = false ){ 
  if(trall ==0 ) return;                
   if(Pips > 0 && strVECTOR == "DN" ){   
     //---
       PRICE_TRALL_NULL_SL = _BID + Pips*POINT;
     //---
     if(Pips > trall ) {
         TRALL_FULL_SL        = Pips;
         TRALL_OPEN_SL        = TRALL_FULL_SL-trall_step;  
         PRICE_TRALL_OPEN_SL  = PRICE_TRALL_NULL_SL - TRALL_OPEN_SL * POINT;  
         PRICE_TRALL_FULL_SL  = PRICE_TRALL_NULL_SL - TRALL_FULL_SL *  POINT;       
         STOPLOSS_SL          = PRICE_TRALL_OPEN_SL;
       }else{
            TRALL_OPEN_SL        = trall-trall_step;  
            PRICE_TRALL_OPEN_SL  = PRICE_TRALL_NULL_SL - TRALL_OPEN_SL * POINT;
            PRICE_TRALL_FULL_SL  = PRICE_TRALL_NULL_SL - TRALL_FULL_SL *  POINT;                  
     } 
          
    DT_NULL_OPEN_SL = (int)((PRICE_TRALL_NULL_SL - PRICE_TRALL_OPEN_SL)/POINT);
    DT_OPEN_FULL_SL = (int)((PRICE_TRALL_OPEN_SL - PRICE_TRALL_FULL_SL )/POINT);       
     
      H_line(NAME_TRALL_NULL_SL, PRICE_TRALL_NULL_SL,clrAqua );
       if(STOPLOSS_SL != 0){
               H_line(NAME_TRALL_OPEN_SL, PRICE_TRALL_OPEN_SL,clrYellow,STYLE_SOLID,2 );   
        }else{
               H_line(NAME_TRALL_OPEN_SL, PRICE_TRALL_OPEN_SL,clrPink );   
           } 
      H_line(NAME_TRALL_FULL_SL, PRICE_TRALL_FULL_SL,clrGold );        
   //---
   } else{
      ObjectDelete(0,NAME_TRALL_NULL_SL);
      ObjectDelete(0,NAME_TRALL_OPEN_SL);
      ObjectDelete(0,NAME_TRALL_FULL_SL);      
   }      
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetTRALL_BS  (  double _ASK, 
                     double _BID,
                        int trall,
                        int trall_step, 
                        int Pips, 
                     string strVECTOR, 
                       bool hideline = false ){ 
  if(trall ==0 ) return;                
   if(Pips > 0 && strVECTOR == "UP" ){   
     //---
       PRICE_TRALL_NULL_BS = _ASK - Pips*POINT;
     //---
     if(Pips > trall ) {
         TRALL_FULL_BS        = Pips;
         TRALL_OPEN_BS        = TRALL_FULL_BS-trall_step;  
         PRICE_TRALL_OPEN_BS  = PRICE_TRALL_NULL_BS + TRALL_OPEN_BS * POINT;  
         PRICE_TRALL_FULL_BS  = PRICE_TRALL_NULL_BS + TRALL_FULL_BS *  POINT;       
         STOPLOSS_BS          = PRICE_TRALL_OPEN_BS;
       }else{
            TRALL_OPEN_BS        = TRALL_FULL_BS-trall_step;  
            PRICE_TRALL_OPEN_BS  = PRICE_TRALL_NULL_BS + TRALL_OPEN_BS * POINT;
            PRICE_TRALL_FULL_BS  = PRICE_TRALL_NULL_BS + TRALL_FULL_BS *  POINT;                  
       }           
      DT_NULL_OPEN_BS = (int)((PRICE_TRALL_OPEN_BS - PRICE_TRALL_NULL_BS)/POINT);
      DT_OPEN_FULL_BS = (int)((PRICE_TRALL_FULL_BS - PRICE_TRALL_OPEN_BS)/POINT);       
     
      H_line(NAME_TRALL_NULL_BS, PRICE_TRALL_NULL_BS,clrAqua );
       if(STOPLOSS_BS != 0){
               H_line(NAME_TRALL_OPEN_BS, STOPLOSS_BS,clrRed,STYLE_SOLID,2 );   
        }else{
               H_line(NAME_TRALL_OPEN_BS, PRICE_TRALL_OPEN_BS,clrPink );   
           } 
      H_line(NAME_TRALL_FULL_BS, PRICE_TRALL_FULL_BS,clrGold );        
   //---
   }else{
      ObjectDelete(0,NAME_TRALL_NULL_BS);
      ObjectDelete(0,NAME_TRALL_OPEN_BS);
      ObjectDelete(0,NAME_TRALL_FULL_BS);      
   }
      
} 