#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void TrailingPositions( int number){  
  
     TrailingBUY( arrSymbol[number],
                  Trall[number],
                  StopLoss[number],
                  false,
                  TrallStep[number], 
                  0,
                  false,
                  Magic );
                  
     TrailingSELL(arrSymbol[number],
                  Trall[number],
                  StopLoss[number],
                  false,
                  TrallStep[number], 
                  0,
                  false,
                  Magic ); 
      
  }
  

  
