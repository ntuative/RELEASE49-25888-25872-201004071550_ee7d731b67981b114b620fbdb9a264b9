package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_870:String = "price_type_none";
      
      public static const const_473:String = "pricing_model_multi";
      
      public static const const_307:String = "price_type_credits";
      
      public static const const_447:String = "price_type_credits_and_pixels";
      
      public static const const_449:String = "pricing_model_bundle";
      
      public static const const_478:String = "pricing_model_single";
      
      public static const const_682:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1276:String = "pricing_model_unknown";
      
      public static const const_357:String = "price_type_pixels";
       
      
      private var var_1868:int;
      
      private var var_827:int;
      
      private var _offerId:int;
      
      private var var_826:int;
      
      private var var_402:String;
      
      private var var_569:String;
      
      private var var_387:ICatalogPage;
      
      private var var_401:IProductContainer;
      
      private var var_1200:String;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         _offerId = param1.offerId;
         var_1200 = param1.localizationId;
         var_827 = param1.priceInCredits;
         var_826 = param1.priceInPixels;
         var_387 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         analyzePricingModel(_loc3_);
         analyzePriceType();
         createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return var_402;
      }
      
      public function get page() : ICatalogPage
      {
         return var_387;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         var_1868 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return var_401;
      }
      
      public function get offerId() : int
      {
         return _offerId;
      }
      
      public function get priceInPixels() : int
      {
         return var_826;
      }
      
      public function dispose() : void
      {
         _offerId = 0;
         var_1200 = "";
         var_827 = 0;
         var_826 = 0;
         var_387 = null;
         if(var_401 != null)
         {
            var_401.dispose();
            var_401 = null;
         }
      }
      
      public function get previewCallbackId() : int
      {
         return var_1868;
      }
      
      public function get priceInCredits() : int
      {
         return var_827;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               var_402 = const_478;
            }
            else
            {
               var_402 = const_473;
            }
         }
         else if(param1.length > 1)
         {
            var_402 = const_449;
         }
         else
         {
            var_402 = const_1276;
         }
      }
      
      public function get priceType() : String
      {
         return var_569;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(var_402)
         {
            case const_478:
               var_401 = new SingleProductContainer(this,param1);
               break;
            case const_473:
               var_401 = new MultiProductContainer(this,param1);
               break;
            case const_449:
               var_401 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + var_402);
         }
      }
      
      public function get localizationId() : String
      {
         return var_1200;
      }
      
      private function analyzePriceType() : void
      {
         if(var_827 > 0 && var_826 > 0)
         {
            var_569 = const_447;
         }
         else if(var_827 > 0)
         {
            var_569 = const_307;
         }
         else if(var_826 > 0)
         {
            var_569 = const_357;
         }
         else
         {
            var_569 = const_870;
         }
      }
   }
}
