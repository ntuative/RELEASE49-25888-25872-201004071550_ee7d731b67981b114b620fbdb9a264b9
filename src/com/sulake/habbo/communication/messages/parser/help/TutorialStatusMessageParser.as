package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TutorialStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1056:Boolean;
      
      private var var_1054:Boolean;
      
      private var var_1055:Boolean;
      
      public function TutorialStatusMessageParser()
      {
         super();
      }
      
      public function get hasCalledGuideBot() : Boolean
      {
         return var_1056;
      }
      
      public function get hasChangedName() : Boolean
      {
         return var_1054;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1055 = param1.readBoolean();
         var_1054 = param1.readBoolean();
         var_1056 = param1.readBoolean();
         return true;
      }
      
      public function get hasChangedLooks() : Boolean
      {
         return var_1055;
      }
      
      public function flush() : Boolean
      {
         var_1055 = false;
         var_1054 = false;
         var_1056 = false;
         return true;
      }
   }
}
