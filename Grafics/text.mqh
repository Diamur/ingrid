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
   
   string strSTOPLOSS_BS      = DoubleToString(STOPLOSS_BS, DIGIT );   
   string strSTOPLOSS_SL      = DoubleToString(STOPLOSS_SL, DIGIT );
   string strSTOPLOSS_BL      = DoubleToString(STOPLOSS_BL, DIGIT );
   string strSTOPLOSS_SS      = DoubleToString(STOPLOSS_SS, DIGIT );
   
     
    color clrSTOPLOSS_BS = STOPLOSS_BS > 0 ? clrRed : clrWhite ; 
    color clrSTOPLOSS_SL = STOPLOSS_SL > 0 ? clrRed : clrWhite ;
    color clrSTOPLOSS_BL = STOPLOSS_BL > 0 ? clrRed : clrWhite ;    
    color clrSTOPLOSS_SS = STOPLOSS_SS > 0 ? clrRed : clrWhite ;    
    
    //---
    double const LOT_BS             = GetVolumeBS_SUB(NAME_PREFIX_BS); 
    double const LOT_SL             = GetVolumeSL_MAIN(NAME_PREFIX_SL);
    double const LOT_SL_FULL        =  MathAbs(LOT_BS - LOT_SL) ;  
 
    double const LOT_BL             = GetVolumeBL_MAIN(NAME_PREFIX_BL);
    double const LOT_SS             = GetVolumeSS_SUB(NAME_PREFIX_SS);
    double const LOT_BL_FULL        = MathAbs(LOT_BL - LOT_SS) ;
    //---
    double const PROFIT_BS          = GetProfitBUY_PREFIX(NAME_PREFIX_BS);
    double const PROFIT_SL          = GetProfitSELL_PREFIX(NAME_PREFIX_SL);
    double const PROFIT_SL_FULL     = GetProfitBUY_SELL_PREFIX(NAME_PREFIX_SL);
   
    double const PROFIT_BL_FULL     = GetProfitBUY_SELL_PREFIX(NAME_PREFIX_BL);    
    double const PROFIT_BL          = GetProfitBUY_PREFIX(NAME_PREFIX_BL);
    double const PROFIT_SS          = GetProfitSELL_PREFIX(NAME_PREFIX_SS);
    //---
       int const PIPS_BS            = GetPipsProfitBUY_Prefix(NAME_PREFIX_BS);
       int const PIPS_SL            = GetPipsProfitSELL_Prefix(NAME_PREFIX_SL);
       int const PIPS_SL_FULL       = GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_SL,true);
    
       int const PIPS_BL_FULL       = GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_BL,true);
       int const PIPS_BL            = GetPipsProfitBUY_Prefix(NAME_PREFIX_BL);
       int const PIPS_SS            = GetPipsProfitSELL_Prefix(NAME_PREFIX_SS);
    //---
     color const clrPROFIT_BS       =  PROFIT_BS  > 0 ? clrLime : ( PROFIT_BS  < 0 ? clrRed: clrWhite );
     color const clrPROFIT_SL       =  PROFIT_SL  > 0 ? clrLime : ( PROFIT_SL  < 0 ? clrRed: clrWhite );
     color const clrPROFIT_SL_FULL  =  PROFIT_SL_FULL  > 0 ? clrLime : ( PROFIT_SL_FULL  < 0 ? clrRed: clrWhite );
    
     color const clrPROFIT_BL_FULL  =  PROFIT_BL_FULL  > 0 ? clrLime : ( PROFIT_BL_FULL  < 0 ? clrRed: clrWhite );
     color const clrPROFIT_BL       =  PROFIT_BL  > 0 ? clrLime : ( PROFIT_BL  < 0 ? clrRed: clrWhite );
     color const clrPROFIT_SS       =  PROFIT_SS  > 0 ? clrLime : ( PROFIT_SS  < 0 ? clrRed: clrWhite );
                     
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
//GetPipsDT_StartStep_DN() > StartStep + SymbolInfoInteger(NULL,SYMBOL_SPREAD) 

