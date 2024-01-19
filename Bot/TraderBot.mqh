#include  "..\setting\FilePathMain.mqh" 
void TraderBot(int      number,  CTrade   &trade[]  )
{
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
  double const ASK   = SymbolInfoDouble(NULL,SYMBOL_ASK);
  double const BID   = SymbolInfoDouble(NULL,SYMBOL_BID);  
     int const SPRED = (int)SymbolInfoInteger(NULL,SYMBOL_SPREAD);  
  double const dSPRED =   SPRED*POINT; 
   
 if(ScopeLevel !=0)  {
   PRICE_ScopeLevel_UP_ASK = ASK + ScopeLevel*POINT;
   PRICE_ScopeLevel_UP_BID = BID + ScopeLevel*POINT; 
   
   PRICE_ScopeLevel_DN_ASK = ASK - ScopeLevel*POINT;
   PRICE_ScopeLevel_DN_BID = BID - ScopeLevel*POINT; 
   //---
   SetTicket_BUYSTOP_CLOSE  (PRICE_ScopeLevel_UP_ASK);
   SetTicket_SELLLIMIT_CLOSE(PRICE_ScopeLevel_UP_ASK);
   //---
   SetTicket_BUYLIMIT_CLOSE (PRICE_ScopeLevel_DN_BID);
   SetTicket_SELLSTOP_CLOSE (PRICE_ScopeLevel_DN_BID);
  } 
  
   if(SignalOpenBuyLimit[number])             setPRICE_BL (BID);    
   if(!MAIN_ON && SignalOpenBuyStop[number])  setPRICE_BL (BID);    
   //---
   if(SignalOpenSellLimit[number])            setPRICE_SL (ASK);    
   if(!MAIN_ON && SignalOpenSellStop[number]) setPRICE_SL (ASK);        
   
   if(TRADE_MAIN_UP )  SetTRALL_UP(ASK,BID); 
   if(TRADE_MAIN_DN )  SetTRALL_DN(BID,BID); 

//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//|           >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> C L O S E  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+

// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ P R O F I T   &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$$$$$$$$$$$$$$$$$$$$$$$$

//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                    CLOSE OUT SL    | % PipsOutPrice  %                              |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if( SignalCloseSL_OUT_PRICE[number] ){
     //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>     CLOSE OUT SL    | % PipsOutPrice  %     <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
     //---
     CloseSL_PREFIX (number,trade) ;
     //---
     SetPARAMETRS_START(NAME_SELLLIMIT);
}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                    CLOSE OUT BL    | % PipsOutPrice  %                              |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if( SignalCloseBL_OUT_PRICE[number] ){
     //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>     CLOSE OUT BL    | % PipsOutPrice  %      <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
     //---
     CloseBL_PREFIX (number,trade) ;
     //---
     SetPARAMETRS_START(NAME_BUYLIMIT);
}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                    CLOSE  BUTTON UP   | % State_BUTTON_STOP_UP  %                              |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if( State_BUTTON_STOP_UP ){
     //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>    CLOSE  BUTTON UP | % State_BUTTON_STOP_UP  %      <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
     //---
     CloseSL_PREFIX (number,trade) ;
     //---
     SetPARAMETRS_START(NAME_SELLLIMIT);
}

//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                    CLOSE  BUTTON DN   | % State_BUTTON_STOP_UP  %                              |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if( State_BUTTON_STOP_DN ){
     //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>    CLOSE  BUTTON DN | % State_BUTTON_STOP_DN  %      <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
     //---
     CloseBL_PREFIX (number,trade) ;
     //---
     SetPARAMETRS_START(NAME_BUYLIMIT);
}

