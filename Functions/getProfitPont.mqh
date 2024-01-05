#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int getProfitPont(double profit, double lots){
  if(lots == 0 ) return 0;
    double point =  profit / lots;
    return (int)( MathFloor(point) );
}