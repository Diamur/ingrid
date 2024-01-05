#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetText(
            string    symbol,
            string    name = "",
            datetime  time1 = 0,
            double    price1 = 0 , 
            string    text  =  "",                
            color     colorText = clrRed,
            bool      select = false,
            double    angle =0
            ){
    
    double Ask = NormalizeDouble( SymbolInfoDouble(symbol,SYMBOL_ASK), (int)SymbolInfoInteger(symbol,SYMBOL_DIGITS) );if(time1  == 0 ) time1  = iTime(symbol,PERIOD_CURRENT,0);
    if(name == "" ) name = "Text1";
    if(price1 == 0 ) price1 = iClose(symbol,PERIOD_CURRENT,0) + 100*SymbolInfoDouble(symbol,SYMBOL_POINT);
    if(text == "" )  text   = DoubleToString(Ask,(int)SymbolInfoInteger(symbol,SYMBOL_DIGITS)); 
   
   if(ObjectFind(0, name) < 0)
      ObjectCreate(0,name, OBJ_TEXT,0,0,0);
      ObjectSetInteger(0, name, OBJPROP_TIME, time1);
      ObjectSetDouble (0, name, OBJPROP_PRICE, price1);      
      ObjectSetInteger(0, name, OBJPROP_COLOR, colorText);
      ObjectSetInteger(0, name, OBJPROP_SELECTABLE, true);         
      ObjectSetInteger(0, name, OBJPROP_SELECTED, select);
      ObjectSetInteger(0, name, OBJPROP_FONTSIZE, 12);        
      ObjectSetString (0, name ,OBJPROP_TEXT, 0, text);
      ObjectSetDouble (0, name, OBJPROP_ANGLE, angle);  
}



void setTextSignal(
                   int    number,
                   string name,
                   double price, 
                   int &countTXT[],
                   color clr
                  ){

     //int    numberPos = ++_countTXT_SELLLIMIT[ number] ;
     int    numberPos = ++countTXT[ number] ;
     
    string _symbol   = arrSymbol[number];    
    double _point    = SymbolInfoDouble (_symbol,SYMBOL_POINT);
    int    _digit       = (int)SymbolInfoInteger(_symbol,SYMBOL_DIGITS);



    double _iOpen    = iOpen (_symbol,PERIOD_CURRENT,1) ;
    double _iClose   = iClose(_symbol,PERIOD_CURRENT,1) ;
    double _iHigh    = MathMax( iHigh (_symbol,PERIOD_CURRENT,0) , iHigh (_symbol,PERIOD_CURRENT,1) );
    double _iLow     = MathMin( iLow  (_symbol,PERIOD_CURRENT,0) , iLow  (_symbol,PERIOD_CURRENT,1) );
    

    double dtprice   =  _iOpen < _iClose ? (-1) * _point: _point  ;
   
    string nameNumber   = name + "_Number_" + (string)(numberPos );  
    string namePos      = name + "_Pos_" + (string)(numberPos );  
    string nameValuePos = name + "_ValuePos_" + (string)(numberPos );  
    
    double priceValuePos=  _iOpen < _iClose ?_iLow + 60 * dtprice : _iHigh + 60 * dtprice ;
    double pricePos     =  priceValuePos + 32 * dtprice ;
    double priceNumber  =  pricePos + 30 * dtprice;
        
    string textNumber   = "#" + (string)(numberPos); 
    string textPos      = name ; 
    string textValuePos = DoubleToString( price  , _digit) ; 

    SetText( _symbol , nameNumber   ,0,priceNumber   ,textNumber  , clr, false ) ;
    SetText( _symbol , namePos      ,0,pricePos      ,textPos     , clr, false ) ;
    //SetText( _symbol , nameValuePos ,0,priceValuePos ,textValuePos, clr, true ) ;

}
 
