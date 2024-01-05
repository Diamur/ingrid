#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double GetLot(string symbol,
               double minLot,
               double martinMult,  
               int    mult = 1
              ){      
     double lot     = 0;
     double NextLot  = 0;            
            minLot   = minLot < SymbolInfoDouble(symbol,SYMBOL_VOLUME_MIN)?SymbolInfoDouble(symbol,SYMBOL_VOLUME_MIN): minLot;
     double maxLot   = SymbolInfoDouble(symbol,SYMBOL_VOLUME_MAX) ;
            NextLot  = minLot * MathPow( martinMult , mult - 1 );
            lot      = NextLot < maxLot ? NextLot : maxLot ;
    return NormalizeDouble( lot, 2);
}

  
double GetLotBUY( string symbol , double lot  ){      
     double minLot = SymbolInfoDouble(symbol,SYMBOL_VOLUME_MIN) ;
     double maxLot = SymbolInfoDouble(symbol,SYMBOL_VOLUME_MAX) ;
      
     lot = lot < minLot ? minLot: lot; 
         
     double _Lot = CalcVOLUME(symbol,POSITION_TYPE_SELL,Magic) == 0? minLot : CalcVOLUME(symbol,POSITION_TYPE_SELL,Magic); 
            _Lot= _Lot < maxLot ?_Lot : maxLot ;
     return NormalizeDouble( _Lot, 2);
  }
  
double GetLotSELL( string symbol, double lot ){      
     double minLot = SymbolInfoDouble(symbol,SYMBOL_VOLUME_MIN) ;
     double maxLot = SymbolInfoDouble(symbol,SYMBOL_VOLUME_MAX) ;
     
     lot = lot < minLot ? minLot: lot; 
     
     double _Lot = CalcVOLUME(symbol,POSITION_TYPE_BUY,Magic) == 0? lot : CalcVOLUME(symbol,POSITION_TYPE_BUY,Magic); 
            _Lot= _Lot < maxLot ?_Lot : maxLot ;
     return NormalizeDouble( _Lot, 2);
  }
  
  