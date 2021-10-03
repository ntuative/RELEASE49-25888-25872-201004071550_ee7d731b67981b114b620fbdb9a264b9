package com.sulake.habbo.widget.messages
{
   public class RoomWidgetRoomTagSearchMessage extends RoomWidgetMessage
   {
      
      public static const const_545:String = "RWRTSM_ROOM_TAG_SEARCH";
       
      
      private var var_1972:String = "";
      
      public function RoomWidgetRoomTagSearchMessage(param1:String)
      {
         super(const_545);
         var_1972 = param1;
      }
      
      public function get tag() : String
      {
         return var_1972;
      }
   }
}
