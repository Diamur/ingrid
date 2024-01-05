//////////////////////////////////////////////////////////////////////
//|                    С Т Р А Т Е Г И Я                        
//////////////////////////////////////////////////////////////////////
//+------------------------------------------------------------------+
//|                        ОТКРЫТИЕ                                                
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|     BUY 0      | ИСПОЛЬЗУЕТСЯ                                            
//+------------------------------------------------------------------+
//| 0 Торговля символо разрешена
//| 1 Время торговли разрешено
//| 2 Разрешено в пятницу
//| 3 Если кол-во BUY < countBUY
//| 4 Если новый бар  
//| 5 Если НЕ РЕВЕРС Стохастик пересекает  80 ВВЕРХ  при  ...при РЕВЕРСЕ пересекает 20 ВНИЗ
//+------------------------------------------------------------------+
//|    SELL 1      | ИСПОЛЬЗУЕТСЯ                                  
//+------------------------------------------------------------------+
//| 0 Торговля символо разрешена
//| 1 Время торговли разрешено
//| 2 Разрешено в пятницу
//| 3 Если кол-во SELL < countSELL
//| 4 Если новый бар  
//| 5 Если НЕ РЕВЕРС Стохастик пересекает  20 ВНИЗ  при  ...при РЕВЕРСЕ пересекает 80 ВВЕРХ
//+------------------------------------------------------------------+
//|    BUYSTOP 2   | НЕ ИСПОЛЬЗУЕТСЯ                                          
//+------------------------------------------------------------------+
//| 0 Торговля символо разрешена
//+------------------------------------------------------------------+
//|    SELLSTOP 3  | НЕ ИСПОЛЬЗУЕТСЯ                                             
//+------------------------------------------------------------------+
//| 0 Торговля символо разрешена
//+------------------------------------------------------------------+
//|    BUYLIMIT 4  | НЕ ИСПОЛЬЗУЕТСЯ                                             
//+------------------------------------------------------------------+
//| 0 Торговля символо разрешена
//+------------------------------------------------------------------+
//|    SELLLIMIT 5 | НЕ ИСПОЛЬЗУЕТСЯ                                               
//+------------------------------------------------------------------+
//| 0 Торговля символо разрешена
//+------------------------------------------------------------------+
//|                     МОДИФИКАЦИЯ                                                
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|     BUY 0      | ИСПОЛЬЗУЕТСЯ                                            
//+------------------------------------------------------------------+
//| 0 Если кол-во BUY > 0
//| 1 Если выполняется условия по Тралу
//+------------------------------------------------------------------+
//|    SELL 1      | ИСПОЛЬЗУЕТСЯ                                  
//+------------------------------------------------------------------+
//| 0 Если кол-во SELL > 0
//| 1 Если выполняется условия по Тралу
//+------------------------------------------------------------------+
//|    BUYSTOP 2   | НЕ ИСПОЛЬЗУЕТСЯ                                          
//+------------------------------------------------------------------+
//| 0 если выполняются условия по движении PRICE открытия
//| 1 если выполняются условия по движении STOPLOSS
//| 2 если выполняются условия по движении TAKEPROFIT
//+------------------------------------------------------------------+
//|    SELLSTOP 3  | НЕ ИСПОЛЬЗУЕТСЯ                                             
//+------------------------------------------------------------------+
//| 0 если выполняются условия по движении PRICE открытия
//| 1 если выполняются условия по движении STOPLOSS
//| 2 если выполняются условия по движении TAKEPROFIT
//+------------------------------------------------------------------+
//|    BUYLIMIT 4  | НЕ ИСПОЛЬЗУЕТСЯ                                             
//+------------------------------------------------------------------+
//| 0 если выполняются условия по движении PRICE открытия
//| 1 если выполняются условия по движении STOPLOSS
//| 2 если выполняются условия по движении TAKEPROFIT
//+------------------------------------------------------------------+
//|    SELLLIMIT 5 | НЕ ИСПОЛЬЗУЕТСЯ                                               
//+------------------------------------------------------------------+
//| 0 если выполняются условия по движении PRICE открытия
//| 1 если выполняются условия по движении STOPLOSS
//| 2 если выполняются условия по движении TAKEPROFIT
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                  ЗАКРЫТИЕ                                               
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|     BUY 0      | ИСПОЛЬЗУЕТСЯ                                            
//+------------------------------------------------------------------+
//| 0 Если Профит > заявленного
//+------------------------------------------------------------------+
//|    SELL 1      | ИСПОЛЬЗУЕТСЯ                                  
//+------------------------------------------------------------------+
//| 0 Если Профит > заявленного
//+------------------------------------------------------------------+
//|    BUYSTOP 2   | НЕ ИСПОЛЬЗУЕТСЯ                                          
//+------------------------------------------------------------------+
//| 0 Если Профит > заявленного
//+------------------------------------------------------------------+
//|    SELLSTOP 3  | НЕ ИСПОЛЬЗУЕТСЯ                                             
//+------------------------------------------------------------------+
//| 0 Если Профит > заявленного
//+------------------------------------------------------------------+
//|    BUYLIMIT 4  | НЕ ИСПОЛЬЗУЕТСЯ                                             
//+------------------------------------------------------------------+
//| 0 Если Профит > заявленного
//+------------------------------------------------------------------+
//|    SELLLIMIT 5 | НЕ ИСПОЛЬЗУЕТСЯ                                               
//+------------------------------------------------------------------+
//| 0 Если Профит > заявленного
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//|                     ОБЪЕМ                                               
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| 0 Торгуем с минимальным объемом                                                             
//+------------------------------------------------------------------+
