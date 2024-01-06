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
 //if(false)  
 
 if(!PRICE_Set) 
  if(!TRADE){
        if(SignalOpenBuyLimit[number])             setPRICE_BL (BID);    
        if(!MAIN_ON && SignalOpenBuyStop[number])  setPRICE_BL (BID);    
        //---
        if(SignalOpenSellLimit[number])            setPRICE_SL (ASK);    
        if(!MAIN_ON && SignalOpenSellStop[number]) setPRICE_SL (ASK);        
    }
    // Если торговая сессия открыта
    
    else{
      SetTRALL(); 
      if(SignalOpenBuyLimitMove[number])         setPRICE_BL (BID);  
      if(SignalOpenBuyLimitMoveScope[number])    setPRICE_BL (BID);  
      
      if(SignalOpenSellLimitMove[number])        setPRICE_SL (ASK); 
      if(SignalOpenSellLimitMoveScope[number])   setPRICE_SL (ASK); 
           
      //if(SignalOpenBuyLimitScope[number])        setPRICE(ASK,BID);                
     //---
                
   }
            

//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//|           >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> C L O S E  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+

// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ P R O F I T   &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$$$$$$$$$$$$$$$$$$$$$$$$
//+------------------------------------------------------------------+
//|                    CLOSE  PROFIT BL   | % Pips_BL > ProfitPips_BL  %                              |
//+------------------------------------------------------------------+

if(SignalCloseBL_PROFIT[number]){ 
Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>  CLOSE  PROFIT BL   | % Pips_BL > ProfitPips_BL  %    <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
   int p = 50; 
   //---
   while( GetCountPendByPREFIX( NAME_PREFIX_BL ) > 0 && p > 0){
        DeletePendByPREFIX ( number, NAME_PREFIX_BL, trade, _Symbol );
     p--;
   }
   p = 50; 
   //---
   while( GetCountPositijnsByPREFIX( NAME_PREFIX_BL ) > 0 && p > 0){
        ClosePositionByPREFIX ( number, NAME_PREFIX_BL, trade, _Symbol );
     p--;
   }   
   SetPARAMETRS_START(NAME_BUYLIMIT);
   //--- 
   //SetTRADE_CLOSE();
}

// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ M O V E   &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$$$$$$$$$$$$$$$$$$$$$$$$
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                     CLOSE  MOVE SL UP  | %  DT_StartStep_UP > StartStep+PREAD  %                           
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//if(false)
//if(SignalCloseUP_MOVE[number]){ 
//Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>  CLOSE  MOVE SL UP  | %  DT_StartStep_UP > StartStep+PREAD  %    <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
//   int p = 50; 
//   //---
//   while( GetCountPendByPREFIX( NAME_PREFIX_SL ) > 0 && p > 0){
//        DeletePendByPREFIX ( number, NAME_PREFIX_SL, trade, _Symbol );
//     p--;
//   }
//   SetPARAMETRS_START(NAME_MOVE_UP);
//   //---
//}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                     CLOSE MOVE BL  DN  | %  DT_StartStep_DN > StartStep+PREAD  %                           
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//if(false)
if(SignalCloseDN_MOVE[number]){ 
Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>  CLOSE MOVE BL  DN  | %  DT_StartStep_DN > StartStep+PREAD  %    <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
   int p = 50; 
   //---
   while( GetCountPendByPREFIX( NAME_PREFIX_BL) > 0 && p > 0){         
        DeletePendByPREFIX ( number, NAME_PREFIX_BL, trade, _Symbol);
     p--;
   }
   SetPARAMETRS_START(NAME_MOVE_DN);
   //--- 
}
// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ T R A L    &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$$$$$$$$$$$$$$$$$$$$$$$$
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|             CLOSE BL TRALL  | %   ASK < STOPLOSS_BL  %                                                     |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalCloseBL_TRALL[number]){ 
Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>  CLOSE BL TRALL  | %   ASK < STOPLOSS_BL  %   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
   int p = 50; 
   //---
   while( GetCountPendByPREFIX( NAME_PREFIX_BL ) > 0 && p > 0){
        DeletePendByPREFIX ( number, NAME_PREFIX_BL, trade, _Symbol );
     p--;
   }
   p = 50; 
   //---
   while( GetCountPositijnsByPREFIX( NAME_PREFIX_BL ) > 0 && p > 0){
        ClosePositionByPREFIX ( number, NAME_PREFIX_BL, trade, _Symbol );
     p--;
   }   
   SetPARAMETRS_START(NAME_BUYLIMIT);
   //--- 
}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|             CLOSE SS TRALL  | %   BID > STOPLOSS_BL  %                                                     |
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalCloseSS_TRALL[number]){ 
Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>  CLOSE SS TRALL  | % BID > STOPLOSS_SS %   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
   int p = 50; 
   //---
   Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>  GetCountPositijnsByPREFIX( NAME_PREFIX_SS ) = ", GetCountPositijnsByPREFIX( NAME_PREFIX_SS ) );
   
   while( GetCountPositijnsByPREFIX( NAME_PREFIX_SS ) > 0 && p > 0){
        ClosePositionByPREFIX ( number, NAME_PREFIX_SS, trade, _Symbol );
     p--;
   }   
   SetPARAMETRS_START(NAME_SELLSTOP);
   //--- 
}

