package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_1866:int;
      
      private var var_1286:PetData;
      
      private var var_2194:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return var_1866;
      }
      
      public function get petData() : PetData
      {
         return var_1286;
      }
      
      public function flush() : Boolean
      {
         var_1286 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return var_2194;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1866 = param1.readInteger();
         var_2194 = param1.readInteger();
         var_1286 = new PetData(param1);
         return true;
      }
   }
}
