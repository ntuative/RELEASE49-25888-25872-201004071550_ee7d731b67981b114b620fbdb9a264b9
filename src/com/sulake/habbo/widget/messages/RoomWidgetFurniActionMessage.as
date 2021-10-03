package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_274:String = "RWFAM_MOVE";
      
      public static const const_504:String = "RWFUAM_ROTATE";
      
      public static const const_584:String = "RWFAM_PICKUP";
       
      
      private var var_1724:int = 0;
      
      private var var_1723:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_1724 = param2;
         var_1723 = param3;
      }
      
      public function get furniId() : int
      {
         return var_1724;
      }
      
      public function get furniCategory() : int
      {
         return var_1723;
      }
   }
}
