#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void Log_Sto(int number){
 
   _addInfoLine();
   
   
   
   double sto0 =  GetSto1(h_Sto[number],0,0);
   double sto1 =  GetSto1(h_Sto[number],0,1);
   double sto2 =  GetSto1(h_Sto[number],0,2);

  
   _addInfo("sto0 = ", (string)( DoubleToString(sto0,0)) );
   _addInfo("sto1 = ", (string)( DoubleToString(sto1,0)) );
   _addInfo("sto2 = ", (string)( DoubleToString(sto2,0)) );
   
  
  //  sizeArrStoMain = ArraySize(arr_iStoMain);
  // _addInfo("sizeArrStoMain = ", (string)(sizeArrStoMain));
  
 //  if(sizeArrStoMain>0)
  // _addInfo("arr_iStoMain[0] = ", (string)(arr_iStoMain[0]));
  
 // sizeArrStoSignal = ArraySize(arr_iStoSignal);
 //   _addInfo("sizeArrStoSignal = ", (string)(sizeArrStoSignal)); 
 //  if(ArraySize(arr_iStoSignal) > 0  )   
 //  _addInfo("arr_iStoSignal[0] = ", (string)(arr_iStoSignal[0]));

   _addInfoLine();
      
   //Comment(info);

}
  
 