void setText1( string _symbol,
               string text1,
               string text2,
               string text3,                   
                color clr
              ){
      
    double _point    = SymbolInfoDouble (_symbol,SYMBOL_POINT);
    int    _digit       = (int)SymbolInfoInteger(_symbol,SYMBOL_DIGITS);

    double _iOpen    = iOpen (_symbol,PERIOD_CURRENT,1) ;
    double _iClose   = iClose(_symbol,PERIOD_CURRENT,1) ;
    double _iHigh    = MathMax( iHigh (_symbol,PERIOD_CURRENT,0) , iHigh (_symbol,PERIOD_CURRENT,1) );
    double _iLow     = MathMin( iLow  (_symbol,PERIOD_CURRENT,0) , iLow  (_symbol,PERIOD_CURRENT,1) );

    double dtprice   =  _iOpen < _iClose ? (-1) * _point: _point  ;
   
    string name1     = "T" + (string)(++_countTXT) ;  
    string name2     = "T" + (string)(++_countTXT) ;
    string name3     = "T" + (string)(++_countTXT) ;  
    
    double price1    =  _iOpen < _iClose ?_iLow + 60 * dtprice : _iHigh + 60 * dtprice ;
    double price2    =  price1 + 32 * dtprice ;
    double price3    =  price2 + 30 * dtprice;

    SetText( _symbol , name1 ,0,price1 ,text1 , clr, true ) ;
   // SetText( _symbol , name2 ,0,price2 ,text2 , clr, false ,90) ;
  //  SetText( _symbol , name3 ,0,price3 ,text3 , clr, false ) ;

}
 
void setText2( string _symbol,
               string text1,
               int   dt_intprice,
               color clr
              ){

      
    double _point    = SymbolInfoDouble (_symbol,SYMBOL_POINT);
    int    _digit    = (int)SymbolInfoInteger(_symbol,SYMBOL_DIGITS);

    double _iHigh    = MathMax( iHigh (_symbol,PERIOD_CURRENT,0) , iHigh (_symbol,PERIOD_CURRENT,1) );
    double _iLow     = MathMin( iLow  (_symbol,PERIOD_CURRENT,0) , iLow  (_symbol,PERIOD_CURRENT,1) );
    
   
    string name1      = "T" + (string)(++_countTXT) ;  
    
    double price1    =  dt_intprice <  0 ? _iLow + dt_intprice * _point : _iHigh + dt_intprice * _point ;

    SetText( _symbol , name1 ,0,price1 ,text1 , clr, true ) ;

}
 
void setTextNAME( string _symbol,
                  string name1, 
                  string text1,
                  int   dt_intprice,
                  color clr
              ){      
    double _point    = SymbolInfoDouble (_symbol,SYMBOL_POINT);
    int    _digit    = (int)SymbolInfoInteger(_symbol,SYMBOL_DIGITS);

    double _iHigh    = MathMax( iHigh (_symbol,PERIOD_CURRENT,0) , iHigh (_symbol,PERIOD_CURRENT,1) );
    double _iLow     = MathMin( iLow  (_symbol,PERIOD_CURRENT,0) , iLow  (_symbol,PERIOD_CURRENT,1) );
    //string name1      = "T" + (string)(++_countTXT) ;  
    
    double price1    =  dt_intprice <  0 ? _iLow + dt_intprice * _point : _iHigh + dt_intprice * _point ;
    
    name1 = (string)((int)iTime(_symbol,PERIOD_CURRENT,0 ) );

    SetText( _symbol , name1 ,0,price1 ,text1 , clr, true ) ;
} 
 
 
void setTextProfit( int number  ){
    int dt_price   = 30; 
    int dt_timebar = -1;  
   // double _point  = SymbolInfoDouble (arrSymbol[number],SYMBOL_POINT);
    double _ASK    = SymbolInfoDouble (arrSymbol[number],SYMBOL_ASK) + (dt_price + SymbolInfoInteger(arrSymbol[number],SYMBOL_SPREAD)) * SymbolInfoDouble (arrSymbol[number],SYMBOL_POINT) ;
    double _BID    = SymbolInfoDouble (arrSymbol[number],SYMBOL_BID) - (dt_price + SymbolInfoInteger(arrSymbol[number],SYMBOL_SPREAD)) * SymbolInfoDouble (arrSymbol[number],SYMBOL_POINT);
    
    double profit       = AccountInfoDouble(ACCOUNT_PROFIT);
    string TextProfit   =  DoubleToString( profit ,  2) ;
   
    color clr      = profit > 0 ? clrGreen: clrRed ;
    double price1  =  0;
    
   //string VolumeBUY = DoubleToString(  CalcVOLUME( arrSymbol[number],POSITION_TYPE_BUY, Magic) , 2);
   //string VolumeSELL =DoubleToString(  CalcVOLUME( arrSymbol[number],POSITION_TYPE_SELL, Magic), 2);
   
   string Volume = _count_BUY [number] > 0?  DoubleToString(  CalcVOLUME( arrSymbol[number],POSITION_TYPE_BUY, Magic) , 2): 
                                             DoubleToString(  CalcVOLUME( arrSymbol[number],POSITION_TYPE_SELL, Magic), 2) ;
    
   int      PipsMainBUY   = GetPipsProfitMainBUY();
   double   ProfitMainBUY = GetProfitMainBUY();
   double   VolumeMainBUY = GetVolumeMainBUY();
   
   int      PipsALL   = GetPipsProfit();
   double   ProfitAll = GetProfit();
   double   VolumeAll = MathAbs(GetVolume()) ;      
   
    clr      = ProfitMainBUY > 0 ? clrGreen: clrRed ;
    clr      = ProfitAll > 0 ? clrGreen: clrRed ; 
    
    
  // string text1 = " PRF: " + DoubleToString( ProfitMainBUY, 2) + " | LOT: " + DoubleToString( VolumeMainBUY,2) + "  | Pips: " + (string)PipsMainBUY + "  | PipsALL: " + (string)PipsMainBUY + "  "  ; 
   string text1 = " PRF: " + DoubleToString( ProfitAll, 2) + " | LOT: " + DoubleToString( VolumeAll,2) + "  | Pips: " + (string)PipsMainBUY + "  | PipsALL: " + (string)PipsALL + "  "  ; 
  
   
   price1 = _ASK;

   datetime _iTime = (datetime)( (int)( iTime(arrSymbol[number],PERIOD_CURRENT,0) ) + dt_timebar *  _Period * 60 );
    
  if(profit !=0 )
         SetText( arrSymbol[number] , "Profit" , _iTime ,price1 ,text1 , clr, true ) ;   
  else
    ObjectDelete(0, "Profit" );  
 
}
 

