package com.sulake.habbo.communication.messages.incoming.recycler
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PrizeLevelMessageData
   {
       
      
      private var var_1897:int;
      
      private var var_1279:int;
      
      private var var_738:Array;
      
      public function PrizeLevelMessageData(param1:IMessageDataWrapper)
      {
         super();
         var_1279 = param1.readInteger();
         var_1897 = param1.readInteger();
         var_738 = new Array();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_738.push(new PrizeMessageData(param1));
            _loc3_++;
         }
      }
      
      public function get probabilityDenominator() : int
      {
         return var_1897;
      }
      
      public function get prizes() : Array
      {
         return var_738;
      }
      
      public function get prizeLevelId() : int
      {
         return var_1279;
      }
   }
}
