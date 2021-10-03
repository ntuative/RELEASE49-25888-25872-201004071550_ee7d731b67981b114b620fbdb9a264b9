package com.sulake.habbo.catalog.viewer.widgets
{
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.IScrollbarWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.habbo.catalog.viewer.BundleProductContainer;
   import com.sulake.habbo.catalog.viewer.IGridItem;
   import com.sulake.habbo.catalog.viewer.IItemGrid;
   import com.sulake.habbo.catalog.viewer.Offer;
   import com.sulake.habbo.catalog.viewer.ProductContainer;
   import com.sulake.habbo.catalog.viewer.widgets.events.SelectProductEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class ItemGridCatalogWidget extends CatalogWidget implements ICatalogWidget, IItemGrid
   {
       
      
      private var var_912:int = 0;
      
      private var var_168:Timer;
      
      private var _scrollBar:IScrollbarWindow;
      
      protected var var_319:IGridItem;
      
      protected var var_128:Boolean = true;
      
      protected var var_951:IItemGridWindow;
      
      private var var_1575:int = 0;
      
      protected var var_1309:XML;
      
      public function ItemGridCatalogWidget(param1:IWindowContainer)
      {
         super(param1);
         _scrollBar = _window.findChildByName("itemGridScrollbar") as IScrollbarWindow;
         if(_scrollBar != null)
         {
            _scrollBar.visible = false;
            _scrollBar.addEventListener(WindowEvent.const_576,activateScrollbar);
            _scrollBar.addEventListener(WindowEvent.const_240,activateScrollbar);
            _scrollBar.addEventListener(WindowEvent.WINDOW_EVENT_DISABLE,deActivateScrollbar);
            _scrollBar.addEventListener(WindowEvent.const_219,deActivateScrollbar);
         }
      }
      
      override public function dispose() : void
      {
         if(var_168 != null)
         {
            var_168.stop();
            var_168.removeEventListener(TimerEvent.TIMER,populateItemGrid);
            var_168 = null;
         }
         var_951.destroyGridItems();
         var_951 = null;
         var_1309 = null;
         var_319 = null;
         super.dispose();
      }
      
      protected function populateItemGrid(param1:TimerEvent = null) : void
      {
         var _loc4_:* = null;
         var _loc2_:int = -1;
         if(param1 != null)
         {
            _loc2_ = param1.currentTarget.currentCount;
            if(var_912 == page.offers.length)
            {
               (param1.target as Timer).removeEventListener(TimerEvent.TIMER,populateItemGrid);
               (param1.target as Timer).stop();
            }
         }
         var _loc3_:int = 0;
         while(_loc3_ < 3)
         {
            if(var_912 >= 0 && var_912 < page.offers.length)
            {
               _loc4_ = page.offers[var_912];
               createGridItem(_loc4_);
               _loc4_.productContainer.grid = this;
            }
            ++var_912;
            _loc3_++;
         }
      }
      
      protected function createGridItem(param1:Offer) : void
      {
         var _loc2_:IWindowContainer = page.viewer.catalog.windowManager.buildFromXML(var_1309) as IWindowContainer;
         var_951.addGridItem(_loc2_);
         param1.productContainer.view = _loc2_;
         param1.productContainer.initProductIcon(page.viewer.roomEngine);
         if(param1.pricingModel == Offer.const_449)
         {
            ++var_1575;
            (param1.productContainer as BundleProductContainer).setBundleCounter(var_1575);
         }
      }
      
      override public function init() : void
      {
         var_951 = _window.findChildByName("itemGrid") as IItemGridWindow;
         var _loc1_:XmlAsset = page.viewer.catalog.assets.getAssetByName("gridItem") as XmlAsset;
         var_1309 = _loc1_.content as XML;
         populateItemGrid();
         if(var_128)
         {
            var_168 = new Timer(25);
            var_168.addEventListener(TimerEvent.TIMER,populateItemGrid);
            var_168.start();
         }
      }
      
      private function deActivateScrollbar(param1:WindowEvent) : void
      {
         (param1.target as IWindow).visible = false;
      }
      
      private function activateScrollbar(param1:WindowEvent) : void
      {
         (param1.target as IWindow).visible = true;
      }
      
      public function select(param1:IGridItem) : void
      {
         if(var_319 != null)
         {
            var_319.deActivate();
         }
         var_319 = param1;
         param1.activate();
         var _loc2_:Offer = (param1 as ProductContainer).offer;
         if(_loc2_ != null)
         {
            events.dispatchEvent(new SelectProductEvent(_loc2_));
         }
      }
   }
}
