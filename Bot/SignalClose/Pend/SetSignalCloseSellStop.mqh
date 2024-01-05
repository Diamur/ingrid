#include  "..\..\..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetSignalCloseSellStop( int number){

SignalCloseSellStop[number] = false; 

if(Status.CloseSELLSTOP[number][STATUS_MAIN_ON]       =  !MAIN_ON ? true: false )
if(Status.CloseSELLSTOP[number][STATUS_NEWBAR]        =  BarReMOVE != iTime(NULL,PERIOD_CURRENT,0) ? true: false )
if(Status.CloseSELLSTOP[number][STATUS_DT_START_STEP] =  getDTPriceMAX_DN(SymbolInfoDouble(NULL,SYMBOL_BID)) > jBUYLIMIT[NAME_BL_0][NAME_SS_0][NAME_FULL_STEP].ToInt() +StepPEND+SymbolInfoInteger(NULL,SYMBOL_SPREAD)  ? true: false )

SignalCloseSellStop[number] = true; 

if(SignalCloseSellStop[number])  {
    //Print(__FUNCTION__, " =============================------------------- = ");
    //Print(__FUNCTION__, " ------------------- getDTPriceMAX_DN(SymbolInfoDouble(NULL,SYMBOL_BID)) = ",getDTPriceMAX_DN(SymbolInfoDouble(NULL,SYMBOL_BID)) );
    //Print(__FUNCTION__, " ------------------- jBUYLIMIT[NAME_BL_0][NAME_SS_0][NAME_FULL_STEP].ToInt() +StepPEND+SymbolInfoInteger(NULL,SYMBOL_SPREAD) = ",jBUYLIMIT[NAME_BL_0][NAME_SS_0][NAME_FULL_STEP].ToInt() +StepPEND+SymbolInfoInteger(NULL,SYMBOL_SPREAD) );
  }

}