//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                    CLOSE  BUTTON ALL   | % State_BUTTON_STOP %                              |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if( State_BUTTON_STOP ){
     //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>    CLOSE  BUTTON ALL   | % State_BUTTON_STOP  %      <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
     //---
     CloseAll_PREFIX(number,trade);
     //---
     SetPARAMETRS_START(NAME_ALL);
}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                    CLOSE LOW PROFIT ALL   | % DT_EQ_BAL_START < LowProfit_Eqity  %                              |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if (  SignalCloseAll_LOWPROFIT[number] ) {
//Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>   CLOSE LOW PROFIT ALL   | % DT_EQ_BAL_START < LowProfit_Eqity  %     <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
   //---
   CloseAll_PREFIX(number,trade);
   //---
   SetPARAMETRS_START(NAME_ALL);
}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                    CLOSE  PROFIT ALL   | % DT_EQ_BAL_START > Profit_Eqity  %                              |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if (  SignalCloseAll_PROFIT[number] ) {
//Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>    CLOSE  PROFIT ALL   | % DT_EQ_BAL_START > Profit_Eqity  %     <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
  //---
   CloseAll_PREFIX(number,trade);
  //---
   SetPARAMETRS_START(NAME_ALL);
}
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                    CLOSE  PROFIT SL   | % Pips_SL > ProfitPips_SL  %                              |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalCloseSL_PROFIT[number]){ 
//Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>    CLOSE  PROFIT SL   | % Pips_SL > ProfitPips_SL  %    <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
  //---
   CloseSL_PREFIX(number,trade);
  //---
   SetPARAMETRS_START(NAME_SELLLIMIT);
   //--- 
   //SetTRADE_CLOSE();
}
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                    CLOSE  PROFIT BL   | % Pips_BL > ProfitPips_BL  %                              |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalCloseBL_PROFIT[number]){ 
//Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>  CLOSE  PROFIT BL   | % Pips_BL > ProfitPips_BL  %    <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
   //---
   CloseBL_PREFIX(number,trade);
   //---
   SetPARAMETRS_START(NAME_BUYLIMIT);
}

// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ M O V E   &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$$$$$$$$$$$$$$$$$$$$$$$$
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                     CLOSE  MOVE SL UP  | %  DT_StartStep_UP > StartStep+SPREAD  %                           
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalCloseUP_MOVE[number]){ 
//Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>  CLOSE  MOVE SL UP  | %  DT_StartStep_UP > StartStep+SPREAD  %    <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
  //---
   CloseUP_MOVE(number,trade);
  //---
   SetPARAMETRS_START(NAME_MOVE_UP);
}
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                     CLOSE MOVE BL  DN  | %  DT_StartStep_DN > StartStep+SPREAD  %                           
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalCloseDN_MOVE[number]){ 
//Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>  CLOSE MOVE BL  DN  | %  DT_StartStep_DN > StartStep+SPREAD  %    <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
 //---
   CloseDN_MOVE(number,trade);
 //---
   SetPARAMETRS_START(NAME_MOVE_DN);
}
// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ T R A L    &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$$$$$$$$$$$$$$$$$$$$$$$$

