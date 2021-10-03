package com.sulake.habbo.communication.messages.parser.marketplace
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class MarketplaceConfigurationParser implements IMessageParser
   {
       
      
      private var var_1802:int;
      
      private var var_1459:int;
      
      private var var_1803:int;
      
      private var var_1800:int;
      
      private var var_1799:int;
      
      private var var_1460:int;
      
      private var var_1801:int;
      
      private var var_1223:Boolean;
      
      public function MarketplaceConfigurationParser()
      {
         super();
      }
      
      public function get offerMaxPrice() : int
      {
         return var_1802;
      }
      
      public function get tokenBatchPrice() : int
      {
         return var_1459;
      }
      
      public function get averagePricePeriod() : int
      {
         return var_1801;
      }
      
      public function get offerMinPrice() : int
      {
         return var_1800;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get expirationHours() : int
      {
         return var_1799;
      }
      
      public function get tokenBatchSize() : int
      {
         return var_1460;
      }
      
      public function get commission() : int
      {
         return var_1803;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1223 = param1.readBoolean();
         var_1803 = param1.readInteger();
         var_1459 = param1.readInteger();
         var_1460 = param1.readInteger();
         var_1800 = param1.readInteger();
         var_1802 = param1.readInteger();
         var_1799 = param1.readInteger();
         var_1801 = param1.readInteger();
         return true;
      }
      
      public function get isEnabled() : Boolean
      {
         return var_1223;
      }
   }
}
