package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_600:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_510:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_600);
         var_510 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return var_510;
      }
   }
}