// $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ S C O P E   &&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&$$$$$$$$$$$$$$$$$$$$$$$$

//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|           CLOSE   SELLSTOP  SCOPE  |   < Ticket_SELLSTOP_CLOSE >                                
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//if(false)
//if(SignalCloseSellStopScope[number]){ 
// Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>  CLOSE   SELLSTOP  SCOPE  |  < Ticket_SELLSTOP_CLOSE >  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
//  int p = 50; 
//  bool close = false;
//   while(   GetTicket_SELLSTOP_CLOSE (PRICE_ScopeLevel_DN_BID) != -1 && p > 0){  
//      DeletePendByTicket(number,trade,_Symbol,Ticket_SELLSTOP_CLOSE ,Magic) ;     
//     p--;
//   }
// SetTRADE_CLOSE(); 
//}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|           CLOSE  SELLSTOP   | < !MAIN_ON / DTPriceMAX_DN  > StepPEND >                         
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//if(false)
//if(SignalCloseSellStop[number]){ 
//Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> CLOSE  SELLSTOP   | < !MAIN_ON / DTPriceMAX_DN  > StepPEND >      <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
// 
//   int p = 50; 
//   while(  GetCountPendByType( ORDER_TYPE_SELL_STOP ) > 0 && p > 0){
//      DeletePendByType(number,trade,arrSymbol[number],ORDER_TYPE_SELL_STOP);    
//     p--;
//   }
// //---
// SetPARAMETRS_START(NAME_SELLSTOP); 
// //--- 
// SetTRADE_CLOSE();
//}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|            SCOPE | CLOSE SELLSTOP  | %  Ticket_SELLSTOP_CLOSE !=-1  %                               
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalCloseSellStopScope[number] ){  
 Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> SCOPE | CLOSE SELLSTOP  | %  Ticket_SELLSTOP_CLOSE !=-1  %  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
  int p = 50; 
  bool close = false;
   while(   close == false && p > 0){
     close = DeletePendByTicket(number,trade,_Symbol,Ticket_SELLSTOP_CLOSE ,Magic) ? true: close;       
     p--;
   }
 //SetTRADE_CLOSE();  
}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|            SCOPE | CLOSE BUYLIMIT  | %  Ticket_BUYLIMIT_CLOSE !=-1  %                               
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalCloseBuyLimitScope[number] ){  
 Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> SCOPE | CLOSE BUYLIMIT  | %  Ticket_BUYLIMIT_CLOSE !=-1  %  <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );
  int p = 50; 
  bool close = false;
   while(   close == false && p > 0){
     close = DeletePendByTicket(number,trade,_Symbol,Ticket_BUYLIMIT_CLOSE ,Magic) ? true: close;       
     p--;
   }
 SetTRADE_CLOSE();  
}