//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|             CLOSE SL TRALL  | %   BID > STOPLOSS_SL  %                                                     |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalCloseSL_TRALL[number]){ 
 //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>   CLOSE SL TRALL  | %   BID > STOPLOSS_SL  %    <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );  
   //---
   CloseSL_PREFIX(number,trade);      
   //---
   SetPARAMETRS_START(NAME_SELLLIMIT);
}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|             CLOSE BS TRALL  | %   BID > STOPLOSS_BS  %                                                     |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalCloseBS_TRALL[number]){ 
//Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>  CLOSE BS TRALL  |  % ASK < STOPLOSS_BS %   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
   //---
   CloseBS_PREFIX(number,trade, false);
   //---
   SetPARAMETRS_START(NAME_BUYSTOP);
}
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|             CLOSE BL TRALL  | %   ASK < STOPLOSS_BL  %                                                     |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalCloseBL_TRALL[number]){ 
//Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>  CLOSE BL TRALL  | %   ASK < STOPLOSS_BL  %   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
   //---
   CloseBL_PREFIX(number,trade);      
   //---
   SetPARAMETRS_START(NAME_BUYLIMIT);
}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|             CLOSE SS TRALL  | %   BID > STOPLOSS_BL  %                                                     |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalCloseSS_TRALL[number]){ 
//Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>  CLOSE SS TRALL  | % BID > STOPLOSS_SS %   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
   //---
   CloseSS_PREFIX(number,trade, false);
   //---     
   SetPARAMETRS_START(NAME_SELLSTOP); 
}
// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ S C O P E   &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$$$$$$$$$$$$$$$$$$$$$$$$
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|            SCOPE | CLOSE BUYSTOP  | %  Ticket_BUYSTOP_CLOSE !=-1  %                               
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalCloseBuyStopScope[number] ){  
 //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> SCOPE | CLOSE BUYSTOP  | %  Ticket_BUYSTOP_CLOSE !=-1  %   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
   //---
   CloseBuyStopScope(number,trade);  
}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|            SCOPE | CLOSE SELLLIMIT  | %  Ticket_SELLLIMIT_CLOSE !=-1  %                               
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalCloseSellLimitScope[number] ){  
 //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> SCOPE | CLOSE SELLLIMIT  | %  Ticket_SELLLIMIT_CLOSE !=-1  %  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
   //---
   CloseSellLimitScope(number,trade);  
}
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|            SCOPE | CLOSE SELLSTOP  | %  Ticket_SELLSTOP_CLOSE !=-1  %                               
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalCloseSellStopScope[number] ){  
 //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> SCOPE | CLOSE SELLSTOP  | %  Ticket_SELLSTOP_CLOSE !=-1  %  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
    CloseSellStopScope(number,trade);  
}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|            SCOPE | CLOSE BUYLIMIT  | %  Ticket_BUYLIMIT_CLOSE !=-1  %                               
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalCloseBuyLimitScope[number] ){  
 //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> SCOPE | CLOSE BUYLIMIT  | %  Ticket_BUYLIMIT_CLOSE !=-1  %  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
  //---
  CloseBuyLimitScope (number,trade);  
}
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//|           >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> O P E N <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|           START | SCOPE_OFF |  SELLIMIT   % CountPend == 0  %                            
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(ScopeLevel == 0)
 if(SignalOpenSellLimit[number] ){ 
   //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>   START | SCOPE_OFF |  SELLIMIT   % CountPend == 0  %       <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );   
   for(int i=0;i<NUMBER_OF_KNEES;i++){
     string const NameOrder      = Order.arrSELLLIMIT[i];
     double const nextPrice      = jSELLLIMIT[NameOrder][NAME_PRICE_OPEN].ToDbl() ;
     double const nextLot        = jSELLLIMIT[NameOrder][NAME_LOT].ToDbl() ;
     string const nextComment    = jSELLLIMIT[NameOrder][NAME_COMMENT].ToStr() ; ;
   //---
     set_OPEN_SELLLIMIT(number,trade,NameOrder,nextPrice,nextLot,nextComment);      
   //---
   }
}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|           START | SCOPE_ON |  SELLIMIT   % CountPend == 0  %                            
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(ScopeLevel != 0)
 if(SignalOpenSellLimit[number] ){ 
   //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>   START | SCOPE_ON |  SELLIMIT   % CountPend == 0  %       <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );   
   for(int i=0;i<NUMBER_OF_KNEES;i++){
     string const NameOrder      = Order.arrSELLLIMIT[i];
     double const nextPrice      = jSELLLIMIT[NameOrder][NAME_PRICE_OPEN].ToDbl() ;
     double const nextLot        = jSELLLIMIT[NameOrder][NAME_LOT].ToDbl() ;
     string const nextComment    = jSELLLIMIT[NameOrder][NAME_COMMENT].ToStr() ; ;
   //---
   if( nextPrice < PRICE_ScopeLevel_UP_BID  )  
     set_OPEN_SELLLIMIT(number,trade,NameOrder,nextPrice,nextLot,nextComment);      
   //---
   }
}

