   //+------------------------------------------------------------------+
   //| Class CControlsDialog                                            |
   //| Usage: main dialog of the Controls application                   |
   //+------------------------------------------------------------------+
   
   #include <Controls\Dialog.mqh>
   #include <Controls\Label.mqh>   
   //#include <Controls\Button.mqh>
   //#include <Controls\Edit.mqh>   
   //#include <Controls\ComboBox.mqh>
 
  


   
   //--- indents and gaps
   #define INDENT_LEFT                         (11)      // indent from left (with allowance for border width)
   #define INDENT_TOP                          (11)      // indent from top (with allowance for border width)
   #define DT_X                                (50)      // gap by X coordinate
   #define DTPOS_X                             (100)     // gap by X coordinate
   #define DT_Y                                (12)      // gap by Y coordinate
   #define LABEL_HEIGHT                        (10)      // size by Y coordinate
   #define POS                                 (12)      // size by Y coordinate
   #define COL                                 (6)       // size by Y coordinate
   #define INDEX                               (60)      // size by Y coordinate
   
   
   
   class CControlsDialog : public CAppDialog
     {     
   private:
      CLabel m_label[INDEX][POS];
   public:
                        CControlsDialog(void);
                       ~CControlsDialog(void);
      //--- create
   
      virtual bool      Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2 );
      
      //--- chart event handler
      virtual bool      OnEvent(const int id,const long &lparam,const double &dparam,const string &sparam);
      //----Set Text Profit Buy
      virtual bool      SetValue(int pos, int index, string text) ;
      virtual bool      SetStr(int index , int pos ,string text, color clr= clrWhite);
      virtual bool      SetInfo(int index , int col, string strKey , string strValue , color clr= clrWhite , bool on = true );
      virtual bool      SetInfoIntoCol(int index , int col, string strKey , string strValue  );
   
   protected:
      //--- create dependent controls
      bool              m_labelCreate(int index , int pos, string txt, int x1, int y1, int x2, int y2, color clr = clrWhite);
      bool              CreateLabel(int index , int col );
      bool              DialogColor(void);
      
      void              koord_0( int &x1,  int &x2, int &y1, int &index , int &col);
      void              koord_1( int &x1,  int &x2, int &y1, int &index , int &col);
      void              koord_2( int &x1,  int &x2, int &y1, int &index , int &col);
      void              koord_3( int &x1,  int &x2, int &y1, int &index , int &col);   
      
      //--- handlers of the dependent controls events
   
     };
   //+------------------------------------------------------------------+
   //| Event Handling                                                   |
   //+------------------------------------------------------------------+
   EVENT_MAP_BEGIN(CControlsDialog)
   //ON_EVENT(ON_CLICK,m_button1,OnClickButton1)
   EVENT_MAP_END(CAppDialog)
   //+------------------------------------------------------------------+
   //| Constructor                                                      |
   //+------------------------------------------------------------------+
   CControlsDialog::CControlsDialog(void)
     {
     }
   //+------------------------------------------------------------------+
   //| Destructor                                                       |
   //+------------------------------------------------------------------+
   CControlsDialog::~CControlsDialog(void)
     {
     }
   //+------------------------------------------------------------------+
   //| Create                                                           |
   //+------------------------------------------------------------------+
   bool CControlsDialog::Create(const long chart,const string name,const int subwin,const int x1,const int y1,const int x2,const int y2)
     {
      if(!CAppDialog::Create(chart,name,subwin,x1,y1,x2,y2))
         return(false);
                 DialogColor();      
   //--- create dependent controls
         for(int col = 0 ; col < COL ; col++){
        for(int index = 0; index < INDEX ; index++){              
            if(!CreateLabel( index , col ))
            return(false);     
        }
      }
   //--- succeed
      return(true);
     }
   //+------------------------------------------------------------------+
   //|                                                                  |
   //+------------------------------------------------------------------+
   bool CControlsDialog::DialogColor(void)
     {
      string prefix=Name();
      int total= ControlsTotal();
      for(int i=0;i<total;i++)
        {
         CWnd*obj=Control(i);
         string name=obj.Name();
         //---
         if(name==prefix+"Border")
           {
            CPanel *panel=(CPanel*) obj;
            panel.ColorBackground(clrBlack);
            panel.ColorBorder(clrBlue);
            ChartRedraw();
           }
         if(name==prefix+"Back")
           {
            CPanel *panel=(CPanel*) obj;
            panel.ColorBackground(clrBlack);
            ChartRedraw();
           }
         if(name==prefix+"Client")
           {
            CWndClient *wndclient=(CWndClient*) obj;
            wndclient.ColorBackground(clrBlack);         
            wndclient.ColorBorder(clrBlack);
          //--- Обход всех объектов
            //int client_total=wndclient.ControlsTotal();
            //for(int j=0;j<client_total;j++)
            //  {
            //   CWnd*client_obj=wndclient.Control(j);
            //   string client_name=client_obj.Name();
            //   if(client_name=="Button1")
            //     {
            //      CButton *button=(CButton*) client_obj;
            //      button.ColorBackground(clrNONE);
            //      ChartRedraw();
            //     }
            //  }
            ChartRedraw();
           }
   //        
         if(name==prefix+"Caption")
           {
            CEdit *edit=(CEdit*) obj;
            //color clr=(color)GETRGB(XRGB(rand()%255,rand()%255,rand()%255));
            edit.ColorBackground(clrBlack);
            edit.ColorBorder(clrBlack);
            edit.Color(clrAqua);
            //edit.Width(336);
            ChartRedraw();
            //return;
           }
           
           //ExtDialog.Delete(myclient);
        }
      return(CDialog::OnDialogDragStart());
     }
   //+------------------------------------------------------------------+
   //| Create the "Label1" label                                        |
   //+------------------------------------------------------------------+
   bool CControlsDialog::m_labelCreate(int index , int pos, string txt,int x1,int y1,int x2, int y2, color clr){
         ////txt = m_name + "Label" + (string)pos + (string)index + " k: " + x1 + " " + y1 + " " + x2 + " " +  y2 ;
         //Print("----------------> Label_" + (string)index + "_" + (string)pos +  " | x1 = " + x1 + " y1 = " + y1   );
         if(!m_label[index][pos].Create(m_chart_id,m_name + "Label_" +(string)index + "_" + (string)pos   , m_subwin, x1, y1, x2, y2))
         return(false);
         if(!m_label[index][pos].Text(txt))
         return(false);
         if(!m_label[index][pos].Color(clr))
         return(false); 
         if(!m_label[index][pos].FontSize(8))
         return(false);            
         if(!Add(m_label[index][pos]))
         return(false); 
         return true;
         }
   void CControlsDialog::koord_0( int &x1,  int &x2, int &y1, int &index , int &col){
         x1= INDENT_LEFT + col * 105 ;
         x2= x1 + DT_X - 3 ;
         y1=INDENT_TOP  + index * DT_Y ;
   }
   void CControlsDialog::koord_1( int &x1,  int &x2, int &y1, int &index , int &col){
         x1= INDENT_LEFT + col * 78 ;
         x2= x1 + 50 ;
         y1=INDENT_TOP  + index * DT_Y ; 
   }
   
   void CControlsDialog::koord_2( int &x1,  int &x2, int &y1, int &index , int &col){
         x1= INDENT_LEFT + col * 115 ;
         x2= x1 + 60 ;
         y1=INDENT_TOP  + index * DT_Y ; 
   }
   void CControlsDialog::koord_3( int &x1,  int &x2, int &y1, int &index , int &col){
         x1= INDENT_LEFT + col * 130 ;
         x2= x1 + 65 ;
         y1=INDENT_TOP  + index * DT_Y ; 
   }
   
   bool CControlsDialog::CreateLabel(int index , int col )
     {
   //  
      int x1;
      int x2;
      int y1;
   //--- coordinates
      switch(index){
      case 0:  koord_0(x1, x2, y1, index, col)  ;  break;
      case 1:  koord_0(x1, x2, y1, index, col)  ;  break;
      case 2:  koord_0(x1, x2, y1, index, col)  ;  break;    
      case 3:  koord_0(x1, x2, y1, index, col)  ;  break;      
      case 4:  koord_1(x1, x2, y1, index, col)  ;  break;
      case 5:  koord_1(x1, x2, y1, index, col)  ;  break;
      case 6:  koord_0(x1, x2, y1, index, col)  ;  break;   
      case 7:  koord_1(x1, x2, y1, index, col)  ;  break;               
      case 8:  koord_0(x1, x2, y1, index, col)  ;  break;
      //case 9: koord_2(x1, x2, y1, index, col)  ;  break;
      //case 10: koord_2(x1, x2, y1, index, col)  ;  break;
      //case 11: koord_2(x1, x2, y1, index, col)  ;  break;
      //case 12: koord_2(x1, x2, y1, index, col)  ;  break;
      //case 13: koord_2(x1, x2, y1, index, col)  ;  break;
      //case 14: koord_2(x1, x2, y1, index, col)  ;  break;
      //case 15: koord_2(x1, x2, y1, index, col)  ;  break;
      //case 16: koord_2(x1, x2, y1, index, col)  ;  break;
      //case 17: koord_2(x1, x2, y1, index, col)  ;  break;
      //case 18: koord_2(x1, x2, y1, index, col)  ;  break;
      //case 19: koord_2(x1, x2, y1, index, col)  ;  break;
      //case 20: koord_2(x1, x2, y1, index, col)  ;  break;
      
      default: koord_3(x1, x2, y1, index, col)  ;    
      }
   //--- ЛИНИЯ -----------
     if(index == 3){
           color clr = clrSilver ;
           if(col==0)  if( !( m_labelCreate(index, col * 2 , "----------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----"
           if(col==1)  if( !( m_labelCreate(index, col * 2 , "----------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----"
           if(col==2)  if( !( m_labelCreate(index, col * 2 , "----------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----"
           if(col==3)  if( !( m_labelCreate(index, col * 2 , "----------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----"   
           //if(col==4)  if( !( m_labelCreate(index, col * 2 , "----------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----"  
           //if(col==5)  if( !( m_labelCreate(index, col * 2 , "----------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----"
      }   
     else if(index == 6){
           color clr = clrSilver ;
           if(col==0)  if( !( m_labelCreate(index, col * 2 , "----------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----"
           if(col==1)  if( !( m_labelCreate(index, col * 2 , "----------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----"
           if(col==2)  if( !( m_labelCreate(index, col * 2 , "----------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----"
           if(col==3)  if( !( m_labelCreate(index, col * 2 , "----------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----" 
           //if(col==4)  if( !( m_labelCreate(index, col * 2 , "----------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----" 
           //if(col==5)  if( !( m_labelCreate(index, col * 2 , "----------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----" 
      }   
//     else if(index == 8){ 
//     
//            color clr = clrChocolate  ;
//           if(col==0)  if( !( m_labelCreate(index, col * 2 , "Параметры       -------"      , x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----"
//           if(col==1)  if( !( m_labelCreate(index, col * 2 , "----------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----"
//           if(col==2)  if( !( m_labelCreate(index, col * 2 , "----------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----"
//           if(col==3)  if( !( m_labelCreate(index, col * 2 , "----------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----" 
//           if(col==4)  if( !( m_labelCreate(index, col * 2 , "----------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----" 
//           if(col==5)  if( !( m_labelCreate(index, col * 2 , "----------------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----" 
//      
//      }
      else if(index == 8){ 
          
            color clr = clrChocolate  ;
           if(col==0)  if( !( m_labelCreate(index, col * 2 , "------------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----"
           if(col==1)  if( !( m_labelCreate(index, col * 2 , "------------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----"
           if(col==2)  if( !( m_labelCreate(index, col * 2 , "------------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----"
           if(col==3)  if( !( m_labelCreate(index, col * 2 , "----------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----" 
           //if(col==4)  if( !( m_labelCreate(index, col * 2 , "------------------------------", x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----" 
           //if(col==5)  if( !( m_labelCreate(index, col * 2 , "---------------------"         , x1, y1, x1 + 1, y1 + 1, clr) )  ) return(false);  // "-----" 
                     
      } else{
          if( !( m_labelCreate(index, col * 2, 
          //(string)index+"хххх" 
          ""
          , x1, y1, x1 + 1, y1 + 1) && m_labelCreate(index, col * 2 + 1 ,
          //(string)index+"zzz" 
          ""
          ,
          x2, y1, x1+1, y1+1 ))) return(false);  
      }  
       
   //--- succeed
      return(true);
     }
     
   
   bool CControlsDialog::SetStr(int index , int pos ,string text, color clr ) {
          //Print("=========================> index ", index);
          //Print("=========================> pos ", pos);
          //Print("=========================> text ", text);
          
          if( !m_label[index][pos].Text( text)  )
         return(false);
         if(  !m_label[index][pos].Color(clr) )
         return(false);      
         //if(  !Add(m_label[index][pos]) )
         //return(false);
         //--- succeed
      return(true);
   } 
   bool CControlsDialog::SetInfo(int index , int col, string strKey , string strValue, color clr , bool on  ) {   
     if(!on) return false;
      //Print("=========================----------------------> on ", on);   
      int  posKey   =  col * 2 ;
      int  posValue =  col * 2 + 1;   
      
      if( !SetStr( index , posKey , strKey, clr) )return(false);
      
      if(strValue == "true")  clr = clrLime;
      if(strValue == "false") clr = clrRed;
      if(strValue == "0")     clr = clrGold   ;  //---
      if(strKey   == "BuyTicket"    && strValue == "-1")   clr = clrGold ;  //---
      if(strKey   == "SellTicket"   && strValue == "-1")   clr = clrGold ; //---
            
      if( !SetStr( index , posValue , strValue, clr) ) return(false);
      //Print("strKey = " + strKey + " | strValue = " + strValue + " pos0 = " + index + "," + posKey  +  ": pos1 " + index + "," + posValue)  ;
      return(true);
   } 
   
   bool CControlsDialog::SetInfoIntoCol(int index , int col, string strKey , string strValue  ) {      
      int  posKey   =  col * 2 ; 
      if( !SetStr( index , posKey , strKey + "  " + strValue ) )return(false); 
      return(true);
   } 
   