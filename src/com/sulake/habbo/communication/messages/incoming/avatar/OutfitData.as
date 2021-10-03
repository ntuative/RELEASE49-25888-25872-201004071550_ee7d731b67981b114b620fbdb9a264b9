package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class OutfitData
   {
       
      
      private var var_2198:String;
      
      private var var_693:String;
      
      private var var_1499:int;
      
      public function OutfitData(param1:IMessageDataWrapper)
      {
         super();
         var_1499 = param1.readInteger();
         var_2198 = param1.readString();
         var_693 = param1.readString();
      }
      
      public function get gender() : String
      {
         return var_693;
      }
      
      public function get figureString() : String
      {
         return var_2198;
      }
      
      public function get slotId() : int
      {
         return var_1499;
      }
   }
}
