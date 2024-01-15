#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|       Инициализация индикатора                                   |
//+------------------------------------------------------------------+
  int ini_iSto( string          symbol,
               ENUM_TIMEFRAMES  TF,
               int              kperiod,         // K-период (количество баров для расчетов) 
               int              dperiod,         // D-период (период первичного сглаживания) 
               int              slowing,         // окончательное сглаживание 
               ENUM_MA_METHOD   ma_method,       // тип сглаживания                
               ENUM_STO_PRICE   price_field,      // способ расчета стохастика
               bool             hidden  
               ){
     int handle = -1;    
     if(hidden) TesterHideIndicators(true);    
       handle = iStochastic(symbol,TF,kperiod,dperiod,slowing,ma_method,price_field);    
       if(!handle){
          Print( "iStochastic"," error =", GetLastError() );
          return(-1);
         }
       return handle;
     }
//+------------------------------------------------------------------+
//|      Взять массив значений индикатора                                   |
//+------------------------------------------------------------------+
   double   GetSto( const int  handle, 
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
  double   GetSto1(const int  handle, 
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
   bool setArr_iSto(int handle,int buf, int shift, double &arr_ind[] ) {
     if(GetSto(handle,arr_ind, buf , shift , true ))
         return true;
     Print(__FUNCTION__, " GetSto error =  ", GetLastError() );
     return false;
   }  
   //+------------------------------------------------------------------+
   //|                                                                  |
   //+------------------------------------------------------------------+
  bool isStoMain_UP(int number,  int level_UP , int shift  ){
      bool _isSto_UP = false;
     //Получение данных индикаторов
      setArr_iSto(h_Sto[number],0,shift, arr_iStoMain );
      //setArr_iSto(h_Sto[number],1,shift, arr_iStoSignal );
   //+------------------------------------------------------------------+
   //|  Логика индикатора                                               |
   //+------------------------------------------------------------------+  
    ArraySetAsSeries(arr_iStoMain,true);
   //Print(__FUNCTION__, "  ----------------arr_iStoMain[0] = ", arr_iStoMain[0] );
   //Print(__FUNCTION__, "  ----------------arr_iStoMain[1] = ", arr_iStoMain[1] );
   //Print(__FUNCTION__, "  ----------------arr_iStoMain[2] = ", arr_iStoMain[2] );
   //Print(__FUNCTION__, "  ---------------- arr_iStoMain[3]= ", arr_iStoMain[3]);
   
   
    if(arr_iStoMain[shift] > level_UP )  _isSto_UP = true;    
      return _isSto_UP;
  } 
   //+------------------------------------------------------------------+
   //|                                                                  |
   //+------------------------------------------------------------------+
  bool isStoMain_DN(int number, int level_DN , int shift){
      bool _isSto_DN = false;
     //Получение данных индикаторов
      setArr_iSto(h_Sto[number],0,shift, arr_iStoMain );
      //setArr_iSto(h_Sto[number],1,shift, arr_iStoSignal );
   //+------------------------------------------------------------------+
   //|  Логика индикатора                                               |
   //+------------------------------------------------------------------+    
     ArraySetAsSeries(arr_iStoMain,true);
   if(arr_iStoMain[shift] < level_DN)         _isSto_DN = true;      
      return _isSto_DN;
  }   

   //+------------------------------------------------------------------+
   //|                                                                  |
   //+------------------------------------------------------------------+
  bool isStoSignal_UP(int number,  int level_UP , int shift  ){
      bool _isSto_UP = false;
     //Получение данных индикаторов
      //setArr_iSto(h_Sto[number],0,shift, arr_iStoMain );
      setArr_iSto(h_Sto[number],1,shift, arr_iStoSignal );
   //+------------------------------------------------------------------+
   //|  Логика индикатора                                               |
   //+------------------------------------------------------------------+  
   ArraySetAsSeries(arr_iStoSignal,true);
   
   //   Print(__FUNCTION__, "  ----------------arr_iStoSignal[0] = ", arr_iStoSignal[0] );
   //Print(__FUNCTION__, "  ----------------arr_iStoSignal[1] = ", arr_iStoSignal[1] );
   //Print(__FUNCTION__, "  ----------------arr_iStoSignal[2] = ", arr_iStoSignal[2] );
   //Print(__FUNCTION__, "  ---------------- arr_iStoSignal[3]= ", arr_iStoSignal[3]);
   
    if(arr_iStoSignal[shift] > level_UP )  _isSto_UP = true;    
      return _isSto_UP;
  } 
   //+------------------------------------------------------------------+
   //|                                                                  |
   //+------------------------------------------------------------------+
  bool isStoSignal_DN(int number, int level_DN , int shift){
      bool _isSto_DN = false;
     //Получение данных индикаторов
      //setArr_iSto(h_Sto[number],0,shift, arr_iStoMain );
      setArr_iSto(h_Sto[number],1,shift, arr_iStoSignal );
   //+------------------------------------------------------------------+
   //|  Логика индикатора                                               |
   //+------------------------------------------------------------------+    
     ArraySetAsSeries(arr_iStoSignal,true);
   if(arr_iStoSignal[shift] < level_DN)         _isSto_DN = true;      
      return _isSto_DN;
  }    
  
//+------------------------------------------------------------------+
//|       Разрешение торговли при положении стохастика               |
//+------------------------------------------------------------------+
bool isTradeSto_UP(int number, int LevelUP  ){
  bool   _isTradeSto_UP = false;
//  double _GetSto1Main_0  =  GetSto1(h_Sto[number],0,0);
//  double _GetSto1Main_1  =  GetSto1(h_Sto[number],0,1);
//  double _GetSto1Main_2  =  GetSto1(h_Sto[number],0,2);
//
//  double _GetSto1Signal_0  =  GetSto1(h_Sto[number],1,0);
//  double _GetSto1Signal_1  =  GetSto1(h_Sto[number],1,1);
//  double _GetSto1Signal_2  =  GetSto1(h_Sto[number],1,2);

   if( GetSto1(h_Sto[number],0,1)  < LevelUP)      
   _isTradeSto_UP = true;
      return _isTradeSto_UP;
   }   
//+------------------------------------------------------------------+
//|       Разрешение торговли при положении стохастика               |
//+------------------------------------------------------------------+
bool isTradeSto_DN(int number, int LevelDN ){
  bool   _isTradeSto_DN = false;
  double _GetSto1       =  GetSto1(h_Sto[number],0,1);

   if( GetSto1(h_Sto[number],0,1)  > LevelDN)      
   _isTradeSto_DN = true;     
      return _isTradeSto_DN;
   }   