//string strDT_StartStep_DN = (string)GetPipsDT_StartStep_DN();
//string strStartStep_SPREAD = (string) (StartStep + SymbolInfoInteger(NULL,SYMBOL_SPREAD)) ;

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

    int dtx = 0;
    int dtYLineBefor = 5;
    int dtYLineAfter = 8;
     
    int fsz = FONT_Size;  
    
 if(isCode("LOG")) {
 str++;
 
 if( isCode("ASK") ){
  SetLabel(_Symbol, arrNameObject[str][0] , "---------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 str++;     
   SetLabel(_Symbol, arrNameObject[str][2] , "ASK"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  DoubleToString( _ASK ,DIGIT) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 str++;
 
   SetLabel(_Symbol, arrNameObject[str][2] , "BID"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  DoubleToString( _BID ,DIGIT) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 str++;
 }   
    
if(isCode("BALANCE") ){
 SetLabel(_Symbol, arrNameObject[str][0] , "---------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 str++;   
   SetLabel(_Symbol, arrNameObject[str][2] , "BALANCE"          ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  strBALANCE        ,fsz, arrXLabel[str][0], arrYLabel[str], clrYellow,corner,anchor,false); 
 str++;
   SetLabel(_Symbol, arrNameObject[str][2] , "BALANCE_START"    ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  strBALANCE_START  ,fsz, arrXLabel[str][0], arrYLabel[str], clrMagenta,corner,anchor,false); 
 str++;
   SetLabel(_Symbol, arrNameObject[str][2] , "EQITY"            ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  strEQITY          ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 str++;
   SetLabel(_Symbol, arrNameObject[str][2] , "DT_EB_START"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , strDT_EQ_BAL_START ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 str++;
}

 
if ( isCode("PROFIT") ){ 
 SetLabel(_Symbol, arrNameObject[str][0] , "---------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 str++;
//   SetLabel(_Symbol, arrNameObject[str][1] , "PROFIT_FULL"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
//   SetLabel(_Symbol, arrNameObject[str][0] ,  StrProfit        ,fsz, arrXLabel[str][0], arrYLabel[str], clrProfit,corner,anchor,false); 
//   str++;  
//   
   SetLabel(_Symbol, arrNameObject[str][1] , "PROFIT_BS"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  DoubleToString( PROFIT_BS , 2  )        ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_BS,corner,anchor,false); 
   str++;     
  SetLabel(_Symbol, arrNameObject[str][1] , "PROFIT_SL"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  DoubleToString( PROFIT_SL , 2  )        ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_SL,corner,anchor,false); 
   str++;     
   
  SetLabel(_Symbol, arrNameObject[str][1] , "PROFIT_SL_FULL"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  DoubleToString( PROFIT_SL_FULL , 2  )        ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_SL_FULL,corner,anchor,false); 
   str++;     
  SetLabel(_Symbol, arrNameObject[str][0] , "---------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
  str++;    
  SetLabel(_Symbol, arrNameObject[str][1] , "PROFIT_BL_FULL"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  DoubleToString( PROFIT_BL_FULL , 2  )        ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_BL_FULL,corner,anchor,false); 
   str++;     
   
  SetLabel(_Symbol, arrNameObject[str][1] , "PROFIT_BL"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  DoubleToString( PROFIT_BL  , 2  )          ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_BL,corner,anchor,false); 
   str++;     
  SetLabel(_Symbol, arrNameObject[str][1] , "PROFIT_SS"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  DoubleToString(  PROFIT_SS  , 2  )         ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_SS,corner,anchor,false); 
   str++;  
   
}
if( isCode("LOT") ){ 
 SetLabel(_Symbol, arrNameObject[str][0] , "---------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 str++;
   SetLabel(_Symbol, arrNameObject[str][1] , "LOT_BS"         ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,   DoubleToString( LOT_BS  , 2  )     ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_BS,corner,anchor,false); 
 str++;  
   SetLabel(_Symbol, arrNameObject[str][1] , "LOT_SL"         ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,   DoubleToString( LOT_SL , 2  )      ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_SL,corner,anchor,false); 
 str++;  
   SetLabel(_Symbol, arrNameObject[str][1] , "LOT_SL_FULL"         ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,   DoubleToString( LOT_SL_FULL , 2  )      ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_SL_FULL,corner,anchor,false); 
 str++;  
 SetLabel(_Symbol, arrNameObject[str][0] , "---------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 str++;  
   SetLabel(_Symbol, arrNameObject[str][1] , "LOT_BL_FULL"         ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,   DoubleToString( LOT_BL_FULL  , 2  )    ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_BL_FULL,corner,anchor,false); 
 str++;  
   SetLabel(_Symbol, arrNameObject[str][1] , "LOT_BL"         ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,   DoubleToString( LOT_BL  , 2  )    ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_BL,corner,anchor,false); 
 str++;  
   SetLabel(_Symbol, arrNameObject[str][1] , "LOT_SS"         ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,   DoubleToString(LOT_SS  , 2  )    ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_SS,corner,anchor,false); 
 str++;  
 }
 //---
 if( isCode("PIPS")  ){ 
 SetLabel(_Symbol, arrNameObject[str][0] , "---------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 str++;
  SetLabel(_Symbol, arrNameObject[str][1] ,  "PIPS_BS"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)( PIPS_BS  )        ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_BS,corner,anchor,false); 
 str++;  
  SetLabel(_Symbol, arrNameObject[str][1] ,  "PIPS_SL"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)(PIPS_SL)        ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_SL,corner,anchor,false); 
 str++;  

  SetLabel(_Symbol, arrNameObject[str][1] ,  "PIPS_SL_FULL"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)( PIPS_SL_FULL )        ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_SL_FULL,corner,anchor,false); 
 str++;  
 
  SetLabel(_Symbol, arrNameObject[str][0] , "---------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 str++; 
 
  SetLabel(_Symbol, arrNameObject[str][1] ,  "PIPS_BL_FULL"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)(PIPS_BL_FULL)        ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_BL_FULL,corner,anchor,false); 
 str++;  

  SetLabel(_Symbol, arrNameObject[str][1] ,  "PIPS_BL"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)(PIPS_BL)        ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_BL,corner,anchor,false); 
 str++;  

  SetLabel(_Symbol, arrNameObject[str][1] ,  "PIPS_SS"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  (string)(PIPS_SS )        ,fsz, arrXLabel[str][0], arrYLabel[str], clrPROFIT_SS,corner,anchor,false); 
 str++;
 }
 //---
 if(  isCode("COUNT") ){    
   SetLabel(_Symbol, arrNameObject[str][0] , "---------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
   str++;  

   SetLabel(_Symbol, arrNameObject[str][2] ,  "Count_BS"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  GetCountPositionsByPREFIX( NAME_PREFIX_BS ) ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++;
  
   SetLabel(_Symbol, arrNameObject[str][2] ,  "Count_SL"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  GetCountPositionsByPREFIX( NAME_PREFIX_SL ) ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++;
  
   SetLabel(_Symbol, arrNameObject[str][2] ,  "Count_BL"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  GetCountPositionsByPREFIX( NAME_PREFIX_BL ) ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++;
  
   SetLabel(_Symbol, arrNameObject[str][2] ,  "Count_SS"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  GetCountPositionsByPREFIX( NAME_PREFIX_SS ) ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++;
 }
 
 

 
 if(  isCode("STOPLOSS")  ){ 
  SetLabel(_Symbol, arrNameObject[str][0] , "---------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 str++;    
 if(Trall_SL != 0){
   SetLabel(_Symbol, arrNameObject[str][1] , "STOPLOSS_BS"     ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  strSTOPLOSS_BS   ,fsz, arrXLabel[str][0], arrYLabel[str], clrSTOPLOSS_SL,corner,anchor,false); 
 str++;  
 }  
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
  
 if(Trall_SS != 0){ 
   SetLabel(_Symbol, arrNameObject[str][1] , "STOPLOSS_SS"     ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  strSTOPLOSS_SS   ,fsz, arrXLabel[str][0], arrYLabel[str], clrSTOPLOSS_BL,corner,anchor,false); 
 str++;     
  }
 }

 if(  isCode("TRADE") ){ 
    SetLabel(_Symbol, arrNameObject[str][2] , "TRADE"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(TRADE) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 str++;
    SetLabel(_Symbol, arrNameObject[str][2] , "TRADE_MAIN_UP"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(TRADE_MAIN_UP) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 str++;
    SetLabel(_Symbol, arrNameObject[str][2] , "TRADE_MAIN_DN"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(TRADE_MAIN_DN) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 str++;
    SetLabel(_Symbol, arrNameObject[str][2] , "TRADE_SUB_UP"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(TRADE_SUB_UP) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 str++;
    SetLabel(_Symbol, arrNameObject[str][2] , "TRADE_SUB_DN"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(TRADE_SUB_DN) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
 str++;
}





  if(  isCode("TUP")  ){ 
     SetLabel(_Symbol, arrNameObject[str][0] , "---------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
   str++;  
   
   SetLabel(_Symbol, arrNameObject[str][2] ,  "WORK"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  WorkingHour()  ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
   SetLabel(_Symbol, arrNameObject[str][2] ,  "TRADE_DN"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  TRADE_UP  ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
   SetLabel(_Symbol, arrNameObject[str][2] ,  "MAIN_ON"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  MAIN_ON  ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
   SetLabel(_Symbol, arrNameObject[str][2] ,  "TRADE_SUB_UP "  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  !TRADE_SUB_UP   ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
   /*
   
   
   */
   
   SetLabel(_Symbol, arrNameObject[str][0] , "---------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 str++;
   
         SetLabel(_Symbol, arrNameObject[str][2] ,  "WORK"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)( WorkingHour()   ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
      SetLabel(_Symbol, arrNameObject[str][2] ,  "TRADE_DN"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)( TRADE_UP ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
      SetLabel(_Symbol, arrNameObject[str][2] ,  "MAIN_ON"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)( MAIN_ON ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
      SetLabel(_Symbol, arrNameObject[str][2] ,  "TRADE_MAIN_UP"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(   !TRADE_MAIN_UP ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
      SetLabel(_Symbol, arrNameObject[str][2] ,  "COUNT"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  GetCountPendByType(ORDER_TYPE_SELL_LIMIT)  ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   
  /*
  
  
  */ 
   
   }

 if( isCode("TDN")  ){ 
   
      SetLabel(_Symbol, arrNameObject[str][0] , "---------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
   str++;  
   
      SetLabel(_Symbol, arrNameObject[str][2] ,  "WORK"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)( WorkingHour()   ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
      SetLabel(_Symbol, arrNameObject[str][2] ,  "TRADE_DN"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)( TRADE_DN ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
      SetLabel(_Symbol, arrNameObject[str][2] ,  "MAIN_ON"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)( MAIN_ON ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 

      SetLabel(_Symbol, arrNameObject[str][2] ,  "State_B_START_DN"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(State_BUTTON_START_DN || MQLInfoInteger(MQL_TESTER) ||  MQLInfoInteger(MQL_OPTIMIZATION) ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 

      SetLabel(_Symbol, arrNameObject[str][2] ,  "TRADE_MAIN_DN"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(   !TRADE_MAIN_DN ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 

      SetLabel(_Symbol, arrNameObject[str][2] ,  "COUNT"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  GetCountPendByType(ORDER_TYPE_BUY_LIMIT) == 0  ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 

      SetLabel(_Symbol, arrNameObject[str][2] ,  "STATUS_STO"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)( Stochastic_ON? ( !STORevers? (isStoMain_UP(0,STOLevelUP,0)  ? true: false):(isStoMain_DN(0,STOLevelDN,0)  ? true: false)  ):true  ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
   
   /*
   
if(Status.OpenBUYLIMIT[number][STATUS_WORK]           = WorkingHour() ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_TRADE_DN]       = TRADE_DN ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_MAIN_ON]        = MAIN_ON ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_STATE_DN]       = State_BUTTON_START_DN || MQLInfoInteger(MQL_TESTER) ||  MQLInfoInteger(MQL_OPTIMIZATION)  ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_TRADE_MAIN_DN]  = !TRADE_MAIN_DN ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_COUNT]          = GetCountPendByType(ORDER_TYPE_BUY_LIMIT) == 0? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_STO_UP]         = Stochastic_ON? ( !STORevers? (isStoMain_UP(number,STOLevelUP,0)  ? true: false):(isStoMain_DN(number,STOLevelUP,0)  ? true: false)  ):true )   
   
   
   */
       SetLabel(_Symbol, arrNameObject[str][0] , "---------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 str++;
   
   SetLabel(_Symbol, arrNameObject[str][2] ,  "WORK"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  WorkingHour()  ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
   SetLabel(_Symbol, arrNameObject[str][2] ,  "TRADE_DN"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  TRADE_DN  ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
   SetLabel(_Symbol, arrNameObject[str][2] ,  "SUB_ON"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  SUB_ON  ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
   
     SetLabel(_Symbol, arrNameObject[str][2] ,  "State_BUTTON_STOP"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  !State_BUTTON_STOP  ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
  
    SetLabel(_Symbol, arrNameObject[str][2] ,  "State_BUTTON_DN"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)( State_BUTTON_START_DN || MQLInfoInteger(MQL_TESTER) ||  MQLInfoInteger(MQL_OPTIMIZATION) ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++;   
   
   SetLabel(_Symbol, arrNameObject[str][2] ,  "TRADE_SUB_DN "  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  !TRADE_SUB_DN   ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
   
   SetLabel(_Symbol, arrNameObject[str][2] ,  "STATUS_STO "  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  Stochastic_ON? ( !STORevers? (isStoMain_UP(0,STOLevelUP,0)  ? true: false):(isStoMain_DN(0,STOLevelDN,0)  ? true: false)  ):true   ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
   
   
   
   /*
   

  
  if(Status.OpenSELLSTOP[number][STATUS_WORK]           = WorkingHour() ? true: false )
if(Status.OpenSELLSTOP[number][STATUS_TRADE_DN]       = TRADE_DN ? true: false )
if(Status.OpenSELLSTOP[number][STATUS_SUB_ON]         = SUB_ON ? true: false )
if(Status.OpenSELLSTOP[number][STATUS_STATE_STOP]     = !State_BUTTON_STOP ? true: false )
if(Status.OpenSELLSTOP[number][STATUS_STATE_DN]       = State_BUTTON_START_DN || MQLInfoInteger(MQL_TESTER) ||  MQLInfoInteger(MQL_OPTIMIZATION) ? true: false )
if(Status.OpenSELLSTOP[number][STATUS_TRADE_SUB_DN]   = !TRADE_SUB_DN  ? true: false )
if(Status.OpenSELLSTOP[number][STATUS_STO_UP]         = Stochastic_ON? ( !STORevers? (isStoMain_UP(number,STOLevelUP,0)  ? true: false):(isStoMain_DN(number,STOLevelUP,0)  ? true: false)  ):true )    
   
   */
   }
   
  if( isCode("STO") ){    
   SetLabel(_Symbol, arrNameObject[str][0] , "---------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
   str++;  

   SetLabel(_Symbol, arrNameObject[str][2] ,  "STO_MAIN_UP"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  isStoMain_UP(0,STOLevelUP,0) ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++;
  
   SetLabel(_Symbol, arrNameObject[str][2] ,  "STO_MAIN_DN"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  isStoMain_DN(0,STOLevelDN,0) ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++;
  
   SetLabel(_Symbol, arrNameObject[str][2] ,  "STO_SIGNAL_UP"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  isStoSignal_UP(0,STOLevelUP,0) ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++;
  
   SetLabel(_Symbol, arrNameObject[str][2] ,  "STO_SIGNAL_DN"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , (string)(  isStoSignal_DN(0,STOLevelDN,0) ) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++;
  

 } 
   
   if(isCode("MINMAX") ){    
   SetLabel(_Symbol, arrNameObject[str][0] , "---------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
   str++;  
  
   SetLabel(_Symbol, arrNameObject[str][2] ,  "PriceMIN_UP"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] , DoubleToString( PriceMIN_UP , 2) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++; 
   
   SetLabel(_Symbol, arrNameObject[str][2] ,  "PriceMAX_DN"  ,fsz, arrXLabel[str][1]+dtx, arrYLabel[str], clrWhite  ,corner,anchor,false); 
   SetLabel(_Symbol, arrNameObject[str][0] ,  DoubleToString( PriceMAX_DN , 2) ,fsz, arrXLabel[str][0], arrYLabel[str], clrWhite,corner,anchor,false); 
   str++;
   
   
 }  
   
    if(isCode("OUT")  ){ 
 SetLabel(_Symbol, arrNameObject[str][0] , "---------------------------------------------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 str++;

  SetLabel(_Symbol, arrNameObject[str][1] ,  "PipsOUT_SL"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)( PriceMIN_UP == 0 ? 0 : (int)((  PriceMIN_UP - SymbolInfoDouble(NULL,SYMBOL_ASK )     )/POINT)   )        ,fsz, arrXLabel[str][0], arrYLabel[str], (int)((  PriceMIN_UP - PriceMIN_UP==0?0:SymbolInfoDouble(NULL,SYMBOL_ASK )    )/POINT)  > 0 ? clrGreen:clrRed,corner,anchor,false); 
 str++;  

  SetLabel(_Symbol, arrNameObject[str][1] ,  "PipsOUT_BL"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)( PriceMAX_DN==0 ? 0: (int)(( SymbolInfoDouble(NULL,SYMBOL_BID) - PriceMAX_DN )/POINT) )        ,fsz, arrXLabel[str][0], arrYLabel[str], (int)(( PriceMAX_DN==0?0:SymbolInfoDouble(NULL,SYMBOL_BID) - PriceMAX_DN )/POINT)  > 0? clrGreen:clrRed,corner,anchor,false); 
 str++;  
 
 SetLabel(_Symbol, arrNameObject[str][0] , "---------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 str++;
 
  SetLabel(_Symbol, arrNameObject[str][1] ,  "CloseSL_OUT"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)( SignalCloseSL_OUT_PRICE[0] )        ,fsz, arrXLabel[str][0], arrYLabel[str], SignalCloseSL_OUT_PRICE[0]? clrGreen:clrRed,corner,anchor,false); 
 str++;  
 
  SetLabel(_Symbol, arrNameObject[str][1] ,  "CloseBL_OUT"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)( SignalCloseBL_OUT_PRICE[0] )        ,fsz, arrXLabel[str][0], arrYLabel[str], SignalCloseBL_OUT_PRICE[0] ? clrGreen:clrRed,corner,anchor,false); 
 str++;  
 
    SetLabel(_Symbol, arrNameObject[str][0] , "---------",9, arrXLabel[str][0] , arrYLabel[str], clrDarkGray,  corner , anchor,false);  
 str++;
 
  
  SetLabel(_Symbol, arrNameObject[str][1] ,  "PipsOutPrice"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)( PipsOutPrice !=0 )        ,fsz, arrXLabel[str][0], arrYLabel[str], PipsOutPrice !=0 ? clrGreen:clrRed ,corner,anchor,false); 
 str++;  
  SetLabel(_Symbol, arrNameObject[str][1] ,  "ASK < PriceMIN_UP"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)( SymbolInfoDouble(NULL,SYMBOL_ASK) < PriceMIN_UP )        ,fsz, arrXLabel[str][0], arrYLabel[str],  SymbolInfoDouble(NULL,SYMBOL_ASK) < PriceMIN_UP? clrGreen:clrRed,corner,anchor,false); 
 str++;  
   SetLabel(_Symbol, arrNameObject[str][1] ,  "PriceMIN_UP-ASK > PipsOut"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)( (PriceMIN_UP - SymbolInfoDouble(NULL,SYMBOL_ASK) )/POINT > PipsOutPrice )        ,fsz, arrXLabel[str][0], arrYLabel[str],  (PriceMIN_UP - SymbolInfoDouble(NULL,SYMBOL_ASK) )/POINT > PipsOutPrice ? clrGreen:clrRed,corner,anchor,false); 
 str++;  
  SetLabel(_Symbol, arrNameObject[str][1] ,  "PIPS_SL_FULL < 0 "          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)( GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_SL,true) < 0 )        ,fsz, arrXLabel[str][0], arrYLabel[str],  GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_SL) < 0 ? clrGreen:clrRed,corner,anchor,false); 
 str++;  
    SetLabel(_Symbol, arrNameObject[str][0] , "---------",9, arrXLabel[str][0] , arrYLabel[str]  , clrDarkGray,  corner , anchor,false);  
 str++;
  SetLabel(_Symbol, arrNameObject[str][1] ,  "PipsOutPrice"                 ,fsz, arrXLabel[str][1], arrYLabel[str] , clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)(PipsOutPrice !=0  )   ,fsz, arrXLabel[str][0], arrYLabel[str] , PipsOutPrice !=0 ? clrGreen:clrRed,corner,anchor,false); 
 str++;  
  SetLabel(_Symbol, arrNameObject[str][1] ,  " BID > MAX_DN "          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)( SymbolInfoDouble(NULL,SYMBOL_BID) > PriceMAX_DN  )        ,fsz, arrXLabel[str][0], arrYLabel[str],  SymbolInfoDouble(NULL,SYMBOL_BID) > PriceMAX_DN  ? clrGreen:clrRed,corner,anchor,false); 
 str++;  
  SetLabel(_Symbol, arrNameObject[str][1] ,  "BID-MAX_DN > PipsOutPrice"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)( ( SymbolInfoDouble(NULL,SYMBOL_BID) - PriceMAX_DN )/POINT > PipsOutPrice )        ,fsz, arrXLabel[str][0], arrYLabel[str], ( SymbolInfoDouble(NULL,SYMBOL_BID) - PriceMAX_DN )/POINT > PipsOutPrice  ? clrGreen:clrRed,corner,anchor,false); 
 str++;  
  SetLabel(_Symbol, arrNameObject[str][1] ,  "PIPS_BL_FULL < 0"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)(  GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_BL,true) < 0 )        ,fsz, arrXLabel[str][0], arrYLabel[str],  GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_BL) < 0 ? clrGreen:clrRed,corner,anchor,false); 
 str++;  
 
     SetLabel(_Symbol, arrNameObject[str][0] , "---------",9, arrXLabel[str][0] , arrYLabel[str] , clrDarkGray,  corner , anchor,false);  
 str++;
   SetLabel(_Symbol, arrNameObject[str][1] ,  "PIPS_SL"          ,fsz, arrXLabel[str][1], arrYLabel[str]  , clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)(  GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_SL,true) )        ,fsz, arrXLabel[str][0], arrYLabel[str]  ,  clrWhite ,corner,anchor,false); 
 str++;  
    SetLabel(_Symbol, arrNameObject[str][1] ,  "PIPS_BL"          ,fsz, arrXLabel[str][1], arrYLabel[str], clrWhite  ,corner,anchor,false); 
  SetLabel(_Symbol, arrNameObject[str][0] ,  (string)(  GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_BL,true)  )        ,fsz, arrXLabel[str][0], arrYLabel[str],  clrWhite ,corner,anchor,false); 
 str++;  
 
 /*
 //---
  if(Status.CloseSL[number][STATUS_PIPS_OUT]    = PipsOutPrice !=0 ? true: false )  
  if(Status.CloseSL[number][STATUS_ASK]         = SymbolInfoDouble(NULL,SYMBOL_ASK) < PriceMIN_UP   ? true: false )  
  if(Status.CloseSL[number][STATUS_DT_OUT]      = (PriceMIN_UP - SymbolInfoDouble(NULL,SYMBOL_ASK) )/POINT > PipsOutPrice ? true: false )
  if(Status.CloseBL[number][STATUS_PROFIT_SELL] =  GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_SL) < 0 ? true: false )  
 //---
  if(Status.CloseBL[number][STATUS_PIPS_OUT]    = PipsOutPrice !=0 ? true: false )  
  if(Status.CloseBL[number][STATUS_BID]         = SymbolInfoDouble(NULL,SYMBOL_BID) > PriceMAX_DN  ? true: false )  
  if(Status.CloseBL[number][STATUS_DT_OUT]      = ( SymbolInfoDouble(NULL,SYMBOL_BID) - PriceMAX_DN )/POINT > PipsOutPrice ? true: false )
  if(Status.CloseBL[number][STATUS_PROFIT_BUY]  =  GetPipsProfitBUY_SELL_Prefix(NAME_PREFIX_BL) < 0 ? true: false )  
 
 */
 

 } 
   
   
}   

 /* 
 
if(Status.OpenBUYLIMIT[number][STATUS_WORK]           = WorkingHour() ? true: false )
//if(Status.OpenBUYLIMIT[number][STATUS_TRADE]          = !TRADE ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_TRADE_DN]       = TRADE_DN ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_MAIN_ON]        = MAIN_ON ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_STATE_DN]       = State_BUTTON_START_DN || MQLInfoInteger(MQL_TESTER) ||  MQLInfoInteger(MQL_OPTIMIZATION)  ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_TRADE_MAIN_DN]  = !TRADE_MAIN_DN ? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_COUNT]          = GetCountPendByType(ORDER_TYPE_BUY_LIMIT) == 0? true: false )
if(Status.OpenBUYLIMIT[number][STATUS_STO_UP]         = Stochastic_ON? ( !STORevers? (isStoMain_UP(number,STOLevelUP,0)  ? true: false):(isStoMain_DN(number,STOLevelUP,0)  ? true: false)  ):true )   
 


 */


} 