//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//|           >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> O P E N <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|           START | SCOPE_OFF |  BUYLIMIT   % CountPend == 0  %                            
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(ScopeLevel == 0)
 if(SignalOpenBuyLimit[number] ){ 
   Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>   START | SCOPE_OFF |  BUYLIMIT   % CountPend == 0  %       <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );   
   for(int i=0;i<NUMBER_OF_KNEES;i++){
     string const NameOrder      = Order.arrBUYLIMIT[i];
     double const nextPrice      = jBUYLIMIT[NameOrder][NAME_PRICE_OPEN].ToDbl() ;
     double const nextLot        = jBUYLIMIT[NameOrder][NAME_LOT].ToDbl() ;
     string const nextComment    = NameOrder ;
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
    Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>    START | SCOPE_ON | OPEN BUYLIMIT     %  CountPend == 0  %     <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );   
   for(int i=0;i<NUMBER_OF_KNEES;i++){
     string const NameOrder      = Order.arrBUYLIMIT[i];
     double const nextPrice      = jBUYLIMIT[NameOrder][NAME_PRICE_OPEN].ToDbl() ;
     double const nextLot        = jBUYLIMIT[NameOrder][NAME_LOT].ToDbl() ;
     string const nextComment    = NameOrder ;
   //---
   if( nextPrice > PRICE_ScopeLevel_DN_ASK  )   
                                set_OPEN_BUYLIMIT(number,trade,NameOrder,nextPrice,nextLot,nextComment);      
   //---
   }
}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|      TRADE | SCOPE_ON | OPEN MOVE BUYLIMIT  % GetCountPendByPREFIX ==0   %                            
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if( SignalOpenBuyLimitMoveScope[number] ){ 
   Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>  TRADE | SCOPE_ON | OPEN MOVE BUYLIMIT  % GetCountPendByPREFIX ==0  %   <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );   
   for(int i=0;i<NUMBER_OF_KNEES;i++){
     string const NameOrder      = Order.arrBUYLIMIT[i];
        int const countPend      = GetCountPendByComment(NameOrder)  ;
        int const countPosition  = GetCountPositionByComment(NameOrder);
        int const count          = countPend + countPosition;
     double const nextPrice      = jBUYLIMIT[NameOrder][NAME_PRICE_OPEN].ToDbl() ;
     double const nextLot        = jBUYLIMIT[NameOrder][NAME_LOT].ToDbl() ;
     string const nextComment    = NameOrder ;
     
//     Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>      i = ", i );
//     Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>      count = ", count );
//     Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>      nextPrice = ", nextPrice );
//     Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>      PRICE_ScopeLevel_DN_ASK  = ", PRICE_ScopeLevel_DN_ASK  );
//     Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>       nextPrice > PRICE_ScopeLevel_DN_ASK  = ",  nextPrice > PRICE_ScopeLevel_DN_ASK );

   if( count == 0  )
        if ( nextPrice > PRICE_ScopeLevel_DN_ASK   )   
                               set_OPEN_BUYLIMIT(number,trade,NameOrder,nextPrice,nextLot,nextComment);      
   }
}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|     TRADE | SCOPE_OFF | OPEN MOVE BUYLIMIT  % GetCountPendByPREFIX ==0  %                             
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if( SignalOpenBuyLimitMove[number] ){ 
   Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>   TRADE | SCOPE_OFF | OPEN MOVE BUYLIMIT  % GetCountPendByPREFIX ==0  %       <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );   
   for(int i=0;i<NUMBER_OF_KNEES;i++){
     string const NameOrder      = Order.arrBUYLIMIT[i];
        int const countPend      = GetCountPendByComment(NameOrder)  ;
        int const countPosition  = GetCountPositionByComment(NameOrder);
        int const count          = countPend + countPosition;
     double const nextPrice      = jBUYLIMIT[NameOrder][NAME_PRICE_OPEN].ToDbl() ;
     double const nextLot        = jBUYLIMIT[NameOrder][NAME_LOT].ToDbl() ;
     string const nextComment    = NameOrder ;
  
  if( count == 0  )
           set_OPEN_BUYLIMIT(number,trade,NameOrder,nextPrice,nextLot,nextComment);  
   }
}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|          TRADE | SCOPE_ON | OPEN HIDE BUYLIMIT   % isPriceInScopeBUYLIMIT %                            
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if( SignalOpenBuyLimitScope[number] ){ 
   Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>     TRADE | SCOPE_ON | OPEN HIDE BUYLIMIT   % isPriceInScopeBUYLIMIT %      <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );   
   for(int i=0;i<NUMBER_OF_KNEES;i++){
     string const NameOrder      = Order.arrBUYLIMIT[i];
        int const countPend      = GetCountPendByComment(NameOrder)  ;
        int const countPosition  = GetCountPositionByComment(NameOrder);
        int const count          = countPend + countPosition;
     double const nextPrice      = jBUYLIMIT[NameOrder][NAME_PRICE_OPEN].ToDbl() ;
     double const nextLot        = jBUYLIMIT[NameOrder][NAME_LOT].ToDbl() ;
     string const nextComment    = NameOrder ;
     
     //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>      i = ", i );
     //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>      count = ", count );
     //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>      nextPrice = ", nextPrice );
     //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>      PRICE_ScopeLevel_DN_ASK  = ", PRICE_ScopeLevel_DN_ASK  );
     //Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>      nextPrice > PRICE_ScopeLevel_DN_ASK  = ",  nextPrice > PRICE_ScopeLevel_DN_ASK );
             
   if( count == 0  )
        if ( nextPrice > PRICE_ScopeLevel_DN_ASK   )   
                               set_OPEN_BUYLIMIT(number,trade,NameOrder,nextPrice,nextLot,nextComment);      
   }
}


