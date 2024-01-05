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
          if(nextPrice > PriceMAX_DN || PriceMAX_DN == 0) PriceMAX_DN = nextPrice;
          if(nextPrice < PriceMIN_DN || PriceMIN_DN == 0) PriceMIN_DN = nextPrice; 
         //---
          }else
           Print(__FUNCTION__, "  errror OpenSellLimit " ); 

}