void SetTextLabel(){
   int str                 = 0;
   int pos                 = 0;
   int corner              = 3;
   int anchor              = 7;
   //+------------------------------------------------------------------+
   double _ASK             = SymbolInfoDouble (NULL,SYMBOL_ASK) ; 
   double _BID             = SymbolInfoDouble (NULL,SYMBOL_BID) ;    
  //---
   double profit           = AccountInfoDouble(ACCOUNT_PROFIT);
    color clrProfit        = profit > 0 ? clrLime: clrRed ;
   double VolumeBUY        = GetVolumeBUY() ;      
   double VolumeSELL       = GetVolumeSELL() ;
   double VolumeAll        = VolumeBUY-VolumeSELL;
      int PipsALL          = GetPipsProfit();
   //double ProfitAll        = GetProfit();
      //int CountBUY          = GetCountPositionByType(POSITION_TYPE_BUY);
      //int CountSELL         = GetCountPositionByType(POSITION_TYPE_SELL);
   //---
   string StrProfit         = DoubleToString(profit ,  2) ;
   string StrVolumeBUY      = DoubleToString(GetVolumeBUY(), 2) ; //: 
   string StrVolumeSELL     = DoubleToString(GetVolumeSELL(), 2); //; 
   string StrVolumeAll      = DoubleToString(VolumeAll, 2); //; 
  //---
  //---  DN
      int PipsMainBUY       = GetPipsProfitMainBUY();
   double ProfitMainBUY     = GetProfitMainBUY();
   double VolumeMainBUY     = GetVolumeMainBUY();
   
      int PipsBUY           = GetPipsProfitBUY();
      int PipsSELL          = GetPipsProfitSELL();
   string strVECTOR         = PipsALL > 0  && VolumeAll > 0 ?  "UP" : (  PipsALL > 0  && VolumeAll < 0 ? "DN":"--" );
    color clrVECTOR         = strVECTOR == "UP" ? clrAqua : (strVECTOR == "DN" ? clrOrangeRed :  clrOlive)  ;
    
//+------------------------------------------------------------------+
          BALANCE             = AccountInfoDouble(ACCOUNT_BALANCE);
          EQITY               = AccountInfoDouble(ACCOUNT_EQUITY);
   double DT_EQ_BAL_START     = EQITY-BALANCE_START;     //---
   string strBALANCE          = DoubleToString(BALANCE,2);   
   string strEQITY            = DoubleToString(EQITY,2); 
   string strDT_EQ_BAL_START  = DoubleToString(DT_EQ_BAL_START,2);  
   string strBALANCE_START    = DoubleToString(BALANCE_START,2); 
   
   string strSTOPLOSS_SL      = DoubleToString(STOPLOSS_SL, DIGIT );
   string strSTOPLOSS_BL      = DoubleToString(STOPLOSS_BL, DIGIT );
   
   //string strPRICE_TRALL_NULL_BL = DoubleToString(PRICE_TRALL_NULL_BL, DIGIT );
   //string strPRICE_TRALL_OPEN_BL = DoubleToString(PRICE_TRALL_OPEN_BL, DIGIT );
   //string strPRICE_TRALL_FULL_BL = DoubleToString(PRICE_TRALL_FULL_BL, DIGIT );  
  
//   string strDT_NULL_OPEN     = DoubleToString(DT_NULL_OPEN, 0 );  
//   string strDT_OPEN_FULL     = DoubleToString(DT_OPEN_FULL, 0 );  
//   
//   string strLAST_PROFIT      = DoubleToString(LAST_PROFIT, 2 );  
//   string strLAST_PipsPROFIT  = DoubleToString(LAST_PipsPROFIT, 0 );       
   
   
    //SetTRALL_VECTOR( _ASK, _BID, TRALL, TRALL_Step, PipsALL, STOPLOSS_UP,STOPLOSS_DN, strVECTOR, "TRALL_NULL",  "TRALL_OPEN", "TRALL_FULL");
     
   
    color clrSTOPLOSS_SL = STOPLOSS_SL > 0 ? clrRed : clrWhite ;
    color clrSTOPLOSS_BL = STOPLOSS_BL > 0 ? clrRed : clrWhite ;                     
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//GetPipsDT_StartStep_DN() > StartStep + SymbolInfoInteger(NULL,SYMBOL_SPREAD) 

//string strDT_StartStep_DN = (string)GetPipsDT_StartStep_DN();
//string strStartStep_SPREAD = (string) (StartStep + SymbolInfoInteger(NULL,SYMBOL_SPREAD)) ;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

    int dtx = 15;
    int fsz = FONT_Size;  
    
 if(Panel_ON)   {
    
   
   //+------------------------------------------------------------------+
   SetLabel(_Symbol, arrNameObject[str][2] , "BALANCE"          ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  strBALANCE        ,fsz, arrXLabel[str][0], arrYLabel[str], clrYellow,corner,anchor,false); 
 str++;
   SetLabel(_Symbol, arrNameObject[str][2] , "BALANCE_START"    ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  strBALANCE_START  ,fsz, arrXLabel[str][0], arrYLabel[str], clrMagenta,corner,anchor,false); 
 str++;
   SetLabel(_Symbol, arrNameObject[str][2] , "EQITY"            ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  strEQITY          ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 str++;
   SetLabel(_Symbol, arrNameObject[str][2] , "DT_EQ_BAL_START"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , strDT_EQ_BAL_START ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 str++;
 
 
 SetLabel(_Symbol, arrNameObject[str][0] , "----------------------------------------------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 str++;
   SetLabel(_Symbol, arrNameObject[str][1] , "PROFIT"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  StrProfit        ,fsz, arrXLabel[str][0], arrYLabel[str], clrProfit,corner,anchor,false); 
   str++;  
 //   SetLabel(_Symbol, arrNameObject[str][1], "LAST_PROFIT"     ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
 //  SetLabel(_Symbol, arrNameObject[str][0] ,  strLAST_PROFIT   ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 //str++;  
 //  SetLabel(_Symbol, arrNameObject[str][1] , "LAST_PipsPROFIT" ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
 //  SetLabel(_Symbol, arrNameObject[str][0] , strLAST_PipsPROFIT,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 //str++;
 SetLabel(_Symbol, arrNameObject[str][0] , "----------------------------------------------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 str++;
   SetLabel(_Symbol, arrNameObject[str][1] , "PipsALL"         ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  (string)PipsALL  ,fsz, arrXLabel[str][0], arrYLabel[str], clrProfit,corner,anchor,false); 
 str++; 
   SetLabel(_Symbol, arrNameObject[str][1] , "LOT ALL"         ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  StrVolumeAll     ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 str++;  

  SetLabel(_Symbol, arrNameObject[str][1] ,  "Pips_BS"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)(GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_BS))        ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 str++;  
  SetLabel(_Symbol, arrNameObject[str][1] ,  "Pips_SL"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)(GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_SL))        ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 str++;  
  SetLabel(_Symbol, arrNameObject[str][1] ,  "Pips_BL"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)(GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_BL))        ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 str++;  

  SetLabel(_Symbol, arrNameObject[str][1] ,  "Pips_SS"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  (string)(GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_SS))        ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 str++;  
   
   
   
 // SetLabel(_Symbol, arrNameObject[str][1] ,  "VECTOR"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
 //  SetLabel(_Symbol, arrNameObject[str][0] ,  strVECTOR        ,fsz, arrXLabel[str][0], arrYLabel[str], clrVECTOR,corner,anchor,false); 
 //str++;  
   
 if(Trall_SL != 0){
   SetLabel(_Symbol, arrNameObject[str][1] , "STOPLOSS_SL"     ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  strSTOPLOSS_SL   ,fsz, arrXLabel[str][0], arrYLabel[str], clrSTOPLOSS_SL,corner,anchor,false); 
 str++;  
 }
 if(Trall_BL != 0){ 
   SetLabel(_Symbol, arrNameObject[str][1] , "STOPLOSS_BL"     ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  strSTOPLOSS_BL   ,fsz, arrXLabel[str][0], arrYLabel[str], clrSTOPLOSS_BL,corner,anchor,false); 
 str++;     
  }
  
//   SetLabel(_Symbol, arrNameObject[str][1] , "PRICE_TRALL_NULL"         ,10, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
//   SetLabel(_Symbol, arrNameObject[str][0] ,  strPRICE_TRALL_NULL  ,10, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
// str++;  
//   
//   SetLabel(_Symbol, arrNameObject[str][1] , "DT_NULL_OPEN"         ,10, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
//   SetLabel(_Symbol, arrNameObject[str][0] ,  strDT_NULL_OPEN  ,10, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
// str++;  
//   SetLabel(_Symbol, arrNameObject[str][1] , "PRICE_TRALL_OPEN"         ,10, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
//   SetLabel(_Symbol, arrNameObject[str][0] ,  strPRICE_TRALL_OPEN  ,10, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
// str++;  
//    SetLabel(_Symbol, arrNameObject[str][1] , "DT_OPEN_FULL"         ,10, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
//   SetLabel(_Symbol, arrNameObject[str][0] ,  strDT_OPEN_FULL  ,10, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
// str++;  
//   SetLabel(_Symbol, arrNameObject[str][1] , "PRICE_TRALL_FULL"         ,10, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
//   SetLabel(_Symbol, arrNameObject[str][0] ,  strPRICE_TRALL_FULL  ,10, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
// str++;  
// 
 //   SetLabel(_Symbol, arrNameObject[str][0] , "--------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 //str++;
 //  SetLabel(_Symbol, arrNameObject[str][1] , "PipsBUY"         ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
 //  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)PipsBUY  ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 //str++;   
 //   SetLabel(_Symbol, arrNameObject[str][1] , "LOT BUY"         ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
 //  SetLabel(_Symbol, arrNameObject[str][0] ,  StrVolumeBUY     ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 //str++;
 //    SetLabel(_Symbol, arrNameObject[str][0] , "--------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 //str++;
 //  SetLabel(_Symbol, arrNameObject[str][1] , "PipsSELL"         ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
 //  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)PipsSELL  ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 //str++;   
 //  SetLabel(_Symbol, arrNameObject[str][1] , "LOT SELL"        ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
 //  SetLabel(_Symbol, arrNameObject[str][0] ,  StrVolumeSELL    ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 //str++;
 
 //+------------------------------------------------------------------+
 //|                                                                  |
 //+------------------------------------------------------------------+
 
   SetLabel(_Symbol, arrNameObject[str][0] , "----------------------------------------------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 str++;
 //  SetLabel(_Symbol, arrNameObject[str][2] , "DT_StartStep_DN"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
 //  SetLabel(_Symbol, arrNameObject[str][0] , strDT_StartStep_DN ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 //str++;
 //  SetLabel(_Symbol, arrNameObject[str][2] , "StartStep+SPREAD"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
 //  SetLabel(_Symbol, arrNameObject[str][0] , strStartStep_SPREAD ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 //str++; 
 //  SetLabel(_Symbol, arrNameObject[str][0] , "----------------------------------------------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 //str++;
 
//   SetLabel(_Symbol, arrNameObject[str][2] , "STATUS_TRADE"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
//   SetLabel(_Symbol, arrNameObject[str][0] , (string)(TRADE) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
// str++;
//   SetLabel(_Symbol, arrNameObject[str][2] , "STATUS_MAIN_ON"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
//   SetLabel(_Symbol, arrNameObject[str][0] , (string)( MAIN_ON ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
// str++;
//   SetLabel(_Symbol, arrNameObject[str][2] , "STATUS_PEND"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false);
//   SetLabel(_Symbol, arrNameObject[str][0] , (string)( jBUYLIMIT[NAME_BL_0][NAME_STATUS].ToStr() == NAME_STATUS_PEND ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
// str++;
//   SetLabel(_Symbol, arrNameObject[str][2] , "STATUS_DT_START_STEP"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
//   SetLabel(_Symbol, arrNameObject[str][0] , (string)( GetPipsDT_StartStep_DN() > StartStep + SymbolInfoInteger(NULL,SYMBOL_SPREAD)) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
// str++;
//   SetLabel(_Symbol, arrNameObject[str][2] , "STATUS_NEWBAR"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
//   SetLabel(_Symbol, arrNameObject[str][0] , (string)(BarReMOVE != iTime(NULL,PERIOD_CURRENT,0)) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
// str++; 
//    SetLabel(_Symbol, arrNameObject[str][0] , "----------------------------------------------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
// str++;
 
 //   SetLabel(_Symbol, arrNameObject[str][2] , "TRADE"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
 //  SetLabel(_Symbol, arrNameObject[str][0] , (string)(TRADE) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 //str++;
 //   SetLabel(_Symbol, arrNameObject[str][2] , "TRADE_MAIN_UP"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
 //  SetLabel(_Symbol, arrNameObject[str][0] , (string)(TRADE_MAIN_UP) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 //str++;
 //   SetLabel(_Symbol, arrNameObject[str][2] , "TRADE_MAIN_DN"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
 //  SetLabel(_Symbol, arrNameObject[str][0] , (string)(TRADE_MAIN_DN) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 //str++;
 //   SetLabel(_Symbol, arrNameObject[str][2] , "TRADE_SUB_UP"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
 //  SetLabel(_Symbol, arrNameObject[str][0] , (string)(TRADE_SUB_UP) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 //str++;
 //   SetLabel(_Symbol, arrNameObject[str][2] , "TRADE_SUB_DN"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
 //  SetLabel(_Symbol, arrNameObject[str][0] , (string)(TRADE_SUB_DN) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 //str++;

 //    SetLabel(_Symbol, arrNameObject[str][0] , "----------------------------------------------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 //str++;
 
//    SetLabel(_Symbol, arrNameObject[str][2] , "STATUS_NEWBAR"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
//   SetLabel(_Symbol, arrNameObject[str][0] ,  (string)(BarReMOVE != iTime(NULL,PERIOD_CURRENT,0) ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
// str++;
//    SetLabel(_Symbol, arrNameObject[str][2] , "STATUS_SCOPE_LEVEL"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
//   SetLabel(_Symbol, arrNameObject[str][0] ,  (string)( isPriceOutScopeLevelPend_DN( PRICE_ScopeLevel_DN_BID - 3*POINT ) ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
// str++;
// 
//    SetLabel(_Symbol, arrNameObject[str][2] , "Price_SCOPE"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
//   SetLabel(_Symbol, arrNameObject[str][0] ,  DoubleToString(  PRICE_ScopeLevel_DN_BID - 3*POINT ,DIGIT) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
// str++;
 
 //  SetLabel(_Symbol, arrNameObject[str][2] , "ASK"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
 //  SetLabel(_Symbol, arrNameObject[str][0] ,  DoubleToString( _ASK ,DIGIT) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 //str++;
// 
//   SetLabel(_Symbol, arrNameObject[str][2] , "BID"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
//   SetLabel(_Symbol, arrNameObject[str][0] ,  DoubleToString( _BID ,DIGIT) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
// str++;
// 
//     SetLabel(_Symbol, arrNameObject[str][2] , "ScopeLevel_DN_BID"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
//   SetLabel(_Symbol, arrNameObject[str][0] ,  DoubleToString( PRICE_ScopeLevel_DN_BID ,DIGIT) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
// str++;
//     SetLabel(_Symbol, arrNameObject[str][2] , "isPriceOutScope_DN"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
//   SetLabel(_Symbol, arrNameObject[str][0] , (string)( isPriceOutScopeLevelPend_DN(PRICE_ScopeLevel_DN_BID)) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
// str++;
 
   SetLabel(_Symbol, arrNameObject[str][2] , "T_BS_CLOSE"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)( Ticket_BUYSTOP_CLOSE  ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++;
 
    SetLabel(_Symbol, arrNameObject[str][2] , "T_SL_CLOSE"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)( Ticket_SELLLIMIT_CLOSE  ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++;
 
    SetLabel(_Symbol, arrNameObject[str][2] , "T_BL_CLOSE"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)( Ticket_BUYLIMIT_CLOSE  ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++;
 
    SetLabel(_Symbol, arrNameObject[str][2] , "T_SS_CLOSE"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)( Ticket_SELLSTOP_CLOSE  ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++;
   
      SetLabel(_Symbol, arrNameObject[str][0] , "----------------------------------------------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 str++;  
 
       SetLabel(_Symbol, arrNameObject[str][2] , "ScopeBUYLIMIT"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)( isPriceInScopeBUYLIMIT( PRICE_ScopeLevel_DN_ASK )  ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++;
   
       SetLabel(_Symbol, arrNameObject[str][2] ,  "TRADE_MAIN_DN"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)( TRADE_MAIN_DN  ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
   
 
}   
 /*
 
   if(Status.CloseBUYLIMIT[number][STATUS_NEWBAR]        =  BarReMOVE != iTime(NULL,PERIOD_CURRENT,0) ? true: false )
   if(Status.CloseBUYLIMIT[number][STATUS_SCOPE_LEVEL]   =  isPriceOutScopeLevelPend_DN( PRICE_ScopeLevel_DN_BID - 3*POINT )  ? true: false )
 
 
  isPriceOutScopeLevelPend_DN(PRICE_ScopeLevel_DN_BID)
 
          TRADE          = false;
         TRADE_MAIN_UP  = false;
         TRADE_MAIN_DN  = false;
         TRADE_SUB_UP   = false;
         TRADE_SUB_DN   = false;
 */
 //  SetLabel(_Symbol, arrNameObject[str][0] , "--------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 //str++;
//         Print(__FUNCTION__,  " ------------ STATUS_TRADE >  ", TRADE);
//         Print(__FUNCTION__,  " ------------ STATUS_MAIN_ON >  ", MAIN_ON);
//         Print(__FUNCTION__,  " ------------ STATUS_PEND >  ", jBUYLIMIT[NAME_BL_0][NAME_STATUS].ToStr() == NAME_STATUS_PEND);
//
//         //Print(__FUNCTION__,  " ------------ STATUS_NEWBAR >  ", BarReMOVE != iTime(NULL,PERIOD_CURRENT,0));
//         Print(__FUNCTION__,  " ------------ STATUS_DT_START_STEP >  ", GetPipsDT_StartStep_DN() > StartStep + SymbolInfoInteger(NULL,SYMBOL_SPREAD));
//         Print(__FUNCTION__, " >>>>>>>>>>>>>>"); 
//         Print(__FUNCTION__,  " ------------ GetPipsDT_StartStep_DN() >  ", GetPipsDT_StartStep_DN());
//         Print(__FUNCTION__,  " ------------ StartStep + spred >  ", StartStep + SymbolInfoInteger(NULL,SYMBOL_SPREAD) );   

} 
