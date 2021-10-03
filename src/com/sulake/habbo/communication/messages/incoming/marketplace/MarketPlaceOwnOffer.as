package com.sulake.habbo.communication.messages.incoming.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOwnOffer
   {
      
      public static const const_1451:int = 2;
      
      public static const const_1628:int = 1;
      
      public static const const_1621:int = 0;
       
      
      private var var_1164:int;
      
      private var var_375:int;
      
      private var var_2381:int;
      
      private var _offerId:int;
      
      private var var_1767:int;
      
      private var var_1724:int;
      
      private var _image:BitmapData;
      
      public function MarketPlaceOwnOffer(param1:int, param2:int, param3:int, param4:int)
      {
         super();
         _offerId = param1;
         var_1724 = param2;
         var_1767 = param3;
         var_1164 = param4;
      }
      
      public function get furniId() : int
      {
         return var_1724;
      }
      
      public function get furniType() : int
      {
         return var_1767;
      }
      
      public function get price() : int
      {
         return var_1164;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
   }
}
