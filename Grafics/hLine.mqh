#include  "..\setting\FilePathMain.mqh" 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool H_line(string name, double price, color _color, ENUM_LINE_STYLE style = STYLE_SOLID, int width = 1 ){
  ObjectDelete( 0,name ); 
    if(!ObjectCreate(0,name,OBJ_HLINE,0,0,price))
   {
      Print("Failed to create the 2nd horizontal line!");
      return(false);
   } 
   else
   {
     ObjectSetInteger(0,name,OBJPROP_SELECTABLE,false);
     ObjectSetInteger(0,name,OBJPROP_SELECTED,false);
     ObjectSetInteger(0,name,OBJPROP_STYLE,STYLE_DOT);
     ObjectSetInteger(0,name,OBJPROP_COLOR,_color);  
     ObjectSetInteger(0,name,OBJPROP_WIDTH, width);  
      
   }  
   return true;
 } 
