#include  "..\setting\FilePathMain.mqh" 

bool chekServer(  )
  {
   //string path=InpDirectoryName+"//"+InpFileName;
   string      path     =  "mql5.txt"; 
   StrFileWrite(path,"1");
   int file_handle=-1;
//-- Создадим файл
ResetLastError(); 
   file_handle=FileOpen(path,FILE_WRITE|FILE_TXT); 
   if(file_handle!=INVALID_HANDLE) 
     { 
         FileWriteString(file_handle,"1");      
         datetime  dateStart=(datetime)FileGetInteger(path,FILE_CREATE_DATE,false);
         FileClose(file_handle);         
         FileDelete(path);  
         if ( dateStop < dateStart ) return false; 
         if ( dateStop > dateStart ) return true ; 
     }    
   else
      PrintFormat("%s file is not opened, ErrorCode = %d", file_handle, GetLastError());      
      return false;   
  }

bool StrFileWrite(string fileName, string str ){
  ResetLastError(); 
   int file_handle=FileOpen(fileName,FILE_WRITE|FILE_TXT); 
   if(file_handle!=INVALID_HANDLE) 
     {       
     FileWriteString(file_handle,str);   
      FileClose(file_handle); 
       return true; 
     } 
   else 
      Print("file is not opened, ErrorCode  = %d" + fileName + (string)GetLastError()); 
 return false; 
 } 
    