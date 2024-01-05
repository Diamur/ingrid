#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool IsNewBar(int Number, string symbol, ENUM_TIMEFRAMES timeframe)
{
    //datetime Told[];
    //datetime Tnew[];    
    int Size_ = 0;    

    CopyTime(symbol, timeframe, 0, 1, Tnew);
    if(Tnew[0] != Told[Number])
    {
        Told[Number] = Tnew[0];
        countbars++;
        return(true);
    }
  
    return(false);
}