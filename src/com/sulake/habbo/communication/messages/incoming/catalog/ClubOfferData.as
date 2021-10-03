package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_1694:int;
      
      private var var_1164:int;
      
      private var var_1687:int;
      
      private var _offerId:int;
      
      private var var_1691:int;
      
      private var var_1689:int;
      
      private var var_1692:Boolean;
      
      private var var_1688:int;
      
      private var var_1690:Boolean;
      
      private var var_1256:String;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         _offerId = param1.readInteger();
         var_1256 = param1.readString();
         var_1164 = param1.readInteger();
         var_1690 = param1.readBoolean();
         var_1692 = param1.readBoolean();
         var_1687 = param1.readInteger();
         var_1688 = param1.readInteger();
         var_1691 = param1.readInteger();
         var_1694 = param1.readInteger();
         var_1689 = param1.readInteger();
      }
      
      public function get year() : int
      {
         return var_1691;
      }
      
      public function get month() : int
      {
         return var_1694;
      }
      
      public function get price() : int
      {
         return var_1164;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get periods() : int
      {
         return var_1687;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return var_1688;
      }
      
      public function get upgrade() : Boolean
      {
         return var_1690;
      }
      
      public function get day() : int
      {
         return var_1689;
      }
      
      public function get vip() : Boolean
      {
         return var_1692;
      }
      
      public function get productCode() : String
      {
         return var_1256;
      }
   }
}