//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|           START | SCOPE_OFF |  BUYLIMIT   % CountPend == 0  %                            
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(ScopeLevel == 0)
 if(SignalOpenBuyLimit[number] ){ 
   //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>   START | SCOPE_OFF |  BUYLIMIT   % CountPend == 0  %       <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );   
   for(int i=0;i<NUMBER_OF_KNEES;i++){
     string const NameOrder      = Order.arrBUYLIMIT[i];
     double const nextPrice      = jBUYLIMIT[NameOrder][NAME_PRICE_OPEN].ToDbl() ;
     double const nextLot        = jBUYLIMIT[NameOrder][NAME_LOT].ToDbl() ;
     string const nextComment    = jBUYLIMIT[NameOrder][NAME_COMMENT].ToStr() ;
   //---
     set_OPEN_BUYLIMIT(number,trade,NameOrder,nextPrice,nextLot,nextComment);      
   //---
   }
}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|         START | SCOPE_ON | OPEN BUYLIMIT    %  CountPend == 0  %                           
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(ScopeLevel != 0 )
 if(SignalOpenBuyLimit[number] ){ 
    //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>    START | SCOPE_ON | OPEN BUYLIMIT     %  CountPend == 0  %     <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );   
   for(int i=0;i<NUMBER_OF_KNEES;i++){
     string const NameOrder      = Order.arrBUYLIMIT[i];
     double const nextPrice      = jBUYLIMIT[NameOrder][NAME_PRICE_OPEN].ToDbl() ;
     double const nextLot        = jBUYLIMIT[NameOrder][NAME_LOT].ToDbl() ;
     string const nextComment    = jBUYLIMIT[NameOrder][NAME_COMMENT].ToStr() ;
   //---
   if( nextPrice > PRICE_ScopeLevel_DN_ASK  )   
                                set_OPEN_BUYLIMIT(number,trade,NameOrder,nextPrice,nextLot,nextComment);      
   //---
   }
}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|          TRADE | SCOPE_ON | OPEN HIDE BUYLIMIT   % isPriceInScopeBUYLIMIT %                            
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if( SignalOpenBuyLimitScope[number] ){ 
   //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>     TRADE | SCOPE_ON | OPEN HIDE BUYLIMIT   % isPriceInScopeBUYLIMIT %      <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );   
   for(int i=0;i<NUMBER_OF_KNEES;i++){
     string const NameOrder      = Order.arrBUYLIMIT[i];
        int const countPend      = GetCountPendByComment(NameOrder)  ;
        int const countPosition  = GetCountPositionByComment(NameOrder);
        int const count          = countPend + countPosition;
     double const nextPrice      = jBUYLIMIT[NameOrder][NAME_PRICE_OPEN].ToDbl() ;
     double const nextLot        = jBUYLIMIT[NameOrder][NAME_LOT].ToDbl() ;
     string const nextComment    = jBUYLIMIT[NameOrder][NAME_COMMENT].ToStr() ;     

   if( count == 0  )
        if ( nextPrice > PRICE_ScopeLevel_DN_ASK   )   
                               set_OPEN_BUYLIMIT(number,trade,NameOrder,nextPrice,nextLot,nextComment);      
   }
}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|          TRADE | SCOPE_ON | OPEN HIDE  SELLLIMIT  % isPriceInScopeSELLLIMIT %                            
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if( SignalOpenSellLimitScope[number] ){ 
   //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>     TRADE | SCOPE_ON | OPEN HIDE SELLLIMIT   % isPriceInScopeSELLLIMIT %      <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );   
   for(int i=0;i<NUMBER_OF_KNEES;i++){
     string const NameOrder      = Order.arrSELLLIMIT[i];
        int const countPend      = GetCountPendByComment(NameOrder)  ;
        int const countPosition  = GetCountPositionByComment(NameOrder);
        int const count          = countPend + countPosition;
     double const nextPrice      = jSELLLIMIT[NameOrder][NAME_PRICE_OPEN].ToDbl() ;
     double const nextLot        = jSELLLIMIT[NameOrder][NAME_LOT].ToDbl() ;
     string const nextComment    = jSELLLIMIT[NameOrder][NAME_COMMENT].ToStr() ;
             
   if( count == 0  )
        if ( nextPrice < PRICE_ScopeLevel_UP_BID   )   
                               set_OPEN_SELLLIMIT(number,trade,NameOrder,nextPrice,nextLot,nextComment);      
   }
}

