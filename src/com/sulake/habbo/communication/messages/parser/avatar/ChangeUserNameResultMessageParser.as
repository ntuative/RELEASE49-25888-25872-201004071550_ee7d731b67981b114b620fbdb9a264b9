package com.sulake.habbo.communication.messages.parser.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ChangeUserNameResultMessageParser implements IMessageParser
   {
       
      
      private var var_958:Array;
      
      private var var_1129:int = -1;
      
      private var _name:String;
      
      public function ChangeUserNameResultMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1129 = param1.readInteger();
         _name = param1.readString();
         var _loc2_:int = param1.readInteger();
         var_958 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_958.push(param1.readString());
            _loc3_++;
         }
         return true;
      }
      
      public function get nameSuggestions() : Array
      {
         return var_958;
      }
      
      public function flush() : Boolean
      {
         var_1129 = -1;
         _name = "";
         var_958 = null;
         return true;
      }
      
      public function get resultCode() : int
      {
         return var_1129;
      }
      
      public function get name() : String
      {
         return _name;
      }
   }
}