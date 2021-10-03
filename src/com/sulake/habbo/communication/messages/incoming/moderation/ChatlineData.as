package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ChatlineData
   {
       
      
      private var var_1447:String;
      
      private var var_2033:int;
      
      private var var_2032:int;
      
      private var var_2035:int;
      
      private var var_2034:String;
      
      public function ChatlineData(param1:IMessageDataWrapper)
      {
         super();
         var_2033 = param1.readInteger();
         var_2035 = param1.readInteger();
         var_2032 = param1.readInteger();
         var_2034 = param1.readString();
         var_1447 = param1.readString();
      }
      
      public function get msg() : String
      {
         return var_1447;
      }
      
      public function get hour() : int
      {
         return var_2033;
      }
      
      public function get minute() : int
      {
         return var_2035;
      }
      
      public function get chatterName() : String
      {
         return var_2034;
      }
      
      public function get chatterId() : int
      {
         return var_2032;
      }
   }
}