//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+<><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><><>+
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|           OPEN START SELLLIMIT NO SCOPE     %  CountPend == 0  %                            
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//if(ScopeLevel == 0)
// if(SignalOpenSellLimit[number] ){ 
//   Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>   OPEN SELLLIMIT NO SCOPE     %  CountPend == 0  %       <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );   
//   for(int i=0;i<NUMBER_OF_KNEES;i++){
//     string const NameOrder      = Order.arrSELLLIMIT[i];
//     double const nextPrice      = jSELLLIMIT[NameOrder][NAME_PRICE_OPEN].ToDbl() ;
//     double const nextLot        = jSELLLIMIT[NameOrder][NAME_LOT].ToDbl() ;
//     string const nextComment    = NameOrder ;
//   //---
//     set_OPEN_SELLLIMIT(number,trade,NameOrder,nextPrice,nextLot,nextComment);      
//   //---
//   }
//}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|           OPEN START SELLLIMIT SCOPE_ON     %  CountPend == 0  %                           
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//if(ScopeLevel != 0 )
// if(SignalOpenSellLimit[number] ){ 
//    Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>    OPEN SELLLIMIT SCOPE_ON     %  CountPend == 0  %     <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );   
//   for(int i=0;i<NUMBER_OF_KNEES;i++){
//     string const NameOrder      = Order.arrSELLLIMIT[i];
//     double const nextPrice      = jSELLLIMIT[NameOrder][NAME_PRICE_OPEN].ToDbl() ;
//     double const nextLot        = jSELLLIMIT[NameOrder][NAME_LOT].ToDbl() ;
//     string const nextComment    = NameOrder ;
//   //---
//   if( nextPrice < PRICE_ScopeLevel_UP_BID  )   
//                                set_OPEN_SELLLIMIT(number,trade,NameOrder,nextPrice,nextLot,nextComment);     
//   //---
//   }
//}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|           OPEN HIDE SELLLIMIT SCOPE    % isPriceInScopeBUYLIMIT %                            
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//if( SignalOpenSellLimitScope[number] ){ 
//   Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>>    OPEN HIDE SELLLIMIT SCOPE    % isPriceInScopeBUYLIMIT %    <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );   
//   for(int i=0;i<NUMBER_OF_KNEES;i++){
//     string const NameOrder      = Order.arrSELLLIMIT[i];
//        int const countPend      = GetCountPendByComment(NameOrder)  ;
//        int const countPosition  = GetCountPositionByComment(NameOrder);
//        int const count          = countPend + countPosition;
//     double const nextPrice      = jBUYLIMIT[NameOrder][NAME_PRICE_OPEN].ToDbl() ;
//     double const nextLot        = jBUYLIMIT[NameOrder][NAME_LOT].ToDbl() ;
//     string const nextComment    = NameOrder ;
//     
//   if( count == 0  )
//        if ( nextPrice < PRICE_ScopeLevel_UP_BID   )   
//                               set_OPEN_SELLLIMIT(number,trade,NameOrder,nextPrice,nextLot,nextComment);      
//   }
//}
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                  START | SCOPE_OFF | OPEN SELLSTOP % count =0  %                                 
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if( ScopeLevel == 0) 
 if(SignalOpenSellStop[number] ){ 

//if(SignalOpenSellStop[number] || SignalOpenSellStopScope[number]){ 

Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> START | SCOPE_OFF | OPEN SELLSTOP % count =0  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );

