package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_308:String;
      
      private var var_1857:int;
      
      private var var_2043:String;
      
      private var var_1044:int;
      
      private var var_1241:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return var_1241;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1241 = param1.readInteger();
         var_2043 = param1.readString();
         var_1857 = param1.readInteger();
         var_308 = param1.readString();
         var_1044 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return var_2043;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return var_308;
      }
      
      public function get petType() : int
      {
         return var_1044;
      }
      
      public function get level() : int
      {
         return var_1857;
      }
   }
}
