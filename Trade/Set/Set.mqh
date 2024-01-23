#include  "..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void setTP_SL_Positions( int ticket,  double sl, double tp){
             
//              Print(__FUNCTION__, ">>>>>>>>>>>>> ticket = ", ticket ); 
//              Print(__FUNCTION__, ">>>>>>>>>>>>> tp = ", tp ); 
//              Print(__FUNCTION__, ">>>>>>>>>>>>> sl = ", sl ); 
//              
             
            a_trade[0].PositionModify(ticket, NormalizeDouble( sl,DIGIT), NormalizeDouble( tp ,DIGIT) );

}