for(int i=1;i<NUMBER_OF_KNEES;i++){
  
int const kstart = arrStartStop[i][0];
int const kstop  = arrStartStop[i][1];  
if(kstart <10)
for(int k=kstart;k<kstop;k++){
 
  string const MainNameOrder  = Order.arrBUYLIMIT[i];
  string const SubNameOrder   = Order.arrSELLSTOP[k];
  string const fullName       = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_COMMENT].ToStr() ;
     int const countPend      = GetCountPendByComment(fullName)  ;
     int const countPosition  = GetCountPositionByComment(fullName);
     int const count          = countPend + countPosition;     
  double const nextLot        = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_LOT].ToDbl() ;
  string const nextComment    = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_COMMENT].ToStr() ; //MainNameOrder+"#"+SubNameOrder;
    //bool const nextTrade      = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_TRADE].ToBool();
  double const nextPrice      = jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_PRICE_OPEN].ToDbl() ;          
  double const nextTP         =  Trall_SS != 0 ? 0 : jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_TAKEPROFIT].ToDbl() ;      
 
// if(  TRADE == false  || (TRADE == true  && count == 0 && ASK - ReSubStep * POINT > nextPrice          )  ){   
//  if(nextPrice > PRICE_ScopeLevel_DN_ASK || ScopeLevel == 0 ) {
//    //--- OPEN SELLSTOP ---
//   
//       }else{
//           jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_TRADE]      = false;
//
//           break;
//       };
//     }else{
//           jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_TRADE]      = false;
//
//           break;
//       };  
//       
     if( count == 0  )
         set_OPEN_SELLSTOP(number, trade, MainNameOrder, SubNameOrder, nextPrice, nextTP, nextLot,nextComment );
   }// конец цикла
  }
 }
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                  START | SCOPE_ON | OPEN SELLSTOP % count =0  %                                 
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if( ScopeLevel != 0) 
 if(SignalOpenSellStop[number] ){  
//if(SignalOpenSellStop[number] || SignalOpenSellStopScope[number]){ 

Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> START | SCOPE_ON | OPEN SELLSTOP % count =0  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );

for(int i=1;i<NUMBER_OF_KNEES;i++){
  
int const kstart = arrStartStop[i][0];
int const kstop  = arrStartStop[i][1];  
if(kstart <10)
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
 
// if(  TRADE == false  || (TRADE == true  && count == 0 && ASK - ReSubStep * POINT > nextPrice          )  ){   
//  if(nextPrice > PRICE_ScopeLevel_DN_ASK || ScopeLevel == 0 ) {
//    //--- OPEN SELLSTOP ---//   
//       }else{
//           jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_TRADE]      = false;//
//           break;
//       };
//     }else{
//           jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_TRADE]      = false;//
//           break;
//       };  
      
  if( count == 0  )

     if (nextPrice > PRICE_ScopeLevel_DN_ASK ){
          set_OPEN_SELLSTOP(number, trade, MainNameOrder, SubNameOrder, nextPrice, nextTP, nextLot,nextComment );
      }else{
         break;
      }  
       
       
   }// конец цикла
  }
 }
 //+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
//|                  TRADE | SCOPE_ON | OPEN SELLSTOP % inScope  %                                 
//+------------------------------------------------------------------------------------------------------------------------------------------------------------------------+
if(SignalOpenSellStopScope[number] ){  
//if(SignalOpenSellStop[number] || SignalOpenSellStopScope[number]){ 

Print(__FUNCTION__, " >>>>>>>>>>>>>>>>>>>>>>>>>>>> TRADE | SCOPE_ON | OPEN SELLSTOP % inScope  % <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< " );

for(int i=1;i<NUMBER_OF_KNEES;i++){
  
int const kstart = arrStartStop[i][0];
int const kstop  = arrStartStop[i][1];  
if(kstart <10)
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



   if( count == 0  )
    if(ASK - ReSubStep * POINT > nextPrice )
     if (nextPrice > PRICE_ScopeLevel_DN_ASK ){
          set_OPEN_SELLSTOP(number, trade, MainNameOrder, SubNameOrder, nextPrice, nextTP, nextLot,nextComment );
      }else{
         break;
      }  
       
       
   }// конец цикла
  }
 }
 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

  SetTRADE_OPEN();
  
 
 
 

 
}