//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                  START | SCOPE_OFF | OPEN BUYSTOP % count =0  %                                 
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if( ScopeLevel == 0) 
 if(SignalOpenBuyStop[number] ){ 
//Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> START | SCOPE_OFF | OPEN BUYSTOP % count =0  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );

for(int i=1;i<NUMBER_OF_KNEES;i++){
  
int const kstart = arrStartStop[i][0];
int const kstop  = arrStartStop[i][1];  
//if(kstart <10)
for(int k=kstart;k<kstop;k++){
 
  string const MainNameOrder  = Order.arrSELLLIMIT[i];
  string const SubNameOrder   = Order.arrBUYSTOP[k];
  string const fullName       = jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_COMMENT].ToStr() ;
     int const countPend      = GetCountPendByComment(fullName)  ;
     int const countPosition  = GetCountPositionByComment(fullName);
     int const count          = countPend + countPosition;     
  double const nextLot        = jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_LOT].ToDbl() ;
  string const nextComment    = jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_COMMENT].ToStr() ; //MainNameOrder+"#"+SubNameOrder;
  double const nextPrice      = jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_PRICE_OPEN].ToDbl() ;          
  double const nextTP         =  Trall_BS != 0 ? 0 : jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_TAKEPROFIT].ToDbl() ;   
   //if(i < 3 )
   //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> jSELLLIMIT ",i," =  ", jSELLLIMIT[MainNameOrder][SubNameOrder].Serialize() );
 
  if(nextPrice > 0)
     if( count == 0  )
       if(GetVolumeBS_SUB(NAME_PREFIX_BS)+nextLot < GetVolumeSL_MAIN(NAME_PREFIX_SL) )  
         set_OPEN_BUYSTOP(number, trade, MainNameOrder, SubNameOrder, nextPrice, nextTP, nextLot,nextComment );
   }// конец цикла
  }
 }
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                  START | SCOPE_ON | OPEN BUYSTOP % count =0  %                                 
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if( ScopeLevel != 0) 
 if(SignalOpenBuyStop[number] ){ 
//Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> START | SCOPE_ON | OPEN BUYSTOP % count =0  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );

for(int i=1;i<NUMBER_OF_KNEES;i++){
  
int const kstart = arrStartStop[i][0];
int const kstop  = arrStartStop[i][1];  
//if(kstart <10)
for(int k=kstart;k<kstop;k++){
 
  string const MainNameOrder  = Order.arrSELLLIMIT[i];
  string const SubNameOrder   = Order.arrBUYSTOP[k];
  string const fullName       = jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_COMMENT].ToStr() ;
     int const countPend      = GetCountPendByComment(fullName)  ;
     int const countPosition  = GetCountPositionByComment(fullName);
     int const count          = countPend + countPosition;     
  double const nextLot        = jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_LOT].ToDbl() ;
  string const nextComment    = jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_COMMENT].ToStr() ; //MainNameOrder+"#"+SubNameOrder;
  double const nextPrice      = jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_PRICE_OPEN].ToDbl() ;          
  double const nextTP         =  Trall_BS != 0 ? 0 : jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_TAKEPROFIT].ToDbl() ;      
   //if(i < 3 )
   //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> jSELLLIMIT ",i," =  ", jSELLLIMIT[MainNameOrder][SubNameOrder].Serialize() );
   if(nextPrice > 0)
     if( count == 0  )
     if (nextPrice < PRICE_ScopeLevel_UP_BID ){
     if(GetVolumeBS_SUB(NAME_PREFIX_BS)+nextLot < GetVolumeSL_MAIN(NAME_PREFIX_SL) )  
          set_OPEN_BUYSTOP(number, trade, MainNameOrder, SubNameOrder, nextPrice, nextTP, nextLot,nextComment );
      }else{
         break;
      }
         
   }// конец цикла
  }
 }

