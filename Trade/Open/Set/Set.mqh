#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void set_OPEN_BUYLIMIT(
                          int number,
                       CTrade &trade[],
                       string NameOrder,
                       double nextPrice,
                       double nextLot,                       
                       string nextComment
                       ){
 
       int const tiket = OpenBuyLimit(number,
                                     trade,
                                     _Symbol,
                                     nextLot, 
                                     NormalizeDouble( nextPrice , DIGIT ),
                                     0,
                                     0,
                                     nextComment 
                                     );
        if( tiket != -1 ){
          jBUYLIMIT[NameOrder][NAME_TICKET]     = tiket;                      
          //---
          if(nextPrice > PriceMAX_DN || PriceMAX_DN == 0) PriceMAX_DN = nextPrice;
          if(nextPrice < PriceMIN_DN || PriceMIN_DN == 0) PriceMIN_DN = nextPrice; 
         //---
          }else
           Print(__FUNCTION__, "  errror OpenBuyLimit " ); 

}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void set_OPEN_SELLLIMIT(
                          int number,
                       CTrade &trade[],
                       string NameOrder,
                       double nextPrice,
                       double nextLot,                       
                       string nextComment
                       ){
 
       int const tiket = OpenSellLimit(number,
                                     trade,
                                     _Symbol,
                                     nextLot, 
                                     NormalizeDouble( nextPrice , DIGIT ),
                                     0,
                                     0,
                                     nextComment 
                                     );
        if( tiket != -1 ){
          jSELLLIMIT[NameOrder][NAME_TICKET]     = tiket;                      
          //---
          if(nextPrice > PriceMAX_UP || PriceMAX_UP == 0) PriceMAX_UP = nextPrice;
          if(nextPrice < PriceMIN_UP || PriceMIN_UP == 0) PriceMIN_UP = nextPrice; 
         //---
          }else
           Print(__FUNCTION__, "  errror OpenSellLimit " ); 

}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void set_OPEN_SELLSTOP(
                          int number,
                       CTrade &trade[],
                       string MainNameOrder,
                       string SubNameOrder,                       
                       double nextPrice,
                       double nextTP,                       
                       double nextLot,                       
                       string nextComment
                       ){
 
int const tiket = OpenSellStop(number,
                              trade,
                              arrSymbol[number],
                              nextLot, 
                              NormalizeDouble( nextPrice , DIGIT  ),
                              0,
                              nextTP,
                              nextComment
                              );
   if(tiket != -1 ){
          jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_TICKET]     = tiket;
          jBUYLIMIT[MainNameOrder][SubNameOrder][NAME_TRADE]      = true;
          
          jData.Clear();
          jData[NAME_MAIN] = MainNameOrder;
          jData[NAME_SUB]  = SubNameOrder;
          jTicket[(string)tiket].Set(jData) ;
          //---
          if(nextPrice > PriceMAX_DN || PriceMAX_DN == 0) PriceMAX_DN = nextPrice;
          //---
          if(nextPrice < PriceMIN_DN || PriceMIN_DN == 0) PriceMIN_DN = nextPrice;        
         }else
            Print(__FUNCTION__, "  errror OpenSellStop " ); 
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void set_OPEN_BUYSTOP(
                          int number,
                       CTrade &trade[],
                       string MainNameOrder,
                       string SubNameOrder,                       
                       double nextPrice,
                       double nextTP,                       
                       double nextLot,                       
                       string nextComment
                       ){
 
int const tiket = OpenBuyStop(number,
                              trade,
                              arrSymbol[number],
                              nextLot, 
                              NormalizeDouble( nextPrice , DIGIT  ),
                              0,
                              nextTP,
                              nextComment
                              );
   if(tiket != -1 ){
          jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_TICKET]     = tiket;
          jSELLLIMIT[MainNameOrder][SubNameOrder][NAME_TRADE]      = true;
          
          jData.Clear();
          jData[NAME_MAIN] = MainNameOrder;
          jData[NAME_SUB]  = SubNameOrder;
          jTicket[(string)tiket].Set(jData) ;
          //---
          if(nextPrice > PriceMAX_UP || PriceMAX_UP == 0) PriceMAX_UP = nextPrice;
          //---
          if(nextPrice < PriceMIN_UP || PriceMIN_UP == 0) PriceMIN_UP = nextPrice;        
         }else
            Print(__FUNCTION__, "  errror OpenSellStop " ); 
}