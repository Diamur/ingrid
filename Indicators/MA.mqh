#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|       Инициализация индикатора                                   |
//+------------------------------------------------------------------+
  int ini_iMA( string               symbol,
               ENUM_TIMEFRAMES      TF,
               int                  ma_period,
               ENUM_MA_METHOD       ma_method,
               ENUM_APPLIED_PRICE   applied_price,         
               bool   hidden 
               ){
     int handle = -1;    
     if(hidden) TesterHideIndicators(true);    
       handle = iMA(symbol,TF,ma_period,0,ma_method,applied_price);    
       if(!handle){
          Print( "iMA"," error =", GetLastError() );
          return(-1);
         }
       return handle;
     }
//+------------------------------------------------------------------+
//|      Взять значение индикатора                                   |
//+------------------------------------------------------------------+
   double   GetMA(const int  handle, 
                  double &arr[],
                  const int  buf=0, 
                  const int  shift=0,
                  const bool arrReturn   = false
                  ){
     double _arr[1] = {0};
      ResetLastError(); 
        if(arrReturn){
           if(CopyBuffer(handle, buf, shift, 4 , arr) < 0)
           {
            Print( __FUNCTION__, " CopyBuffer "," error =", GetLastError() );
            return(0);
           }
           _arr[0] = arr[0];
         } 
        else 
          if(CopyBuffer(handle, buf, shift, 1, _arr) < 0){
             Print( __FUNCTION__, " CopyBuffer "," error =", GetLastError() );
             return(0);
          }
       return (_arr[0]);
   }
   //+------------------------------------------------------------------+
//|      Взять одно значение индикатора                                                            |
//+------------------------------------------------------------------+
  double   GetMA1(const int  handle, 
                   const int  buf=0, 
                   const int  shift=0
                  ){
     double _arr[1] = {0};
      ResetLastError(); 
          if(CopyBuffer(handle, buf, shift, 1, _arr) < 0){
             Print( __FUNCTION__, " CopyBuffer "," error =", GetLastError() );
             return(0);
          }
       return (_arr[0]);
   }
   //+------------------------------------------------------------------+
   //|        Установить массив значений                                |
   //+------------------------------------------------------------------+
   bool setArr_iMA(int handle, double &arr_ind[] ) {
     if(GetMA(handle,arr_ind, 0 ,0 , true ))
         return true;
     Print(__FUNCTION__, " GetMA error =  ", GetLastError() );
     return false;
   }  
   //+------------------------------------------------------------------+
   //|                                                                  |
   //+------------------------------------------------------------------+
   bool isMA_UP(int handle,int number,int shift){
      bool _isMA_UP = false;
     //Получение данных индикаторов
      setArr_iMA(handle /*h_iMA[number]*/, arr_iMA );
     //+------------------------------------------------------------------+
     //|  Логика индикатора                                               |
     //+------------------------------------------------------------------+    
      //if(arr_iMA[0+shift]-arr_iMA[1+shift] > 0 && arr_iMA[1+shift]-arr_iMA[2+shift] > 0  ) _isMA_UP = true;      
      if(arr_iMA[0+shift] > arr_iMA[1+shift] && arr_iMA[1+shift] > arr_iMA[2+shift] ) _isMA_UP = true;      
      
      //
      return _isMA_UP;
   } 
   //+------------------------------------------------------------------+
   //|                                                                  |
   //+------------------------------------------------------------------+
   bool isMA_DN(int handle,int number,int shift){
      bool _isMA_DN = false;
     //Получение данных индикаторов
      setArr_iMA(handle/*h_iMA[number]*/, arr_iMA );
     //+------------------------------------------------------------------+
     //|  Логика индикатора                                               |
     //+------------------------------------------------------------------+    
      //if(arr_iMA[0+shift]-arr_iMA[1+shift] < 0 && arr_iMA[1+shift]-arr_iMA[2+shift] < 0  ) _isMA_DN = true;      
      if(arr_iMA[0+shift] < arr_iMA[1+shift] && arr_iMA[1+shift] < arr_iMA[2+shift] ) _isMA_DN = true;      
      
      //
      return _isMA_DN;
   }   

    //double MA[] ;
    //ArraySetAsSeries(MA,true);    
    //if( GetMA(hMA,MA,MAIN_LINE,0,true)){
    //  MA_0 = MA[0];
    //  MA_1 = MA[1];
    //  MA_2 = MA[2];      
    //};
 





