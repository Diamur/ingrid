#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|       Инициализация индикатора                                   |
//+------------------------------------------------------------------+
  int ini_iCCI(string              symbol,
               ENUM_TIMEFRAMES      TF,
               int                  ma_period,                    // период усреднения 
               ENUM_APPLIED_PRICE   applied_price = PRICE_CLOSE,  // тип цены или handle 
               bool                 hidden = true  
               ){
     int handle = -1;    
     if(hidden) TesterHideIndicators(true);    
       handle = iCCI(symbol,TF,ma_period, applied_price);    
       if(!handle){
          Print( "iCCI"," error =", GetLastError() );
          return(-1);
         }
       return handle;
     }
//+------------------------------------------------------------------+
//|      Взять массив значений индикатора                                   |
//+------------------------------------------------------------------+
   double   GetCCI(const int  handle, 
                  double &arr[],
                  const int  buf=0, 
                  const int  shift=0,
                  const bool arrReturn   = false,
                  const int count =4
                  ){
     double _arr[1] = {0};
      ResetLastError(); 
        if(arrReturn){
           if(CopyBuffer(handle, buf, shift, count , arr) < 0)
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
  double   GetCCI1(const int  handle, 
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
   bool setArr_iCCI(int handle,int buf, int shift, double &arr_ind[] ) {
     if(GetCCI(handle,arr_ind, buf , shift , true ))
         return true;
     Print(__FUNCTION__, " GetCCI error =  ", GetLastError() );
     return false;
   }  
   //+------------------------------------------------------------------+
   //|                                                                  |
   //+------------------------------------------------------------------+
   bool isCCI_UP(int number, int LevelUP , int shift){
      bool _is = false;
     //Получение данных индикаторов
      setArr_iCCI(h_CCI[number],0,0, arr_iCCIMain );
   //+------------------------------------------------------------------+
   //|  Логика индикатора                                               |
   //+------------------------------------------------------------------+  
   if(arr_iCCIMain[shift] > LevelUP )      
      _is = true;      
      return _is;
   }      
   //+------------------------------------------------------------------+
   //|                                                                  |
   //+------------------------------------------------------------------+
   bool isCCI_DN(int number, int LevelUP , int shift){
      bool _is = false;
     //Получение данных индикаторов
      setArr_iCCI(h_CCI[number],0,0, arr_iCCIMain );
   //+------------------------------------------------------------------+
   //|  Логика индикатора                                               |
   //+------------------------------------------------------------------+ 
   if(arr_iCCIMain[shift] < LevelUP)      
   _is = true;      
      return _is;
   }   
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
   void setCCI_TRAND(int number,int shift, int count = 12 ){
      
      CCI_TRAND_UP = false;
      CCI_TRAND_DN = false;
     //Получение данных индикаторов      
     double arr1[] ;
     double arr2[] ;
     double arr3[] ;
     
     //ArrayResize(arr1,count);
     //ArrayResize(arr2,count);
     //ArrayResize(arr3,count);
     
     ArraySetAsSeries(arr1,true);
     ArraySetAsSeries(arr2,true);
     ArraySetAsSeries(arr3,true);
     
     
     //ArrayInitialize(arr1,0);
     //ArrayInitialize(arr2,0);
     //ArrayInitialize(arr3,0);
         
      ResetLastError(); 
        if(CopyBuffer(h_CCI[number], 0, shift, count , arr1) < 0)
            Print( __FUNCTION__, " CopyBuffer arr1"," error =", GetLastError() );

        if(CopyBuffer(h_CCI[number], 0, shift+1, count , arr2) < 0)
            Print( __FUNCTION__, " CopyBuffer arr2"," error =", GetLastError() );

        if(CopyBuffer(h_CCI[number], 0, shift+2, count , arr3) < 0)
            Print( __FUNCTION__, " CopyBuffer arr3 "," error =", GetLastError() );
   //+------------------------------------------------------------------+
   //|  Логика индикатора                                               |
   //+------------------------------------------------------------------+  
   
   double m1 =  MathMean(arr1);
   double m2 =  MathMean(arr2);
   double m3 =  MathMean(arr3);
   
   if(m1 > m2)
     if(m2 >m3)
       CCI_TRAND_UP = true;
       
   if(m1 < m2)
     if(m2 < m3)
       CCI_TRAND_DN = true;

   }  



//+------------------------------------------------------------------+
//| Computes the mean value of the values in array[]                 |
//+------------------------------------------------------------------+
double MathMean(const double &array[])
  {
   int size=ArraySize(array);
//--- check data range
   if(size<1)
      return(0); // need at least 1 observation
//--- calculate mean
   double mean=0.0;
   for(int i=0; i<size; i++)
      mean+=array[i];
   mean=mean/size;
//--- return mean
   return(mean);
  }