package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData
   {
       
      
      private var var_1766:int;
      
      private var var_1164:int;
      
      private var var_1768:int;
      
      private var var_1769:int = -1;
      
      private var var_375:int;
      
      private var var_1767:int;
      
      private var _image:BitmapData;
      
      private var _offerId:int;
      
      private var var_1163:int;
      
      private var var_1724:int;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int = -1)
      {
         super();
         _offerId = param1;
         var_1724 = param2;
         var_1767 = param3;
         var_1164 = param4;
         var_375 = param5;
         var_1768 = param6;
         var_1163 = param7;
      }
      
      public function set imageCallback(param1:int) : void
      {
         var_1766 = param1;
      }
      
      public function get imageCallback() : int
      {
         return var_1766;
      }
      
      public function get price() : int
      {
         return var_1164;
      }
      
      public function get timeLeftMinutes() : int
      {
         return var_1769;
      }
      
      public function get offerCount() : int
      {
         return var_1163;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get furniType() : int
      {
         return var_1767;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         var_1769 = param1;
      }
      
      public function dispose() : void
      {
         if(_image)
         {
            _image.dispose();
            _image = null;
         }
      }
      
      public function set price(param1:int) : void
      {
         var_1164 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_1163 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get status() : int
      {
         return var_375;
      }
      
      public function get averagePrice() : int
      {
         return var_1768;
      }
      
      public function set offerId(param1:int) : void
      {
         _offerId = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(_image != null)
         {
            _image.dispose();
         }
         _image = param1;
      }
      
      public function get furniId() : int
      {
         return var_1724;
      }
   }
}
