#include  "..\setting\FilePathMain.mqh" 

#resource "img\\logo2.bmp"
string foto    = "::img\\logo2.bmp";

#define  CHART_ID             0  // Текущее  окно
#define  SUB_WINDOW           0  // подокно

#define  INFO_PANEL_SIZE      28
#define  WIDTH_CPANEL         260

#define  HEIGHT_LOGO           32

#define  HEIGHT_CPANEL        455
#define  X_CPANEL             1
#define  WIDTH_HEADER_CPANEL  22

#define  WIDTH_BUTTON         113
#define  HEIGHT_BUTTON        28


struct Panel
  {
   double TODAY;           // 0
   double YESTERDAY;       // 1
   double CURRENT_WEEK;    // 2
   double LAST_WEEK;       // 3
   double CURRENT_MONTH;   // 4
   double LAST_MONTH;      // 5
   double ENTIRE_PERIOD;   // 6

   double BALANCE;         // 7
   double EQITY;           // 8
   double MARGINFREE;      // 9
   double PROFIT;          // 10
   double DRAWDOWN;        // 11
   double MAXDRAWDOWN;     // 12

     long SPREAD;          // 13
   double SWAP_LONG;       // 14
   double SWAP_SHORT;      // 15
     long LEVERAGE;        // 16
   double REAL_LEVERAGE;   // 17
   string CURRENCY;        // 18
   double PRICE_PIPS;      // 19

   string WEB;             // 20
   string DATE_TIME;       // 21
   string DAY_OF_WEEK;     // 22 
   string COMMENT;         // 23
   
     bool START;           // 24
     bool STOP;            // 25
  
   double PROFIT_UP;       // 26 
   double PROFIT_DN;       // 27 
   
  };

Panel _P = {0,0,0,0,0,0,0,  0,0,0,0,0,0,  0,0,0,0,0,"",0, "","","","",false,false,0,0};


string aProp_names[INFO_PANEL_SIZE] =
  {
   "name_Today",
   "name_Yesterday",
   "name_Current_week",
   "name_naLast_week",
   "name_Current_month",
   "name_naLast_month",
   "name_Entire_period",

   "name_pBalance",
   "name_pEqity",
   "name_pMarginFree",
   "name_pProfit",
   "name_pDrawdown",
   "name_pMaxDrawdown",

   "name_spread",
   "name_swap_long",
   "name_swap_short",
   "name_leverage",
   "name_real_leverage",
   "name_currency",
   "name_price pips",
   
   "name_Web",
   "name_date_time",
   "name_day_of_week",
   "name_comment",
   
   "name_start",
   "name_stop",
   
   "name_profit_up",
   "name_profit_dn"   
   
  };

string aProp_values[INFO_PANEL_SIZE] =
  {
   "value_Today",
   "value_Yesterday",
   "value_Current_week",
   "value_naLast_week",
   "value_Current_month",
   "value_Last_month",
   "value_Entire_period",

   "value_pBalance",
   "value_pEqity",
   "value_pMarginFree",
   "value_pProfit",
   "value_pDrawdown",
   "value_pMaxDrawdown",

   "value_spread",
   "value_swap_long",
   "value_swap_short",
   "value_leverage",
   "value_real_leverage",
   "value_currency",
   "value_price_pips",
   
   "value_Web",
   "value_date_time",
   "value_day_of_week",
   "value_comment",
   
   "value_start",
   "value_stop",
   
   "value_profit_up",
   "value_profit_dn"  
   
  };

enum DataPanel
  {
   p_TODAY,           // 0
   p_YESTERDAY,       // 1
   p_CURRENT_WEEK,    // 2
   p_LAST_WEEK,       // 3
   p_CURRENT_MONTH,   // 4
   p_LAST_MONTH,      // 5
   p_ENTIRE_PERIOD,   // 6

   p_BALANCE,         // 7
   p_EQITY,           // 8
   p_MARGINFREE,      // 9
   p_PROFIT,          // 10
   p_DRAWDOWN,        // 11
   p_MAXDRAWDOWN,     // 12

   p_SPREAD,          // 13
   p_SWAP_LONG,       // 14
   p_SWAP_SHORT,      // 15
   p_LEVERAGE,        // 16
   p_REAL_LEVERAGE,   // 17
   p_CURRENCY,        // 18
   p_PRICE_PIPS,      // 19
   p_WEB,             // 20
   p_DATE_TIME,       // 21
   p_DAY_OF_WEEK,     // 22
   p_COMMENT,         // 23
   
   p_BUTTON_START,    // 24
   p_BUTTON_STOP,     // 25  
   
   p_PROFIT_UP,       // 26  
   p_PROFIT_DN        // 27
   
  };

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void showButton(long              chart_id,
              int               sub_window,
              string            name,
              string            text,
              bool              state,              // нажата/отжата 
              ENUM_BASE_CORNER  corner,
              string            font_name,
              int               font_size,
              color             font_color,
              int               x_size,
              int               y_size,
              int               x_distance,
              int               y_distance,
              long              z_order,
              color             background_color,
              bool              read_only
              //ENUM_ANCHOR_POINT anchor = ANCHOR_RIGHT
             )
  {
   if(ObjectFind(chart_id, name) < 0)  // Если объект не найден на графике
      if(ObjectCreate(chart_id, name, OBJ_BUTTON, sub_window, 0, 0))
        {
         ObjectSetString(chart_id, name, OBJPROP_TEXT, text);
         ObjectSetInteger(chart_id, name, OBJPROP_CORNER, corner);
         //ObjectSetInteger(chart_id,name,OBJPROP_ANCHOR,anchor);
         ObjectSetString(chart_id, name, OBJPROP_FONT, font_name);
         ObjectSetInteger(chart_id, name, OBJPROP_FONTSIZE, font_size);
         
         ObjectSetInteger(chart_id, name, OBJPROP_COLOR, font_color);
         ObjectSetInteger(chart_id, name, OBJPROP_BGCOLOR, background_color);
         ObjectSetInteger(chart_id, name, OBJPROP_XSIZE, x_size);
         ObjectSetInteger(chart_id, name, OBJPROP_YSIZE, y_size);
         ObjectSetInteger(chart_id, name, OBJPROP_XDISTANCE, x_distance);
         ObjectSetInteger(chart_id, name, OBJPROP_YDISTANCE, y_distance);
         ObjectSetInteger(chart_id, name, OBJPROP_SELECTABLE, false);
         ObjectSetInteger(chart_id, name, OBJPROP_ZORDER, z_order);
         //--- переведем кнопку в заданное состояние 
         ObjectSetInteger(chart_id,name,OBJPROP_STATE,state); 
         ObjectSetInteger(chart_id, name, OBJPROP_BACK, false);
         ObjectSetInteger(chart_id, name, OBJPROP_READONLY, read_only);
         ObjectSetInteger(chart_id, name, OBJPROP_ALIGN, ALIGN_LEFT);
         ObjectSetString(chart_id, name, OBJPROP_TOOLTIP, "\n");
        };
  }
 //+------------------------------------------------------------------+
 //|                                                                  |
 //+------------------------------------------------------------------+
  void showEdit(long              chart_id,
              int               sub_window,
              string            name,
              string            text,
              ENUM_BASE_CORNER  corner,
              string            font_name,
              int               font_size,
              color             font_color,
              int               x_size,
              int               y_size,
              int               x_distance,
              int               y_distance,
              long              z_order,
              color             background_color,
              bool              read_only
              //ENUM_ANCHOR_POINT anchor = ANCHOR_RIGHT
             )
  {
   if(ObjectFind(chart_id, name) < 0)  // Если объект не найден на графике
      if(ObjectCreate(chart_id, name, OBJ_EDIT, sub_window, 0, 0))
        {
         ObjectSetString(chart_id, name, OBJPROP_TEXT, text);
         ObjectSetInteger(chart_id, name, OBJPROP_CORNER, corner);
         //ObjectSetInteger(chart_id,name,OBJPROP_ANCHOR,anchor);
         ObjectSetString(chart_id, name, OBJPROP_FONT, font_name);
         ObjectSetInteger(chart_id, name, OBJPROP_FONTSIZE, font_size);
         ObjectSetInteger(chart_id, name, OBJPROP_COLOR, font_color);
         ObjectSetInteger(chart_id, name, OBJPROP_BGCOLOR, background_color);
         ObjectSetInteger(chart_id, name, OBJPROP_XSIZE, x_size);
         ObjectSetInteger(chart_id, name, OBJPROP_YSIZE, y_size);
         ObjectSetInteger(chart_id, name, OBJPROP_XDISTANCE, x_distance);
         ObjectSetInteger(chart_id, name, OBJPROP_YDISTANCE, y_distance);
         ObjectSetInteger(chart_id, name, OBJPROP_SELECTABLE, false);
         ObjectSetInteger(chart_id, name, OBJPROP_ZORDER, z_order);
         ObjectSetInteger(chart_id, name, OBJPROP_BACK, false);
         ObjectSetInteger(chart_id, name, OBJPROP_READONLY, read_only);
         ObjectSetInteger(chart_id, name, OBJPROP_ALIGN, ALIGN_LEFT);
         ObjectSetString(chart_id, name, OBJPROP_TOOLTIP, "\n");
        };
  }
  
