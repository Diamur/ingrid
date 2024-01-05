//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2020, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#include  "..\setting\FilePathMain.mqh"
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetTimeCurrent()
  {
   TimeCurrent(_dt);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void WS_time()
  {
   string _TIME_DATE = TimeToString(TimeCurrent(),TIME_DATE) ;
   W_time_1 = StringToTime(_TIME_DATE+" "+TimeStart);
   W_time_2 = StringToTime(_TIME_DATE+" "+TimeEnd);
   S_time_1 = StringToTime(_TIME_DATE+" "+TimeStartSLMinus);
   S_time_2 = StringToTime(_TIME_DATE+" "+TimeStopSLMinus);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetTimeDAY()
  {
   if(_D1 != iBars(_Symbol,PERIOD_D1))
     {
      _D1 = iBars(_Symbol,PERIOD_D1);
      WS_time();
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool WorkingHour()
  {
   if(TimeStart=="00:00" && TimeEnd=="00:00")
      return(true);// Время не задано (выкл) - разрешаем торговлю
//---
   datetime time_0=TimeCurrent();
// Если НОВЫЙ ДЕНЬ
// SetTimeDAY()
// Если ТЕКУЩИЙ ДЕНЬ
   if(W_time_1 < W_time_2 && W_time_1 <= time_0 && time_0 <= W_time_2)
      _WorkingHour = true;
   else
      if(W_time_1 > W_time_2 && (time_0 >= W_time_2 || time_0 <= W_time_2))
         _WorkingHour = true;
      else
         _WorkingHour = false;
   return _WorkingHour;
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//bool StopLossMinusHour()
//  {
//   if(NoTimeStopLossMinus)
//      return (false);
//   if(TimeStartSLMinus == "00:00" && TimeStopSLMinus =="00:00")
//      return(false);// Время не задано (выкл) - запрет уменьшения СтопЛос
////---
//   datetime time_0=TimeCurrent();
//// Если НОВЫЙ ДЕНЬ
//// SetTimeDAY()
//// Если ТЕКУЩИЙ ДЕНЬ
//   if(S_time_1 < S_time_2 && S_time_1 <= time_0 && time_0 <= S_time_2)
//      _StopLossMinusHour = true;
//   else
//      if(S_time_1 > S_time_2 && (time_0 >= S_time_2 || time_0 <= S_time_2))
//         _StopLossMinusHour = true;
//      else
//         _StopLossMinusHour = false;
//   return _StopLossMinusHour;
//  }  
//+------------------------------------------------------------------+
