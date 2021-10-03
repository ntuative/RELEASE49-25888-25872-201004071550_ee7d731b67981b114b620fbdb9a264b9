package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCreatedMessageParser implements IMessageParser
   {
       
      
      private var var_1736:String;
      
      private var var_411:int;
      
      public function FlatCreatedMessageParser()
      {
         super();
      }
      
      public function get flatName() : String
      {
         return var_1736;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_411 = param1.readInteger();
         this.var_1736 = param1.readString();
         Logger.log("FLAT CREATED: " + this.var_411 + ", " + this.var_1736);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get flatId() : int
      {
         return var_411;
      }
   }
}
