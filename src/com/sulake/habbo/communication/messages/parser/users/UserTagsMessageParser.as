package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserTagsMessageParser implements IMessageParser
   {
       
      
      protected var _userId:int = 0;
      
      protected var var_638:Array;
      
      public function UserTagsMessageParser()
      {
         var_638 = [];
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_638 = [];
         _userId = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_638.push(param1.readString());
            _loc3_++;
         }
         return true;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get tags() : Array
      {
         return var_638.slice();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
   }
}
