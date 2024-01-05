#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetLabel( string symbol,  
               string labelName,  
               string text, 
                  int fontSize ,
                  int x, 
                  int y, 
                color _color        = clrWhite, 
                  int corner        = 4, 
                  int anchor        = 6 ,
                 bool selectable    = true,
                 bool selected      = true ){
                   
 if(ObjectFind(0, labelName) < 0)
   ObjectCreate    (0, labelName ,OBJ_LABEL           , 0,0,0);
   ObjectSetString (0, labelName ,OBJPROP_FONT        , "Arial");
   ObjectSetInteger(0, labelName ,OBJPROP_FONTSIZE    , fontSize );
   ObjectSetString (0, labelName ,OBJPROP_TEXT        , 0, " " + text );
   ObjectSetInteger(0, labelName ,OBJPROP_XDISTANCE   , x );
   ObjectSetInteger(0, labelName ,OBJPROP_YDISTANCE   , y );   
   ObjectSetInteger(0, labelName, OBJPROP_SELECTABLE  , selectable); 
   ObjectSetInteger(0, labelName, OBJPROP_SELECTED    , true);  
   //---
   if(corner == 1)
   ObjectSetInteger(0, labelName, OBJPROP_CORNER, CORNER_LEFT_LOWER); 
   if(corner == 2)
   ObjectSetInteger(0, labelName, OBJPROP_CORNER, CORNER_LEFT_UPPER); 
   if(corner == 3)
   ObjectSetInteger(0, labelName, OBJPROP_CORNER, CORNER_RIGHT_UPPER); 
   if(corner == 4)
   //---
   ObjectSetInteger(0, labelName, OBJPROP_CORNER, CORNER_RIGHT_LOWER); 
   if(anchor == 1) 
   ObjectSetInteger(0, labelName, OBJPROP_ANCHOR, ANCHOR_LEFT_UPPER);
   if(anchor == 2) 
   ObjectSetInteger(0, labelName, OBJPROP_ANCHOR, ANCHOR_LEFT);
   if(anchor == 3) 
   ObjectSetInteger(0, labelName, OBJPROP_ANCHOR, ANCHOR_LEFT_LOWER);
   if(anchor == 4) 
   ObjectSetInteger(0, labelName, OBJPROP_ANCHOR, ANCHOR_LOWER);
   if(anchor == 5) 
   ObjectSetInteger(0, labelName, OBJPROP_ANCHOR, ANCHOR_RIGHT_LOWER);
   if(anchor == 6) 
   ObjectSetInteger(0, labelName, OBJPROP_ANCHOR, ANCHOR_RIGHT);
   if(anchor == 7) 
   ObjectSetInteger(0, labelName, OBJPROP_ANCHOR, ANCHOR_RIGHT_UPPER);
   if(anchor == 8) 
   ObjectSetInteger(0, labelName, OBJPROP_ANCHOR, ANCHOR_UPPER);
   if(anchor == 9) 
   //---
   ObjectSetInteger(0, labelName, OBJPROP_ANCHOR, ANCHOR_CENTER);
   ObjectSetInteger(0, labelName, OBJPROP_ALIGN, ALIGN_RIGHT); 
   ObjectSetInteger(0, labelName, OBJPROP_COLOR, _color ); 
}
