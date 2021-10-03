package com.sulake.habbo.inventory
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ItemPopupCtrl
   {
      
      private static const const_1107:int = 100;
      
      private static const const_1108:int = 200;
      
      private static const const_1105:int = 180;
      
      public static const const_859:int = 1;
      
      public static const const_436:int = 2;
      
      private static const const_1106:int = 250;
      
      private static const const_777:int = 5;
       
      
      private var var_602:BitmapData;
      
      private var var_315:Timer;
      
      private var var_8:IWindowContainer;
      
      private var var_729:BitmapData;
      
      private var var_316:Timer;
      
      private var var_70:IWindowContainer;
      
      private var var_1546:int = 2;
      
      private var _assets:IAssetLibrary;
      
      public function ItemPopupCtrl(param1:IWindowContainer, param2:IAssetLibrary)
      {
         var_316 = new Timer(const_1106,1);
         var_315 = new Timer(const_1107,1);
         super();
         if(param1 == null)
         {
            return;
         }
         if(param2 == null)
         {
            return;
         }
         var_70 = param1;
         var_70.visible = false;
         _assets = param2;
         var_316.addEventListener(TimerEvent.TIMER,onDisplayTimer);
         var_315.addEventListener(TimerEvent.TIMER,onHideTimer);
         var _loc3_:BitmapDataAsset = _assets.getAssetByName("popup_arrow_right_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_729 = _loc3_.content as BitmapData;
         }
         _loc3_ = _assets.getAssetByName("popup_arrow_left_png") as BitmapDataAsset;
         if(_loc3_ != null && _loc3_.content != null)
         {
            var_602 = _loc3_.content as BitmapData;
         }
      }
      
      public function hide() : void
      {
         var_70.visible = false;
         var_315.reset();
         var_316.reset();
         if(var_8 != null)
         {
            var_8.removeChild(var_70);
         }
      }
      
      public function hideDelayed() : void
      {
         var_315.reset();
         var_316.reset();
         var_315.start();
      }
      
      private function onHideTimer(param1:TimerEvent) : void
      {
         hide();
      }
      
      public function dispose() : void
      {
         if(var_316 != null)
         {
            var_316.removeEventListener(TimerEvent.TIMER,onDisplayTimer);
            var_316.stop();
            var_316 = null;
         }
         if(var_315 != null)
         {
            var_315.removeEventListener(TimerEvent.TIMER,onHideTimer);
            var_315.stop();
            var_315 = null;
         }
         _assets = null;
         var_70 = null;
         var_8 = null;
         var_602 = null;
         var_729 = null;
      }
      
      public function showDelayed() : void
      {
         var_315.reset();
         var_316.reset();
         var_316.start();
      }
      
      private function onDisplayTimer(param1:TimerEvent) : void
      {
         show();
      }
      
      public function updateContent(param1:IWindowContainer, param2:String, param3:BitmapData, param4:int = 2) : void
      {
         var _loc7_:* = null;
         if(var_70 == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(param3 == null)
         {
            param3 = new BitmapData(1,1,true,16777215);
         }
         if(var_8 != null)
         {
            var_8.removeChild(var_70);
         }
         var_8 = param1;
         var_1546 = param4;
         var _loc5_:ITextWindow = ITextWindow(var_70.findChildByName("item_name_text"));
         if(_loc5_)
         {
            _loc5_.text = param2;
         }
         var _loc6_:IBitmapWrapperWindow = var_70.findChildByName("item_image") as IBitmapWrapperWindow;
         if(_loc6_)
         {
            _loc7_ = new BitmapData(Math.min(const_1105,param3.width),Math.min(const_1108,param3.height),true,16777215);
            _loc7_.copyPixels(param3,new Rectangle(0,0,_loc7_.width,_loc7_.height),new Point(0,0),null,null,true);
            _loc6_.bitmap = _loc7_;
            _loc6_.width = _loc6_.bitmap.width;
            _loc6_.height = _loc6_.bitmap.height;
            _loc6_.x = (0 - _loc6_.width) / 2;
            var_70.height = _loc6_.rectangle.bottom + 10;
         }
      }
      
      private function refreshArrow(param1:int = 2) : void
      {
         if(var_70 == null || false)
         {
            return;
         }
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(var_70.findChildByName("arrow_pointer"));
         if(!_loc2_)
         {
            return;
         }
         switch(param1)
         {
            case const_859:
               _loc2_.bitmap = var_729.clone();
               _loc2_.width = var_729.width;
               _loc2_.height = var_729.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = -1;
               break;
            case const_436:
               _loc2_.bitmap = var_602.clone();
               _loc2_.width = var_602.width;
               _loc2_.height = var_602.height;
               _loc2_.y = (0 - 0) / 2;
               _loc2_.x = 1;
         }
         _loc2_.invalidate();
      }
      
      public function show() : void
      {
         var_315.reset();
         var_316.reset();
         if(var_8 == null)
         {
            return;
         }
         var_70.visible = true;
         var_8.addChild(var_70);
         refreshArrow(var_1546);
         switch(var_1546)
         {
            case const_859:
               var_70.x = 0 - const_777;
               break;
            case const_436:
               var_70.x = var_8.width + const_777;
         }
         var_70.y = (0 - 0) / 2;
      }
   }
}