//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                  TRADE | SCOPE_ON | OPEN BUYSTOP % inScope  %                                 
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalOpenBuyStopScope[number] ){  

//Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> TRADE | SCOPE_ON | OPEN BUYSTOP % inScope  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );

for(int i=1;i<NUMBER_OF_KNEES;i++){
  
int const kstart = arrStartStop[i][0];
int const kstop  = arrStartStop[i][1];  
//if(kstart <10)
for(int k=kstart;k<kstop;k++){
 
  string const MainNameOrder  = Order.arrSELLLIMIT[i];
  string const SubNameOrder   = Order.arrBUYSTOP[k];
  string const fullName       = jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_COMMENT].ToStr() ;
     int const countPend      = GetCountPendByComment(fullName)  ;
     int const countPosition  = GetCountPositionByComment(fullName);
     int const count          = countPend + countPosition;     
  double const nextLot        = jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_LOT].ToDbl() ;
  string const nextComment    = jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_COMMENT].ToStr() ; //MainNameOrder+"#"+SubNameOrder;
  double const nextPrice      = jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_PRICE_OPEN].ToDbl() ;          
  double const nextTP         = Trall_BS != 0 ? 0 : jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_TAKEPROFIT].ToDbl() ;
  
  //if(i < 3 )
  //  Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> jSELLLIMIT ",i," =  ", jSELLLIMIT[MainNameOrder][SubNameOrder].Serialize() );
  if(nextPrice > 0)
   if( count == 0  )
    if(ASK + ReSubStep * POINT < nextPrice )
     if (nextPrice < PRICE_ScopeLevel_UP_BID ){
       if(GetVolumeBS_SUB(NAME_PREFIX_BS)+nextLot < GetVolumeSL_MAIN(NAME_PREFIX_SL) )  
          set_OPEN_BUYSTOP(number, trade, MainNameOrder, SubNameOrder, nextPrice, nextTP, nextLot,nextComment );
      }else{
         break;
      }                
   }// конец цикла
  }
 }
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+

