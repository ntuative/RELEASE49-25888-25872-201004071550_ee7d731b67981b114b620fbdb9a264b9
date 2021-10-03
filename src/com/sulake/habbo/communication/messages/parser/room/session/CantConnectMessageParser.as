package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1496:int = 2;
      
      public static const const_1308:int = 4;
      
      public static const const_1170:int = 1;
      
      public static const const_1288:int = 3;
       
      
      private var var_1011:int = 0;
      
      private var var_831:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return var_1011;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1011 = param1.readInteger();
         if(var_1011 == 3)
         {
            var_831 = param1.readString();
         }
         else
         {
            var_831 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_1011 = 0;
         var_831 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return var_831;
      }
   }
}
