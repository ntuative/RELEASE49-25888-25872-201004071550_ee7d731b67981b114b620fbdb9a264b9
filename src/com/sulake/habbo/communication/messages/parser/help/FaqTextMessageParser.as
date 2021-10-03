package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FaqTextMessageParser implements IMessageParser
   {
       
      
      private var var_1349:int;
      
      private var var_1348:String;
      
      public function FaqTextMessageParser()
      {
         super();
      }
      
      public function get questionId() : int
      {
         return var_1349;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1349 = param1.readInteger();
         var_1348 = param1.readString();
         return true;
      }
      
      public function get answerText() : String
      {
         return var_1348;
      }
      
      public function flush() : Boolean
      {
         var_1349 = -1;
         var_1348 = null;
         return true;
      }
   }
}