//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                  START | SCOPE_OFF | OPEN SELLSTOP % count =0  %                                 
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if( ScopeLevel == 0) 
 if(SignalOpenSellStop[number] ){ 
//Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> START | SCOPE_OFF | OPEN SELLSTOP % count =0  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );

for(int i=1;i<NUMBER_OF_KNEES;i++){
  
int const kstart = arrStartStop[i][0];
int const kstop  = arrStartStop[i][1];  
//if(kstart <10)
for(int k=kstart;k<kstop;k++){
 
  string const MainNameOrder  = Order.arrBUYLIMIT[i];
  string const SubNameOrder   = Order.arrSELLSTOP[k];
  string const fullName       = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_COMMENT].ToStr() ;
     int const countPend      = GetCountPendByComment(fullName)  ;
     int const countPosition  = GetCountPositionByComment(fullName);
     int const count          = countPend + countPosition;     
  double const nextLot        = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_LOT].ToDbl() ;
  string const nextComment    = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_COMMENT].ToStr() ; //MainNameOrder+"#"+SubNameOrder;
  double const nextPrice      = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_PRICE_OPEN].ToDbl() ;          
  double const nextTP         =  Trall_SS != 0 ? 0 : jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_TAKEPROFIT].ToDbl() ;      
   //if(i < 3 )
   //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> jBUYLIMIT ",i," =  ", jBUYLIMIT[MainNameOrder][SubNameOrder].Serialize() );
   if(nextPrice > 0)
     if( count == 0  )
       if(GetVolumeSS_SUB(NAME_PREFIX_SS)+nextLot  < GetVolumeBL_MAIN(NAME_PREFIX_BL) )  
         set_OPEN_SELLSTOP(number, trade, MainNameOrder, SubNameOrder, nextPrice, nextTP, nextLot,nextComment );
   }// конец цикла
  }
 }
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                  START | SCOPE_ON | OPEN SELLSTOP % count =0  %                                 
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if( ScopeLevel != 0) 
 if(SignalOpenSellStop[number] ){  
//Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> START | SCOPE_ON | OPEN SELLSTOP % count =0  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );

for(int i=1;i<NUMBER_OF_KNEES;i++){
  
int const kstart = arrStartStop[i][0];
int const kstop  = arrStartStop[i][1];  
//if(kstart <10)
for(int k=kstart;k<kstop;k++){
 
  string const MainNameOrder  = Order.arrBUYLIMIT[i];
  string const SubNameOrder   = Order.arrSELLSTOP[k];
  string const fullName       = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_COMMENT].ToStr() ;
     int const countPend      = GetCountPendByComment(fullName)  ;
     int const countPosition  = GetCountPositionByComment(fullName);
     int const count          = countPend + countPosition;     
  double const nextLot        = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_LOT].ToDbl() ;
  string const nextComment    = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_COMMENT].ToStr() ; //MainNameOrder+"#"+SubNameOrder;
  double const nextPrice      = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_PRICE_OPEN].ToDbl() ;          
  double const nextTP         = Trall_SS != 0 ? 0 : jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_TAKEPROFIT].ToDbl() ;      
  //  if(i < 3 )
  //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> jBUYLIMIT ",i," =  ", jBUYLIMIT[MainNameOrder][SubNameOrder].Serialize() );

 if(nextPrice > 0 )
   if( count == 0  )
      if (nextPrice > PRICE_ScopeLevel_DN_ASK ){
       if(GetVolumeSS_SUB(NAME_PREFIX_SS)+nextLot  < GetVolumeBL_MAIN(NAME_PREFIX_BL) ) 
          set_OPEN_SELLSTOP(number, trade, MainNameOrder, SubNameOrder, nextPrice, nextTP, nextLot,nextComment );
      }else{
         //break;
      }  
   }// конец цикла
  }
 }
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                  TRADE | SCOPE_ON | OPEN SELLSTOP % inScope  %                                 
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalOpenSellStopScope[number] ){  
//if(SignalOpenSellStop[number] || SignalOpenSellStopScope[number]){ 

//Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> TRADE | SCOPE_ON | OPEN SELLSTOP % inScope  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );

for(int i=1;i<NUMBER_OF_KNEES;i++){
  
int const kstart = arrStartStop[i][0];
int const kstop  = arrStartStop[i][1];  
//if(kstart <10)
for(int k=kstart;k<kstop;k++){
 
  string const MainNameOrder  = Order.arrBUYLIMIT[i];
  string const SubNameOrder   = Order.arrSELLSTOP[k];
  string const fullName       = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_COMMENT].ToStr() ;
     int const countPend      = GetCountPendByComment(fullName)  ;
     int const countPosition  = GetCountPositionByComment(fullName);
     int const count          = countPend + countPosition;     
  double const nextLot        = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_LOT].ToDbl() ;
  string const nextComment    = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_COMMENT].ToStr() ; //MainNameOrder+"#"+SubNameOrder;
  double const nextPrice      = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_PRICE_OPEN].ToDbl() ;          
  double const nextTP         =  Trall_SS != 0 ? 0 : jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_TAKEPROFIT].ToDbl() ;  
  
  //if(i < 3 )
  // Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> jBUYLIMIT ",i," =  ", jBUYLIMIT[MainNameOrder][SubNameOrder].Serialize() );
 
  if(nextPrice > 0 )
   if( count == 0  )
    if(ASK - ReSubStep * POINT > nextPrice )
     if (nextPrice > PRICE_ScopeLevel_DN_ASK ){
       if(GetVolumeSS_SUB(NAME_PREFIX_SS)+nextLot < GetVolumeBL_MAIN(NAME_PREFIX_BL) ){
          set_OPEN_SELLSTOP(number, trade, MainNameOrder, SubNameOrder, nextPrice, nextTP, nextLot,nextComment );
       } 
          
      }else{
         //break;
      }        
       
   }// конец цикла
  }
 }
 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
  SetTRADE_OPEN();
 
}