//+------------------------------------------------------------------+
void showLabel(long              chart_id,
               int               sub_window,
               string            name,
               string            text,
               ENUM_ANCHOR_POINT anchor,
               ENUM_BASE_CORNER  corner,
               string            font_name,
               int               font_size,
               color             font_color,
               int               x_distance,
               int               y_distance,
               long              z_order
              )
  {
   if(ObjectCreate(chart_id, name, OBJ_LABEL, sub_window, 0, 0))
     {
      ObjectSetString(chart_id, name, OBJPROP_TEXT, text);
      ObjectSetString(chart_id, name, OBJPROP_FONT, font_name);
      ObjectSetInteger(chart_id, name, OBJPROP_FONTSIZE, font_size);
      ObjectSetInteger(chart_id, name, OBJPROP_ANCHOR, anchor);
      ObjectSetInteger(chart_id, name, OBJPROP_COLOR, font_color);
      ObjectSetInteger(chart_id, name, OBJPROP_BACK, false);
      ObjectSetInteger(chart_id, name, OBJPROP_CORNER, corner);
      ObjectSetInteger(chart_id, name, OBJPROP_XDISTANCE, x_distance);
      ObjectSetInteger(chart_id, name, OBJPROP_YDISTANCE, y_distance);
      ObjectSetInteger(chart_id, name, OBJPROP_ZORDER, z_order);
      ObjectSetInteger(chart_id, name, OBJPROP_SELECTABLE, false);
      ObjectSetString(chart_id, name, OBJPROP_TOOLTIP, "\n");
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void setTextOBJ(long   chart_id,
                   string name,
                   string text
                  )
  {
   int hart_id =        ObjectFind(chart_id, name);
   if(ObjectFind(chart_id, name) != -1)
     {
      ObjectSetString(chart_id, name, OBJPROP_TEXT, text);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void setColorOBJ(long   chart_id,
                   string name,
                   color font_color
                  )
  {
   int hart_id =        ObjectFind(chart_id, name);
   if(ObjectFind(chart_id, name) != -1)
     {
           ObjectSetInteger(chart_id, name, OBJPROP_COLOR, font_color);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void setBGColorOBJ(long   chart_id,
                   string name,
                   color bg_color
                  )
  {
   int hart_id =        ObjectFind(chart_id, name);
   if(ObjectFind(chart_id, name) != -1)
     {
           ObjectSetInteger(chart_id, name, OBJPROP_BGCOLOR, bg_color);
     }
  }
  
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void setStateOBJ(long   chart_id,
                   string name,
                   bool state
                  )
  {
   int hart_id =        ObjectFind(chart_id, name);
   if(ObjectFind(chart_id, name) != -1)
     {
           ObjectSetInteger(chart_id, name, OBJPROP_STATE, state);
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool getStateOBJ(long chart_id,  string name){
   int hart_id =        ObjectFind(chart_id, name);
   if(ObjectFind(chart_id, name) != -1)
     {
         return  (bool)ObjectGetInteger(chart_id, name,OBJPROP_STATE);
     }
   return false;  
  }




//+------------------------------------------------------------------+
void showBitmap(const long            chart_ID,        // ID графика
                const int             sub_window,      // номер подокна
                const string          name,     // имя рисунка
                const string          file,           // имя файла с картинкой
                ENUM_BASE_CORNER      corner,
                int                   x_distance,
                int                   y_distance,
                const int             width,          // X-координата области видимости
                const int             height,         // Y-координата области видимости
                const long            z_order = 0)       // приоритет на нажатие мышью
  {
   ResetLastError();
   if(ObjectCreate(0, name, OBJ_BITMAP_LABEL, 0, 0, 0))
     {
      ObjectSetInteger(0, name, OBJPROP_CORNER, corner);
      ObjectSetInteger(chart_ID, name, OBJPROP_XSIZE, width);
      ObjectSetInteger(chart_ID, name, OBJPROP_YSIZE, height);
      ObjectSetInteger(chart_ID, name, OBJPROP_XDISTANCE, x_distance);
      ObjectSetInteger(chart_ID, name, OBJPROP_YDISTANCE, y_distance);
      ObjectSetInteger(chart_ID, name, OBJPROP_SELECTABLE, false);
      ObjectSetInteger(chart_ID, name, OBJPROP_ZORDER, z_order);
      ObjectSetInteger(chart_ID, name, OBJPROP_BACK, false);
      ResetLastError();
      //--- загрузим картинку для состояния кнопки "Нажата"
      if(!ObjectSetString(0, name, OBJPROP_BMPFILE, 0, file))
         PrintFormat("errorr %s. kod %d", file, GetLastError());
      ResetLastError();
      //--- загрузим картинку для состояния кнопки "Отжата"
      if(!ObjectSetString(0, name, OBJPROP_BMPFILE, 1, file))
         PrintFormat("errorr %s. kod %d", file, GetLastError());
      //--- отдадим графику команду на обновление, чтобы кнопка появилась сразу же, не дожидаясь тика
      ChartRedraw(0);
     }
   else
      PrintFormat("error  OBJ_BITMAP_LABEL. kod %d", GetLastError());
  }
//+------------------------------------------------------------------+
//void SetValue(int number, double value)
//  {
//   switch(number)
//     {
//      case p_TODAY          : _P.TODAY           = value ;
//      case p_YESTERDAY      : _P.YESTERDAY       = value;
//      case p_CURRENT_WEEK   : _P.CURRENT_WEEK    = value;
//      case p_LAST_WEEK      : _P.LAST_WEEK       = value;
//      case p_CURRENT_MONTH  : _P.CURRENT_MONTH   = value;
//      case p_LAST_MONTH     : _P.LAST_MONTH      = value;
//      case p_ENTIRE_PERIOD  : _P.ENTIRE_PERIOD   = value;
//      case p_BALANCE        : _P.BALANCE        = value;
//      case p_EQITY          : _P.EQITY          = value;
//      case p_MARGINFREE     : _P.MARGINFREE     = value;
//      case p_PROFIT         : _P.PROFIT         = value;
//      case p_DRAWDOWN       : _P.DRAWDOWN       = value;
//      case p_MAXDRAWDOWN    : _P.MAXDRAWDOWN     = value;
//      case p_SPREAD         : _P.SPREAD          = value;
//      case p_SWAP_LONG      : _P.SWAP_LONG       = value;
//      case p_SWAP_SHORT     : _P.SWAP_SHORT      = value;
//      case p_LEVERAGE       : _P.LEVERAGE        = value;
//      case p_REAL_LEVERAGE  : _P.REAL_LEVERAGE   = value;
//      case p_CURRENCY       : _P.CURRENCY        = value;
//      case p_PRICE_PIPS     : _P.PRICE_PIPS      = value;
//      case p_WEB            : _P.WEB             = value;
//      case p_DATE_TIME      : _P.DATE_TIME       = value;
//      default:         ;
//     }
//  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string GetValueDoubleToString(int number)
  {
   string empty = "-";
//MqlDateTime str1;
   switch(number)
     {
      case p_TODAY         : return (DoubleToString(_P.TODAY, 2));;
      case p_YESTERDAY     : return (DoubleToString(_P.YESTERDAY, 2));;
      case p_CURRENT_WEEK  : return (DoubleToString(_P.CURRENT_WEEK, 2));;
      case p_LAST_WEEK     : return (DoubleToString(_P.LAST_WEEK, 2));;
      case p_CURRENT_MONTH : return (DoubleToString(_P.CURRENT_MONTH, 2));;
      case p_LAST_MONTH    : return (DoubleToString(_P.LAST_MONTH, 2));;
      case p_ENTIRE_PERIOD : return (DoubleToString(_P.ENTIRE_PERIOD, 2));;
      case p_BALANCE       : return (DoubleToString(_P.BALANCE, 2));
      case p_EQITY         : return (DoubleToString(_P.EQITY, 2));
      case p_MARGINFREE    : return (DoubleToString(_P.MARGINFREE, 2));
      case p_PROFIT        : return (DoubleToString(_P.PROFIT, 2));
      case p_DRAWDOWN      : return (DoubleToString(_P.DRAWDOWN, 2));
      case p_MAXDRAWDOWN   : return (DoubleToString(_P.MAXDRAWDOWN, 2));
      case p_SPREAD        : return (DoubleToString(_P.SPREAD, 0));
      case p_SWAP_LONG     : return (DoubleToString(_P.SWAP_LONG, 2));
      case p_SWAP_SHORT    : return (DoubleToString(_P.SWAP_SHORT, 2));
      case p_LEVERAGE      : return (DoubleToString(_P.LEVERAGE, 0));
      case p_REAL_LEVERAGE : return (DoubleToString(_P.REAL_LEVERAGE, 2));
      case p_CURRENCY      : return _P.CURRENCY;
      case p_PRICE_PIPS    : return (DoubleToString(_P.PRICE_PIPS, 2));
      case p_PROFIT_UP     : return (DoubleToString(_P.PROFIT_UP, 2));
      case p_PROFIT_DN     : return (DoubleToString(_P.PROFIT_DN, 2));
      
      //case p_WEB           : return _P.WEB;
      //case p_DATE_TIME     : return _P.DATE_TIME ;
      default              :          return empty;
     }
   return empty ;
  }

//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
void  ShowPanel(bool on = true)
  {
   if(!on)
      return;
   int y_property = 20;   // Отступ сверху экрана
   int line_heght = 17;   // Межстрочный интервал
   int head_heght = 25;   // Ширина заголовочных разделов
   int ZP_heght   = 18 ;  // Ширина зп
   
   int font_size_header  = 14;
   int font_size  = 13;
   int font_size2 = 12;
   
   int font_size_btn  = 12;
   
   color    font_color    = clrWhite;
   color    font_color2   = C'234,167,39';
   color    font_color1   = clrYellowGreen;
   
   color    font_color3   = C'255,102,0' ;
   
   string font_name = "Calibri";
   int z_index = 0;
//ENUM_ANCHOR_POINT anchor = ANCHOR_RIGHT_UPPER;
//ENUM_BASE_CORNER  corner = CORNER_RIGHT_UPPER;
   ENUM_ANCHOR_POINT anchor = ANCHOR_RIGHT_UPPER;
   ENUM_BASE_CORNER  corner = CORNER_LEFT_UPPER;
   int x_first_column = 150;
   int x_second_column = 250;
   
  
   
   
   //string file      = "\\Images\\EURUSD_CUP.bmp";
   //string file2     = "::Images\\EURUSD_CUP.bmp";
//Лого
   showBitmap(CHART_ID, SUB_WINDOW, NAME_PANEL_LOGO , foto, corner, X_CPANEL, y_property, WIDTH_CPANEL, HEIGHT_LOGO, z_index);
// Панель
   showEdit(CHART_ID, SUB_WINDOW, NAME_PANEL_BKG , "", corner, font_name, font_size, font_color, WIDTH_CPANEL, HEIGHT_CPANEL, X_CPANEL, y_property = y_property + HEIGHT_LOGO, z_index++, clrDimGray, true);
// Загаловок панели
   showEdit(CHART_ID, SUB_WINDOW, NAME_PANEL_HDR1 , "               InGRID v1.00", corner, font_name, font_size, font_color, WIDTH_CPANEL, WIDTH_HEADER_CPANEL, X_CPANEL, y_property = y_property, z_index++,  font_color3, true);
// Названия и значения
   showZP_NameAndValue( ZP_TODAY          , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + ZP_heght+3, z_index++);
   showZP_NameAndValue( ZP_YESTERDAY      , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + ZP_heght, z_index++);
   showZP_NameAndValue( ZP_CURRENT_WEEK   , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + ZP_heght, z_index++);
   showZP_NameAndValue( ZP_LAST_WEEK      , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + ZP_heght, z_index++);
   showZP_NameAndValue( ZP_CURRENT_MONTH  , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + ZP_heght, z_index++);
   showZP_NameAndValue( ZP_LAST_MONTH     , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + ZP_heght, z_index++);
   showZP_NameAndValue( ZP_ENTIRE_PERIOD  , anchor, corner, font_name, font_size, clrLime, x_first_column, x_second_column, y_property = y_property + ZP_heght, z_index++);
 
   showZP_NameAndValue( ZP_COMMISION      , anchor, corner, font_name, font_size, clrLightGray, x_first_column, x_second_column, y_property = y_property + ZP_heght, z_index++);
   showZP_NameAndValue( ZP_SWAP           , anchor, corner, font_name, font_size, clrLightGray, x_first_column, x_second_column, y_property = y_property + ZP_heght, z_index++);
   
   //showNameAndValue(p_TODAY         , "Today : "         , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + head_heght - 5, z_index++);
   //showNameAndValue(p_YESTERDAY     , "Yesterday : "     , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   //showNameAndValue(p_CURRENT_WEEK  , "Current week : "  , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   //showNameAndValue(p_LAST_WEEK     , "Last week : "     , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   //showNameAndValue(p_CURRENT_MONTH , "Current month : " , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   //showNameAndValue(p_LAST_MONTH    , "Last month : "    , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   //showNameAndValue(p_ENTIRE_PERIOD , "Entire period : " , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
// Загаловок панели
   showEdit(0, 0, NAME_PANEL_HDR2, "CURRENT FINANCE", corner, font_name, font_size2, clrWhite , WIDTH_CPANEL, WIDTH_HEADER_CPANEL, X_CPANEL, y_property = y_property + head_heght, z_index++, font_color3 , true);
// Названия и значения
   showFN_NameAndValue( FN_KEY_BALANCE      , anchor, corner, font_name, font_size, clrYellow, x_first_column, x_second_column, y_property = y_property + head_heght - 5, z_index++);
   showFN_NameAndValue( FN_KEY_EQITY        , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   showFN_NameAndValue( FN_KEY_MARGINFREE   , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   showFN_NameAndValue( FN_KEY_PROFIT       , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   showFN_NameAndValue( FN_KEY_PROFIT_UP    , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   showFN_NameAndValue( FN_KEY_PROFIT_DN    , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   
   
   
   //showNameAndValue(p_BALANCE       , "Balance : "       , anchor, corner, font_name, font_size, clrYellow, x_first_column, x_second_column, y_property = y_property + head_heght - 5, z_index++);
   //showNameAndValue(p_EQITY         , "Eqity : "         , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   //showNameAndValue(p_MARGINFREE    , "MarginFree : "    , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   //showNameAndValue(p_PROFIT        , "Profit FULL : "   , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   //showNameAndValue(p_PROFIT_DN     , "Profit UP : "     , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   //showNameAndValue(p_PROFIT_UP     , "Profit DOWN : "   , anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
// Загаловок панели
   showEdit(0, 0, NAME_PANEL_HDR3 , "CONTROL", corner, font_name, font_size2, clrWhite, WIDTH_CPANEL, WIDTH_HEADER_CPANEL, X_CPANEL, y_property = y_property + head_heght, z_index++, font_color3 , true);
// Названия и значения
   showButton(0,0, NAME_BUTTON_START, "START AUTO",false,corner, font_name, font_size_btn, clrWhite, WIDTH_BUTTON, HEIGHT_BUTTON, X_CPANEL+12, y_property = y_property + head_heght+5, z_index++, font_color3, true);
   showButton(0,0, NAME_BUTTON_STOP , "CLOSE&STOP",false,corner, font_name, font_size_btn, clrWhite , WIDTH_BUTTON, HEIGHT_BUTTON, X_CPANEL+135, y_property  , z_index++, font_color3, true);
 
   showButton(0,0, NAME_BUTTON_START_UP, "TRADE DOWN",false,corner, font_name, font_size_btn, clrWhite, WIDTH_BUTTON, HEIGHT_BUTTON, X_CPANEL+12, y_property = y_property + head_heght+10, z_index++, font_color3, true);
   showButton(0,0, NAME_BUTTON_START_DN , "TRADE UP",false,corner, font_name, font_size_btn, clrWhite , WIDTH_BUTTON, HEIGHT_BUTTON, X_CPANEL+135, y_property  , z_index++, font_color3, true);
 
   showButton(0,0, NAME_BUTTON_STOP_UP, "CLOSE DOWN",false,corner, font_name, font_size_btn, clrWhite, WIDTH_BUTTON, HEIGHT_BUTTON, X_CPANEL+12, y_property = y_property + head_heght+10, z_index++, font_color3, true);
   showButton(0,0, NAME_BUTTON_STOP_DN , "CLOSE UP",false,corner, font_name, font_size_btn, clrWhite , WIDTH_BUTTON, HEIGHT_BUTTON, X_CPANEL+135, y_property  , z_index++, font_color3, true);
 
   
   //showNameAndValue(p_SPREAD, "Spread : ", anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + head_heght - 5, z_index++);
   //showNameAndValue(p_SWAP_LONG, "Swap long : ", anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   //showNameAndValue(p_SWAP_SHORT, "Swap short : ", anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   //showNameAndValue(p_LEVERAGE, "Leverage : ", anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   //showNameAndValue(p_REAL_LEVERAGE, "Real leverage : ", anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   //showNameAndValue(p_CURRENCY, "Currency : ", anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   //showNameAndValue(p_PRICE_PIPS, "Price pips : ", anchor, corner, font_name, font_size, font_color, x_first_column, x_second_column, y_property = y_property + line_heght, z_index++);
   //showLabel(0, 0, "Dotted_line",  "----------------------------------------", anchor, corner, font_name, font_size, font_color, x_second_column,  y_property = y_property + line_heght - 5, z_index);
   
   //showLabel(0, 0, aProp_names[p_DATE_TIME], "Server time : ", anchor, corner, font_name, font_size, font_color, x_first_column,  y_property = y_property + line_heght , z_index++);
   //showLabel(0, 0, aProp_values[p_DATE_TIME], GetStrTime(), anchor, corner, font_name, font_size, font_color, x_second_column,  y_property  , z_index++);
   
   
   //showLabel(0, 0, aProp_names[p_WEB],  "Date : ", anchor, corner, font_name, font_size, font_color, x_first_column,  y_property = y_property + line_heght, z_index++);
   //showLabel(0, 0, aProp_values[p_WEB],  GetStrDate() , anchor, corner, font_name, font_size, font_color, x_second_column,  y_property , z_index++);
   
   //showLabel(0, 0, aProp_names[(p_DAY_OF_WEEK)],  "Day of week : ", anchor, corner, font_name, font_size, font_color, x_first_column,  y_property = y_property + line_heght, z_index++);
   //showLabel(0, 0, aProp_values[p_DAY_OF_WEEK],  "-" , anchor, corner, font_name, font_size, font_color, x_second_column,  y_property , z_index++);
   
   //showLabel(0, 0, aProp_names[(p_COMMENT)] ,  "Comment : ", anchor, corner, font_name, 12, clrOrange, x_first_column,  y_property = y_property + line_heght+5, z_index++);
   //showLabel(0, 0, aProp_values[(p_COMMENT)] ,  "-" , anchor, corner, font_name, 12, clrOrange, x_second_column,  y_property , z_index++);
   
   
   //showLabel(0, 0, aProp_values[p_DATE_TIME], GetStrDate(), anchor, corner, font_name, font_size, clrAliceBlue, x_second_column,  y_property = y_property + line_heght + 5, z_index);
   
   //showLabel(0, 0, aProp_names[p_DATE_TIME], "Date : ", anchor, corner, font_name, font_size, clrAliceBlue, x_first_column,  y_property = y_property + line_heght + 5, z_index++);
   //showLabel(0, 0, aProp_values[p_DATE_TIME], GetStrTime(), anchor, corner, font_name, font_size, clrGold, x_second_column,  y_property = y_property + line_heght + 5, z_index);
   
   //showLabel(0, 0, aProp_values[p_DATE_TIME], (string)TimeCurrent(), anchor, corner, font_name, font_size, clrAliceBlue, x_second_column,  y_property = y_property + line_heght + 5, z_index);
   ChartRedraw();
  }

string   GetStrDate(){
 
 string _TimeLocal = (string)TimeLocal();
string sep=" ";                              // разделитель в виде символа
ushort u_sep;                                // код символа разделителя
string result[];                             // массив для получения строк
u_sep=StringGetCharacter(sep,0);             //--- получим код разделителя
int k=StringSplit(_TimeLocal,u_sep,result);  //--- разобьем строку на подстроки
 return result[0];
}
string   GetStrTime(){
 
// string _TimeLocal = (string)TimeLocal();
 string _TimeLocal = (string) TimeTradeServer();
 

string sep=" ";                              // разделитель в виде символа
ushort u_sep;                                // код символа разделителя
string result[];                             // массив для получения строк
u_sep=StringGetCharacter(sep,0);             //--- получим код разделителя
int k=StringSplit(_TimeLocal,u_sep,result);  //--- разобьем строку на подстроки
 return (string)result[1];
}


  
//+------------------------------------------------------------------+
void DestroyPanel()
  {
   DestroyObject("Logo");
   DestroyObject("CPanelBkg");
   DestroyObject("CPanelHdr1");
   DestroyObject("CPanelHdr2");
   DestroyObject("CPanelHdr3");
   DestroyObject("Dotted_line");
   for(int i = 0; i < INFO_PANEL_SIZE; i++)
     {
      DestroyObject(aProp_names[i]);
      DestroyObject(aProp_values[i]);
     }
   ChartRedraw();
  }
//+------------------------------------------------------------------+
void DestroyObject(string name)
  {
   int sub_window = 0;
   int res = false;
   sub_window = ObjectFind(ChartID(), name);
   if(sub_window >= 0)
     {
      res = ObjectDelete(ChartID(), name);
      if(!res)
         Print("Error delete object - " + name);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void showNameAndValue(int number,
                      string textLabel,
                      ENUM_ANCHOR_POINT anchor,
                      ENUM_BASE_CORNER  corner,
                      string font_name,
                      int font_size,
                      color font_color,
                      int x_first_column,
                      int x_second_columnn,
                      int y_prop_array,
                      int z_index

                     )
  {
   showLabel(0, 0, aProp_names[number],  textLabel,  anchor, corner, font_name, font_size, font_color, x_first_column,   y_prop_array, z_index);
   showLabel(0, 0, aProp_values[number], GetValueDoubleToString(number),  anchor, corner, font_name, font_size, font_color, x_second_columnn, y_prop_array, z_index);
  }
  
  //+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void showFN_NameAndValue(string name,
                      ENUM_ANCHOR_POINT anchor,
                      ENUM_BASE_CORNER  corner,
                      string font_name,
                      int font_size,
                      color font_color,
                      int x_first_column,
                      int x_second_columnn,
                      int y_prop_array,
                      int z_index

                     )
  {
   showLabel(0, 0, jFN[name][(NAME_KEY)].ToStr(),  jFN[name][(TEXT)].ToStr() ,  anchor, corner, font_name, font_size, font_color, x_first_column,   y_prop_array, z_index);
   showLabel(0, 0, jFN[name][(NAME_VAL)].ToStr(), DoubleToString(jFN[name][(VAL)].ToDbl(),2),  anchor, corner, font_name, font_size, font_color, x_second_columnn, y_prop_array, z_index);
  }
  
  //+------------------------------------------------------------------+
  //|                                                                  |
  //+------------------------------------------------------------------+
  
  void showZP_NameAndValue( string name,                      
                      ENUM_ANCHOR_POINT anchor,
                      ENUM_BASE_CORNER  corner,
                      string font_name,
                      int font_size,
                      color font_color,
                      int x_first_column,
                      int x_second_columnn,
                      int y_prop_array,
                      int z_index

                     )
  {
   showLabel(0, 0, jZP[name][(NAME_KEY)].ToStr() ,  jZP[name][(TEXT)].ToStr(),  anchor, corner, font_name, font_size, font_color, x_first_column,   y_prop_array, z_index);
   showLabel(0, 0, jZP[name][(NAME_VAL)].ToStr(), DoubleToString( jZP[name][(VAL)].ToDbl() ,2) ,  anchor, corner, font_name, font_size, font_color, x_second_columnn, y_prop_array, z_index);
  }
  
  
  
  //+------------------------------------------------------------------+
  //|                                                                  |
  //+------------------------------------------------------------------+
  string GetStringFile(string fileName){
   string str; 
   ResetLastError(); 
   int file_handle=FileOpen(fileName,FILE_SHARE_READ|FILE_TXT);   
   if(file_handle!=INVALID_HANDLE) 
     {   
      int    str_size; 
      while(!FileIsEnding(file_handle)) 
        {       
         str_size=FileReadInteger(file_handle,INT_VALUE); 
         //Print("str_size = " + (string)str_size);
         str=FileReadString(file_handle,str_size);         
         // Print("str = " + str);
        } 
      FileClose(file_handle); 
     } 
   else 
      Print("Не удалось открыть файл %s, Код ошибки = %d" + fileName +(string)GetLastError()); 
      return str;
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool SetStringFile(string fileName, string str, bool end = true ){
 //--- откроем файл для записи значений индикатора (если его нет, то создастся автоматически) 
   ResetLastError(); 
   int file_handle=FileOpen(fileName,FILE_WRITE|FILE_TXT); 
    //Print(__FUNCTION__ ," -----------  fileName = " ,fileName );
    //Print(__FUNCTION__ ," -----------  file_handle = " ,file_handle );
    
     
   if(file_handle != INVALID_HANDLE) 
     { 
      //--- строка сформирована, запишем ее в файл 
      if(end) str = str+"\r\n"; 
      
    int count =  (int)FileWriteString(file_handle,str); 
      datetime  dateStart=(datetime)FileGetInteger(fileName,FILE_CREATE_DATE,false);
      //--- закрываем файл 
      FileClose(file_handle); 
       return true; 
     } 
   else 
      Print(__FUNCTION__ ," ----------- error open fileName = " ,fileName ," kod = ", (string)GetLastError()); 
 return false; 
 } 
   
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetZP_FromFile(){

    string data_str = GetStringFile(file_ZP );
    jFILE.Deserialize(data_str);
    
    //Print(__FUNCTION__ ," ----------- jFILE = " , jFILE.Serialize()); 
    
    jZP[(ZP_TODAY)][(VAL)]          = jFILE[(ZP_TODAY)][(VAL)].ToDbl();
    jZP[(ZP_YESTERDAY)][(VAL)]      = jFILE[(ZP_YESTERDAY)][(VAL)].ToDbl();
    jZP[(ZP_CURRENT_WEEK)][(VAL)]   = jFILE[(ZP_CURRENT_WEEK)][(VAL)].ToDbl();
    jZP[(ZP_LAST_WEEK)][(VAL)]      = jFILE[(ZP_LAST_WEEK)][(VAL)].ToDbl();
    jZP[(ZP_CURRENT_MONTH)][(VAL)]  = jFILE[(ZP_CURRENT_MONTH)][(VAL)].ToDbl();
    jZP[(ZP_LAST_MONTH)][(VAL)]     = jFILE[(ZP_LAST_MONTH)][(VAL)].ToDbl();
    jZP[(ZP_ENTIRE_PERIOD)][(VAL)]  = jFILE[(ZP_ENTIRE_PERIOD)][(VAL)].ToDbl();

}

void GetParamsFromFile(){

//   BALANCE_START  = (double)GetStringFile(file_BALANCE_START);
//   START_DATETIME = (datetime)GetStringFile(file_DAY0_ID);
//     
//   PRFT.DAY0 = (int)GetStringFile(file_DAY0_ID);
//   PRFT.WEEK0 = (int)GetStringFile(file_WEEK0_ID);
//   MONTH0_ID = (int)GetStringFile(file_MONTH0_ID);     
     
//    _P.TODAY = (double)GetStringFile(file_TODAY    );
//    _P.YESTERDAY = (double)GetStringFile(file_YESTERDAY);
//    
//    _P.CURRENT_WEEK = (double)GetStringFile(file_CURRENT_WEEK);
//    _P.LAST_WEEK = (double)GetStringFile(file_LAST_WEEK);
//    
//    _P.CURRENT_MONTH = (double)GetStringFile(file_CURRENT_MONTH);
//    _P.LAST_MONTH = (double)GetStringFile(file_LAST_MONTH);
//     
//    _P.ENTIRE_PERIOD = (double)GetStringFile(file_ENTIRE_PERIOD);
//    _P.MAXDRAWDOWN = (double)GetStringFile(file_MAXDRAWDOWN);
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetZP_IntoFile (){

    //Print(__FUNCTION__ ," ----------- file_ZP = " , jZP.Serialize()); 

    SetStringFile(file_ZP,  jZP.Serialize()  ,false);
//     
    
//     SetStringFile(file_START_DATETIME,(string)(START_DATETIME),false);
//     
//     SetStringFile(file_LAST_BALANCE,(string)(LAST_BALANCE),false);
//               
//     SetStringFile(file_DAY0_ID,     (string)(DAY0_ID),false);
//     SetStringFile(file_WEEK0_ID,    (string)(WEEK0_ID),false);
//     SetStringFile(file_MONTH0_ID,   (string)(MONTH0_ID),false);     
//     
//     SetStringFile(file_TODAY    ,   (string)(_P.TODAY),false);
//     SetStringFile(file_YESTERDAY,   (string)(_P.YESTERDAY),false);
//    
//     SetStringFile(file_CURRENT_WEEK,(string)(_P.CURRENT_WEEK),false);
//     SetStringFile(file_LAST_WEEK,    (string)(_P.LAST_WEEK),false);
//    
//     SetStringFile(file_CURRENT_MONTH, (string)(_P.CURRENT_MONTH),false);
//     SetStringFile(file_LAST_MONTH,    (string)(_P.LAST_MONTH),false);
//     
//     SetStringFile(file_ENTIRE_PERIOD, (string)(_P.ENTIRE_PERIOD),false);
//     SetStringFile(file_MAXDRAWDOWN, (string)(_P.MAXDRAWDOWN),false);        
}
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ShowZP_Trade()
{
   setValueLabel(CHART_ID ,jZP[(ZP_TODAY)][(NAME_VAL)].ToStr()         , DoubleToString( jZP[(ZP_TODAY)][(VAL)].ToDbl(),2) )         ;
   setValueLabel(CHART_ID ,jZP[(ZP_YESTERDAY)][(NAME_VAL)].ToStr()     , DoubleToString( jZP[(ZP_YESTERDAY)][(VAL)].ToDbl(),2) )     ;
   setValueLabel(CHART_ID ,jZP[(ZP_CURRENT_WEEK)][(NAME_VAL)].ToStr()  , DoubleToString( jZP[(ZP_CURRENT_WEEK)][(VAL)].ToDbl(),2) )  ;
   setValueLabel(CHART_ID ,jZP[(ZP_LAST_WEEK)][(NAME_VAL)].ToStr()     , DoubleToString( jZP[(ZP_LAST_WEEK)][(VAL)].ToDbl(),2) )     ;
   setValueLabel(CHART_ID ,jZP[(ZP_CURRENT_MONTH)][(NAME_VAL)].ToStr() , DoubleToString( jZP[(ZP_CURRENT_MONTH)][(VAL)].ToDbl(),2) ) ;
   setValueLabel(CHART_ID ,jZP[(ZP_LAST_MONTH)][(NAME_VAL)].ToStr()    , DoubleToString( jZP[(ZP_LAST_MONTH)][(VAL)].ToDbl(),2) )    ;
   setValueLabel(CHART_ID ,jZP[(ZP_ENTIRE_PERIOD)][(NAME_VAL)].ToStr() , DoubleToString( jZP[(ZP_ENTIRE_PERIOD)][(VAL)].ToDbl(),2) ) ;  
   setValueLabel(CHART_ID ,jZP[(ZP_COMMISION)][(NAME_VAL)].ToStr()     , DoubleToString( jZP[(ZP_COMMISION)][(VAL)].ToDbl(),2) ) ;
   setValueLabel(CHART_ID ,jZP[(ZP_SWAP)][(NAME_VAL)].ToStr()          , DoubleToString( jZP[(ZP_SWAP)][(VAL)].ToDbl(),2) ) ;
}
//+------------------------------------------------------------------+
void ShowPropertiesTik()
{

jFN[FN_KEY_BALANCE][VAL]      = AccountInfoDouble(ACCOUNT_BALANCE);
jFN[FN_KEY_EQITY][VAL]        = AccountInfoDouble(ACCOUNT_EQUITY);
jFN[FN_KEY_MARGINFREE][VAL]   = AccountInfoDouble(ACCOUNT_MARGIN_FREE);
jFN[FN_KEY_PROFIT][VAL]       = AccountInfoDouble(ACCOUNT_PROFIT);
jFN[FN_KEY_PROFIT_UP][VAL]    = GetProfitBUY_SELL_PREFIX(NAME_PREFIX_SL);
jFN[FN_KEY_PROFIT_DN][VAL]    = GetProfitBUY_SELL_PREFIX(NAME_PREFIX_BL);

setValueLabel(CHART_ID , FN_VAL_BALANCE      , DoubleToString(jFN[FN_KEY_BALANCE][VAL].ToDbl()     , 2) ); 
setValueLabel(CHART_ID , FN_VAL_EQITY        , DoubleToString(jFN[FN_KEY_EQITY][VAL].ToDbl()       , 2) ); 
setValueLabel(CHART_ID , FN_VAL_MARGINFREE   , DoubleToString(jFN[FN_KEY_MARGINFREE][VAL].ToDbl()  , 2) ); 
setValueLabel(CHART_ID , FN_VAL_PROFIT       , DoubleToString(jFN[FN_KEY_PROFIT][VAL].ToDbl()      , 2) ); 
setValueLabel(CHART_ID , FN_VAL_PROFIT_UP    , DoubleToString(jFN[FN_KEY_PROFIT_UP][VAL].ToDbl()   , 2) ); 
setValueLabel(CHART_ID , FN_VAL_PROFIT_DN    , DoubleToString(jFN[FN_KEY_PROFIT_DN][VAL].ToDbl()   , 2) ); 


//_P.BALANCE      = AccountInfoDouble(ACCOUNT_BALANCE);
//_P.EQITY        = AccountInfoDouble(ACCOUNT_EQUITY);
//_P.MARGINFREE   = AccountInfoDouble(ACCOUNT_MARGIN_FREE);
//_P.PROFIT       = AccountInfoDouble(ACCOUNT_PROFIT);
//_P.PROFIT_UP    = GetProfitBUY_SELL_PREFIX(NAME_PREFIX_SL);
//_P.PROFIT_DN    = GetProfitBUY_SELL_PREFIX(NAME_PREFIX_BL);

//double DRAWDOWN = ((_P.BALANCE - _P.EQITY  )/(_P.BALANCE ))*100;

//Print(__FUNCTION__, "----------------------------> DRAWDOWN =", DRAWDOWN);

//_P.DRAWDOWN     = DRAWDOWN > 0 ? DRAWDOWN : 0 ; 
//_P.MAXDRAWDOWN  = DRAWDOWN >  _P.MAXDRAWDOWN? DRAWDOWN: _P.MAXDRAWDOWN;

//_P.SPREAD       = SymbolInfoInteger(_Symbol , SYMBOL_SPREAD);
//_P.SWAP_LONG    = SymbolInfoDouble( _Symbol ,SYMBOL_SWAP_LONG);
//_P.SWAP_SHORT   = SymbolInfoDouble( _Symbol ,SYMBOL_SWAP_SHORT);
//_P.LEVERAGE     = AccountInfoInteger(ACCOUNT_LEVERAGE);

//Расчет стоимости 1 пипса
//if( PositionsTotal() > 0)
//GetLotsFull(Magic);

//double FULLVOLUME = GetLotsFull(Magic);
//double _TRADE_TICK_VALUE =SymbolInfoDouble(_Symbol,SYMBOL_TRADE_TICK_VALUE) ;
//double _TRADE_TICK_SIZE = ( SymbolInfoDouble(_Symbol,SYMBOL_TRADE_TICK_SIZE)  ) ;
//double _POINT = SymbolInfoDouble(_Symbol,SYMBOL_POINT);
// MQL4
// Lots * MarketInfo(Symbol(),MODE_TICKVALUE) / ( MarketInfo(Symbol(),MODE_TICKSIZE) / MarketInfo(Symbol(),MODE_POINT) )
// MQL5
//_P.PRICE_PIPS  =  MathAbs(FULLVOLUME * _TRADE_TICK_VALUE  / ( _TRADE_TICK_SIZE  / _POINT   )) ;
 
//Print(__FUNCTION__, "----------------------------------------------> FULLVOLUME = ", FULLVOLUME );
//Print(__FUNCTION__, "----------------------------------------------> _P.PRICE_PIPS = ", _P.PRICE_PIPS );

//setValueLabel(CHART_ID ,aProp_values[(p_BALANCE)]        , GetValueDoubleToString(p_BALANCE) ); 
//setValueLabel(CHART_ID ,aProp_values[(p_EQITY)]          , GetValueDoubleToString(p_EQITY) ); 
//setValueLabel(CHART_ID ,aProp_values[(p_MARGINFREE)]     , GetValueDoubleToString(p_MARGINFREE) ); 
//setValueLabel(CHART_ID ,aProp_values[(p_PROFIT)]         , GetValueDoubleToString(p_PROFIT) ); 
//setValueLabel(CHART_ID ,aProp_values[(p_PROFIT_UP)]      , GetValueDoubleToString(p_PROFIT_UP) );
//setValueLabel(CHART_ID ,aProp_values[(p_PROFIT_DN)]      , GetValueDoubleToString(p_PROFIT_DN) );
 

//setValueLabel(CHART_ID ,aProp_values[(p_DRAWDOWN)]       , GetValueDoubleToString(p_DRAWDOWN)+"%" ); 
//setValueLabel(CHART_ID ,aProp_values[(p_MAXDRAWDOWN)]    , GetValueDoubleToString(p_MAXDRAWDOWN)+"%" ); 

//setValueLabel(CHART_ID ,aProp_values[(p_SPREAD)]         , GetValueDoubleToString(p_SPREAD) ); 
//setValueLabel(CHART_ID ,aProp_values[(p_SWAP_LONG)]      , GetValueDoubleToString(p_SWAP_LONG) ); 
//setValueLabel(CHART_ID ,aProp_values[(p_SWAP_SHORT)]     , GetValueDoubleToString(p_SWAP_SHORT) ); 
//setValueLabel(CHART_ID ,aProp_values[(p_LEVERAGE)]       , "1:" + GetValueDoubleToString(p_LEVERAGE) ); 
//setValueLabel(CHART_ID ,aProp_values[(p_REAL_LEVERAGE)]  , GetValueDoubleToString(p_REAL_LEVERAGE) ); 
//setValueLabel(CHART_ID ,aProp_values[(p_PRICE_PIPS)]     , GetValueDoubleToString(p_PRICE_PIPS) ); 

}
//+-----------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void SetZPTime(){

 //Если НОВЫЙ МЕСЯЦ
 if(jZP[ZP_CURRENT_MONTH][DATE].ToInt()  != (int)iTime(_Symbol,PERIOD_MN1,0) ){

    jZP[ZP_CURRENT_MONTH][DATE]   = (int)iTime(_Symbol,PERIOD_MN1,0); 
         //---
    jZP[ZP_LAST_MONTH][VAL]    =  jZP[ZP_CURRENT_MONTH][VAL].ToDbl(); 
    jZP[ZP_CURRENT_MONTH][VAL] =  0;   
 }    
 //Если  НОВАЯ НЕДЕЛЯ
if( jZP[ZP_CURRENT_WEEK][DATE].ToInt()  != (int)iTime(_Symbol,PERIOD_W1,0) ){
    
    jZP[ZP_CURRENT_WEEK][DATE]    = (int)iTime(_Symbol,PERIOD_W1,0);
    //---
    jZP[ZP_LAST_WEEK][VAL]     =  jZP[ZP_CURRENT_WEEK][NAME_VAL].ToDbl(); 
    jZP[ZP_CURRENT_WEEK][VAL]  =  0;
 } 
if( jZP[ZP_TODAY][DATE].ToInt() != (int)iTime(_Symbol,PERIOD_D1,0) ){
    //---
    jZP[ZP_TODAY][DATE]        = (int)iTime(_Symbol,PERIOD_D1,0); 
    //---
    jZP[ZP_YESTERDAY][VAL]  =  jZP[ZP_TODAY][NAME_VAL].ToDbl(); 
    jZP[ZP_TODAY][VAL]      =  0; 
   SetZP_IntoFile();      
 }
 
////-------------------------------
// setValueLabel(CHART_ID ,aProp_values[(p_WEB)]            , (string)(int)(_dt.day_of_week ) );/
 //setValueLabel(CHART_ID ,aProp_values[(p_WEB)]            , GetStrDate() );// 
 //setValueLabel(CHART_ID ,aProp_values[(p_DATE_TIME)]      , GetStrTime() );//
 //setValueLabel(CHART_ID ,aProp_values[(p_DAY_OF_WEEK)]    , GetName_DAY_OF_WEEK() );// 
 
}
enum months  // перечисление именованных констант 
   { 
    January, 
    February, 
    March, 
    April, 
    May, 
    June, 
    July, 
    August, 
    September, 
    October, 
    November, 
    December 
   };

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string GetName_DAY_OF_WEEK(){
    // if(_dt.day_of_week == 0 ) return "Воскресенье" ;
    // if(_dt.day_of_week == 1 ) return "Понедельник" ;
    // if(_dt.day_of_week == 2 ) return "Вторник" ;
    // if(_dt.day_of_week == 3 ) return "Среда" ;
    // if(_dt.day_of_week == 4 ) return "Четверг" ;
    // if(_dt.day_of_week == 5 ) return "Пятница" ;
    // if(_dt.day_of_week == 6 ) return "Суббота" ;

if (_dt.day_of_week == 0 ) return " Sunday" ;
if (_dt.day_of_week == 1 ) return " Monday" ;
if (_dt.day_of_week == 2 ) return " Tuesday" ;
if (_dt.day_of_week == 3 ) return " Wednesday" ;
if (_dt.day_of_week == 4 ) return " Thursday" ;
if (_dt.day_of_week == 5 ) return " Friday" ;
if (_dt.day_of_week == 6 ) return " Saturday" ;

    return "";    
   }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void setValueLabel(long   chart_id,
                   string name,
                   string text
                  )
  {
   int hart_id =        ObjectFind(chart_id, name);
   if(ObjectFind(chart_id, name) != -1)
     {
      ObjectSetString(chart_id, name, OBJPROP_TEXT, text);
     }
  }
  
 //+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void setPanelTOP(long   chart_id,
                   string name
                  )
  {
   int hart_id =        ObjectFind(chart_id, name);
   if(ObjectFind(chart_id, name) != -1)
     {
     //--- Отключим видимость 
      ObjectSetInteger(0,name,OBJPROP_TIMEFRAMES,OBJ_NO_PERIODS); 
      //--- Включим видимость   
      ObjectSetInteger(0,name,OBJPROP_TIMEFRAMES,OBJ_ALL_PERIODS); 

     }
  }
  
 //+------------------------------------------------------------------+
 //|                                                                  |
 //+------------------------------------------------------------------+
 void PanelTop(){
      
 // Помещаем панель наверх
      setPanelTOP( 0, NAME_PANEL_LOGO );
      setPanelTOP( 0, NAME_PANEL_BKG );
      setPanelTOP( 0, NAME_PANEL_HDR1 );
      setPanelTOP( 0, NAME_PANEL_HDR2 );
      setPanelTOP( 0, NAME_PANEL_HDR3 );
      //
      setPanelTOP( 0, ZP_TODAY );
      setPanelTOP( 0, ZP_PROFIT_TODAY );
      setPanelTOP( 0, ZP_YESTERDAY );
      setPanelTOP( 0, ZP_PROFIT_YESTERDAY );
      setPanelTOP( 0, ZP_CURRENT_WEEK );
      setPanelTOP( 0, ZP_PROFIT_CURRENT_WEEK );
      setPanelTOP( 0, ZP_LAST_WEEK );
      setPanelTOP( 0, ZP_PROFIT_LAST_WEEK );
      setPanelTOP( 0, ZP_CURRENT_MONTH );
      setPanelTOP( 0, ZP_PROFIT_CURRENT_MONTH );
      setPanelTOP( 0, ZP_LAST_MONTH );
      setPanelTOP( 0, ZP_PROFIT_LAST_MONTH );
      setPanelTOP( 0, ZP_ENTIRE_PERIOD );
      setPanelTOP( 0, ZP_PROFIT_ENTIRE_PERIOD );
      setPanelTOP( 0, ZP_COMMISION );
      setPanelTOP( 0, ZP_VAL_COMMISION );
      setPanelTOP( 0, ZP_SWAP );
      setPanelTOP( 0, ZP_VAL_SWAP );
      //---
      setPanelTOP( 0, FN_KEY_BALANCE );
      setPanelTOP( 0, FN_VAL_BALANCE );      
      setPanelTOP( 0, FN_KEY_EQITY );
      setPanelTOP( 0, FN_VAL_EQITY );      
      setPanelTOP( 0, FN_KEY_MARGINFREE );
      setPanelTOP( 0, FN_VAL_MARGINFREE );      
      setPanelTOP( 0, FN_KEY_PROFIT );
      setPanelTOP( 0, FN_VAL_PROFIT );      
      setPanelTOP( 0, FN_KEY_PROFIT_UP );
      setPanelTOP( 0, FN_VAL_PROFIT_UP );      
      setPanelTOP( 0, FN_KEY_PROFIT_DN );
      setPanelTOP( 0, FN_VAL_PROFIT_DN );      //---
      setPanelTOP( 0, NAME_BUTTON_START );
      setPanelTOP( 0, NAME_BUTTON_STOP );
      setPanelTOP( 0, NAME_BUTTON_START_UP );
      setPanelTOP( 0, NAME_BUTTON_START_DN );
      setPanelTOP( 0, NAME_BUTTON_STOP_UP );
      setPanelTOP( 0, FN_KEY_BALANCE );
      setPanelTOP( 0, NAME_BUTTON_STOP_DN );     
 
 } 