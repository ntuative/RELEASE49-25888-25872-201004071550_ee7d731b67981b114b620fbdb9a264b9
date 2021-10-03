package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IButtonWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.catalog.HabboCatalog;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.SetExtraPurchaseParameterEvent;
   import com.sulake.habbo.catalog.viewer.widgets.events.WidgetEvent;
   
   public class PurchaseCatalogWidget extends CatalogWidget implements ICatalogWidget
   {
       
      
      private var var_1754:XML;
      
      private var var_1441:ITextWindow;
      
      private var var_1443:ITextWindow;
      
      private var var_1753:XML;
      
      private var var_799:IWindowContainer;
      
      private var var_2302:ITextWindow;
      
      private var var_1752:String = "";
      
      private var var_2375:IButtonWindow;
      
      private var var_1751:XML;
      
      private var var_1442:ITextWindow;
      
      private var var_1750:XML;
      
      private var var_800:IButtonWindow;
      
      private var var_77:Offer;
      
      public function PurchaseCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
      }
      
      private function attachStub(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case Offer.const_307:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1753) as IWindowContainer;
               break;
            case Offer.const_357:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1750) as IWindowContainer;
               break;
            case Offer.const_447:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1754) as IWindowContainer;
               break;
            case Offer.const_682:
               _loc2_ = page.viewer.catalog.windowManager.buildFromXML(var_1751) as IWindowContainer;
               break;
            default:
               Logger.log("Unknown price-type, can\'t attach...undefined");
         }
         if(_loc2_ != null)
         {
            if(var_799 != null)
            {
               _window.removeChild(var_799);
               var_799.dispose();
            }
            var_799 = _loc2_;
            _window.addChild(_loc2_);
            var_799.x = 0;
            var_799.y = 0;
         }
         var_1442 = _window.findChildByName("ctlg_price_credits") as ITextWindow;
         var_1443 = _window.findChildByName("ctlg_price_pixels") as ITextWindow;
         var_1441 = _window.findChildByName("ctlg_price_credits_pixels") as ITextWindow;
         var_2302 = _window.findChildByName("ctlg_special_txt") as ITextWindow;
         var_800 = window.findChildByName("ctlg_buy_button") as IButtonWindow;
         if(var_800 != null)
         {
            var_800.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onPurchase);
            var_800.disable();
         }
      }
      
      private function onPurchase(param1:WindowMouseEvent) : void
      {
         if(var_77 != null)
         {
            Logger.log("Init Purchase: undefined undefined");
            (page.viewer.catalog as HabboCatalog).showPurchaseConfirmation(var_77,page,var_1752);
         }
      }
      
      override public function init() : void
      {
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsStub") as XmlAsset;
         if(_loc1_ != null)
         {
            var_1753 = _loc1_.content as XML;
         }
         var _loc2_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetPixelsStub") as XmlAsset;
         if(_loc2_ != null)
         {
            var_1750 = _loc2_.content as XML;
         }
         var _loc3_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsPixelsStub") as XmlAsset;
         if(_loc3_ != null)
         {
            var_1754 = _loc3_.content as XML;
         }
         var _loc4_:XmlAsset = page.viewer.catalog.assets.getAssetByName("purchaseWidgetCreditsOrCreditsAndPixelsStub") as XmlAsset;
         if(_loc4_ != null)
         {
            var_1751 = _loc4_.content as XML;
         }
         events.addEventListener(WidgetEvent.CWE_SELECT_PRODUCT,onSelectProduct);
         events.addEventListener(WidgetEvent.const_1011,onSetParameter);
      }
      
      private function onSetParameter(param1:SetExtraPurchaseParameterEvent) : void
      {
         var_1752 = param1.parameter;
      }
      
      private function onSelectProduct(param1:SelectProductEvent) : void
      {
         var _loc2_:ICoreLocalizationManager = (page.viewer.catalog as HabboCatalog).localization;
         var_77 = param1.offer;
         attachStub(var_77.priceType);
         if(var_1442 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits","credits",String(var_77.priceInCredits));
            var_1442.caption = "${catalog.purchase.price.credits}";
         }
         if(var_1443 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.pixels","pixels",String(var_77.priceInPixels));
            var_1443.caption = "${catalog.purchase.price.pixels}";
         }
         if(var_1441 != null)
         {
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","credits",String(var_77.priceInCredits));
            _loc2_.registerParameter("catalog.purchase.price.credits+pixels","pixels",String(var_77.priceInPixels));
            var_1441.caption = "${catalog.purchase.price.credits+pixels}";
         }
         if(var_800 != null)
         {
            var_800.enable();
         }
      }
   }
}
