package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceItemStatsParser implements IMessageParser
   {
       
      
      private var var_1605:Array;
      
      private var var_1768:int;
      
      private var var_2106:int;
      
      private var var_2107:int;
      
      private var var_2104:int;
      
      private var _dayOffsets:Array;
      
      private var var_2105:int;
      
      private var var_1604:Array;
      
      public function MarketplaceItemStatsParser()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1605;
      }
      
      public function get furniTypeId() : int
      {
         return var_2106;
      }
      
      public function get historyLength() : int
      {
         return var_2104;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get furniCategoryId() : int
      {
         return var_2107;
      }
      
      public function get offerCount() : int
      {
         return var_2105;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1604;
      }
      
      public function get averagePrice() : int
      {
         return var_1768;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1768 = param1.readInteger();
         var_2105 = param1.readInteger();
         var_2104 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _dayOffsets = [];
         var_1605 = [];
         var_1604 = [];
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _dayOffsets.push(param1.readInteger());
            var_1605.push(param1.readInteger());
            var_1604.push(param1.readInteger());
            _loc3_++;
         }
         var_2107 = param1.readInteger();
         var_2106 = param1.readInteger();
         return true;
      }
   }
}
