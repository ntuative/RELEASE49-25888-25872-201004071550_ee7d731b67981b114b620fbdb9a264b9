package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1605:Array;
      
      private var var_1768:int;
      
      private var var_2106:int;
      
      private var var_2104:int;
      
      private var var_2107:int;
      
      private var _dayOffsets:Array;
      
      private var var_2105:int;
      
      private var var_1604:Array;
      
      public function MarketplaceItemStats()
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
      
      public function set averagePrices(param1:Array) : void
      {
         var_1605 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_2106;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1604 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1768 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_2104;
      }
      
      public function get furniCategoryId() : int
      {
         return var_2107;
      }
      
      public function get offerCount() : int
      {
         return var_2105;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_2105 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1604;
      }
      
      public function get averagePrice() : int
      {
         return var_1768;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_2107 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_2104 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_2106 = param1;
      }
   }
}
