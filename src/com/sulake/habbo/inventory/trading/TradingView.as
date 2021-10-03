package com.sulake.habbo.inventory.trading
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemGridWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.inventory.IInventoryView;
   import com.sulake.habbo.inventory.ItemPopupCtrl;
   import com.sulake.habbo.inventory.enum.FurniCategory;
   import com.sulake.habbo.inventory.items.FloorItem;
   import com.sulake.habbo.inventory.items.GroupItem;
   import com.sulake.habbo.inventory.items.IItem;
   import com.sulake.habbo.inventory.items.WallItem;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.IGetImageListener;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.ImageResult;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class TradingView implements IInventoryView, IGetImageListener
   {
      
      public static const const_846:int = 1;
      
      public static const const_955:int = 2;
      
      private static const const_767:uint = 4284532064;
      
      private static const const_768:uint = 2577770;
      
      public static const const_968:int = 0;
       
      
      private var _disposed:Boolean = false;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_586:GroupItem;
      
      private var _roomEngine:IRoomEngine;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_2002:Boolean;
      
      private var var_61:IWindowContainer;
      
      private var var_357:Boolean;
      
      private var var_1509:IWindowContainer;
      
      private var var_168:Timer;
      
      private var var_351:ItemPopupCtrl;
      
      private var var_22:TradingModel;
      
      private var _localization:IHabboLocalizationManager;
      
      public function TradingView(param1:TradingModel, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IRoomEngine, param5:IHabboLocalizationManager)
      {
         super();
         var_22 = param1;
         _windowManager = param2;
         _localization = param5;
         _assetLibrary = param3;
         _roomEngine = param4;
         var_357 = false;
         var _loc6_:IAsset = _assetLibrary.getAssetByName("item_popup_xml");
         var _loc7_:XmlAsset = XmlAsset(_loc6_);
         var _loc8_:IWindowContainer = _windowManager.buildFromXML(_loc7_.content as XML) as IWindowContainer;
         _loc8_.visible = false;
         var_351 = new ItemPopupCtrl(_loc8_,_assetLibrary);
      }
      
      private function windowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "button_accept":
                  switch(var_22.state)
                  {
                     case TradingModel.const_161:
                        if(var_22.otherUserItems.length == 0 && true)
                        {
                           alertPopup(const_968);
                        }
                        if(false)
                        {
                           var_22.requestUnacceptTrading();
                        }
                        else
                        {
                           var_22.requestAcceptTrading();
                        }
                        break;
                     case TradingModel.const_238:
                        param2.disable();
                        var_22.requestConfirmAcceptTrading();
                  }
                  break;
               case "button_cancel":
                  switch(var_22.state)
                  {
                     case TradingModel.const_161:
                        var_22.requestCancelTrading();
                        break;
                     case TradingModel.const_238:
                        var_22.requestConfirmDeclineTrading();
                  }
            }
         }
      }
      
      private function ownThumbEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            var_22.requestRemoveItemFromTrading(param2.id);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            _loc3_ = var_22.ownUserItems.getWithIndex(param2.id);
            if(!_loc3_)
            {
               return;
            }
            _loc4_ = _loc3_.peek();
            _loc5_ = var_22.getItemImage(_loc4_);
            _loc6_ = "${roomItem.name." + _loc4_.type + "}";
            if(_loc4_.category == FurniCategory.const_158)
            {
               _loc6_ = "${poster_" + _loc4_.stuffData + "_name}";
            }
            if(_loc4_.category == FurniCategory.const_930)
            {
               _loc7_ = _loc4_ as FloorItem;
               _loc8_ = new Date(_loc7_.creationYear,_loc7_.creationMonth,_loc7_.creationDay);
               _loc6_ = _localization.getKey("roomItem.name." + _loc4_.type) + " " + _loc8_.toLocaleDateString();
            }
            var_351.updateContent(param2 as IWindowContainer,_loc6_,_loc5_,ItemPopupCtrl.const_436);
            var_351.show();
         }
         else if(param1.type == WindowMouseEvent.const_30)
         {
            var_351.hideDelayed();
         }
      }
      
      public function showOtherUserNotification(param1:String) : void
      {
         var _loc2_:ITextWindow = var_61.findChildByName("info_text_1") as ITextWindow;
         _loc2_.text = param1;
         _loc2_.visible = true;
         var _loc3_:IItemGridWindow = var_61.findChildByName("item_grid_1") as IItemGridWindow;
         if(_loc3_)
         {
            _loc3_.visible = false;
         }
      }
      
      public function imageReady(param1:int, param2:BitmapData) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:Boolean = false;
         _loc5_ = var_22.ownUserItems;
         _loc6_ = false;
         _loc3_ = 0;
         while(_loc3_ < _loc5_.length)
         {
            _loc4_ = _loc5_.getWithIndex(_loc3_) as GroupItem;
            if(_loc4_.iconCallbackId == param1)
            {
               _loc4_.iconImage = param2;
               _loc6_ = true;
            }
            _loc3_++;
         }
         if(_loc6_)
         {
            updateItemList(var_22.ownUserId);
         }
         _loc5_ = var_22.otherUserItems;
         _loc6_ = false;
         _loc3_ = 0;
         while(_loc3_ < _loc5_.length)
         {
            _loc4_ = _loc5_[_loc3_] as GroupItem;
            if(_loc4_.iconCallbackId == param1)
            {
               _loc4_.iconImage = param2;
               _loc6_ = true;
            }
            _loc3_++;
         }
         if(_loc6_)
         {
            updateItemList(var_22.otherUserId);
         }
      }
      
      protected function createThumbnailContainer() : IWindowContainer
      {
         var _loc1_:XML = XmlAsset(_assetLibrary.getAssetByName("inventory_thumb_xml")).content as XML;
         return _windowManager.buildFromXML(_loc1_) as IWindowContainer;
      }
      
      private function othersThumbEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            _loc3_ = var_22.otherUserItems.getWithIndex(param2.id);
            if(_loc3_ == null)
            {
               return;
            }
            _loc4_ = _loc3_.peek();
            if(_loc4_ == null)
            {
               return;
            }
            _loc5_ = var_22.getItemImage(_loc4_);
            _loc6_ = "${roomItem.name." + _loc4_.type + "}";
            if(_loc4_.category == FurniCategory.const_158)
            {
               _loc6_ = "${poster_" + _loc4_.stuffData + "_name}";
            }
            if(_loc4_.category == FurniCategory.const_930)
            {
               _loc7_ = _loc4_ as FloorItem;
               _loc8_ = new Date(_loc7_.creationYear,_loc7_.creationMonth,_loc7_.creationDay);
               _loc6_ = _localization.getKey("roomItem.name." + _loc4_.type) + " " + _loc8_.toLocaleDateString();
            }
            var_351.updateContent(param2 as IWindowContainer,_loc6_,_loc5_,ItemPopupCtrl.const_436);
            var_351.show();
         }
         else if(param1.type == WindowMouseEvent.const_30)
         {
            var_351.hideDelayed();
         }
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(var_61 && true)
            {
               var_61.dispose();
               var_61 = null;
            }
            if(var_168)
            {
               var_168.removeEventListener(TimerEvent.TIMER,timerEventHandler);
               var_168.stop();
               var_168 = null;
            }
            if(var_351 != null)
            {
               var_351.dispose();
               var_351 = null;
            }
            var_22 = null;
            _windowManager = null;
            _roomEngine = null;
            _localization = null;
            _assetLibrary = null;
            var_586 = null;
            var_357 = false;
            _disposed = true;
         }
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      protected function resolveItemThumbnail(param1:GroupItem) : BitmapData
      {
         var _loc3_:* = null;
         var _loc2_:BitmapData = param1.iconImage;
         if(_loc2_ == null)
         {
            if(param1.peek() is FloorItem)
            {
               _loc3_ = _roomEngine.getFurnitureIcon(param1.type,this);
            }
            else if(param1.peek() is WallItem)
            {
               _loc3_ = _roomEngine.getWallItemIcon(param1.type,this,param1.stuffData);
            }
            if(_loc3_.id > 0)
            {
               param1.iconCallbackId = _loc3_.id;
            }
            _loc2_ = _loc3_.data;
            param1.iconImage = _loc2_;
         }
         return _loc2_;
      }
      
      public function alertPopup(param1:int) : void
      {
         switch(param1)
         {
            case const_968:
               _windowManager.alert("${inventory.trading.notification.title}","${inventory.trading.warning.other_not_offering}",0,onTradingAlert);
               break;
            case const_846:
               _windowManager.alert("${inventory.trading.notification.title}","${inventory.trading.info.closed}",0,onTradingAlert);
               break;
            case const_955:
               _windowManager.alert("${inventory.trading.notification.title}","${inventory.trading.info.already_open}",0,onTradingAlert);
         }
      }
      
      protected function getOwnUsersItemGrid() : IItemGridWindow
      {
         return var_61.findChildByTag("OWN_USER_GRID") as IItemGridWindow;
      }
      
      private function timerEventHandler(param1:TimerEvent) : void
      {
         _windowManager.registerLocalizationParameter("inventory.trading.countdown","counter",String(3));
         if(false)
         {
            var_22.confirmCountdownReady();
            var_168.reset();
         }
      }
      
      public function updateItemList(param1:int) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc2_:int = 0;
         var _loc9_:* = param1 == var_22.otherUserId;
         var _loc10_:Map = !!_loc9_ ? var_22.otherUserItems : var_22.ownUserItems;
         var _loc11_:IItemGridWindow = !!_loc9_ ? getOtherUsersItemGrid() : getOwnUsersItemGrid();
         while(_loc2_ < _loc10_.length)
         {
            _loc3_ = _loc10_.getWithIndex(_loc2_) as GroupItem;
            _loc4_ = _loc11_.getGridItemAt(_loc2_) as IWindowContainer;
            if(_loc4_)
            {
               _loc4_.id = _loc2_;
               while(_loc4_.numChildren > 0)
               {
                  _loc4_.removeChildAt(0);
               }
               _loc4_.addChild(_loc3_.window);
               _loc3_.window.id = _loc2_;
            }
            _loc2_++;
         }
         while(_loc2_ < _loc11_.numGridItems)
         {
            _loc4_ = _loc11_.getGridItemAt(_loc2_) as IWindowContainer;
            if(_loc4_)
            {
               _loc4_.id = _loc2_;
               _loc4_.removeChildAt(0);
               _loc4_.invalidate();
            }
            _loc2_++;
         }
         updateActionState();
      }
      
      public function showOwnUserNotification(param1:String) : void
      {
         var _loc2_:ITextWindow = var_61.findChildByName("info_text_0") as ITextWindow;
         _loc2_.text = param1;
         _loc2_.visible = true;
         var _loc3_:IItemGridWindow = var_61.findChildByName("item_grid_0") as IItemGridWindow;
         if(_loc3_)
         {
            _loc3_.visible = false;
         }
      }
      
      public function onTradingAlert(param1:IAlertDialog, param2:WindowEvent) : void
      {
         if(param2.type == WindowEvent.const_163)
         {
            param1.dispose();
         }
      }
      
      public function setMinimized(param1:Boolean = false) : void
      {
         var_2002 = param1;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         if(var_61 == null)
         {
            var_61 = createNormalWindow();
         }
         if(var_1509 == null)
         {
            var_1509 = createMinimizedWindow();
         }
         if(!var_2002)
         {
            return var_61;
         }
         return var_1509;
      }
      
      public function showInfoMessage(param1:String) : void
      {
         var _loc2_:ITextWindow = var_61.findChildByName("help_text") as ITextWindow;
         _loc2_.text = param1;
         _loc2_.visible = true;
      }
      
      protected function selectOwnTradeItem(param1:uint) : void
      {
         var _loc2_:* = null;
         if(param1 < var_22.ownUserItems.length)
         {
            _loc2_ = var_22.ownUserItems.getWithIndex(param1) as GroupItem;
            setSelection(_loc2_);
            if(_loc2_)
            {
               var_22.getFurniInventoryModel().displayItemInfo(_loc2_);
            }
         }
      }
      
      public function setSelection(param1:GroupItem) : void
      {
         removeSelection();
         if(param1)
         {
            var_586 = param1;
            var_586.isSelected = true;
         }
      }
      
      private function createNormalWindow() : IWindowContainer
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc6_:int = 0;
         var _loc1_:XML = XmlAsset(_assetLibrary.getAssetByName("inventory_trading_xml")).content as XML;
         var _loc2_:IWindowContainer = _windowManager.buildFromXML(_loc1_) as IWindowContainer;
         _loc3_ = _loc2_.findChildByTag("OWN_USER_GRID") as IItemGridWindow;
         _loc6_ = 0;
         while(_loc6_ < _loc3_.numGridItems)
         {
            _loc4_ = _loc3_.getGridItemAt(_loc6_);
            _loc4_.id = _loc6_;
            _loc4_.procedure = ownThumbEventProc;
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,ownThumbEventProc);
            _loc4_.addEventListener(WindowMouseEvent.const_30,ownThumbEventProc);
            _loc6_++;
         }
         _loc3_ = _loc2_.findChildByTag("OTHER_USER_GRID") as IItemGridWindow;
         _loc6_ = 0;
         while(_loc6_ < _loc3_.numGridItems)
         {
            _loc4_ = _loc3_.getGridItemAt(_loc6_);
            _loc4_.id = _loc6_;
            _loc4_.procedure = othersThumbEventProc;
            _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,othersThumbEventProc);
            _loc4_.addEventListener(WindowMouseEvent.const_30,othersThumbEventProc);
            _loc6_++;
         }
         _loc2_.procedure = windowEventProc;
         return _loc2_;
      }
      
      public function updateItemImage(param1:int, param2:BitmapData) : void
      {
      }
      
      protected function selectOthersTradeItem(param1:uint) : void
      {
         var _loc2_:* = null;
         if(param1 < var_22.otherUserItems.length)
         {
            _loc2_ = var_22.otherUserItems.getWithIndex(param1) as GroupItem;
            setSelection(_loc2_);
            if(_loc2_)
            {
               var_22.getFurniInventoryModel().displayItemInfo(_loc2_);
            }
         }
      }
      
      private function windowMininizedEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            switch(param2.name)
            {
               case "button_continue":
                  var_22.requestFurniViewOpen();
                  break;
               case "button_cancel":
                  var_22.requestCancelTrading();
            }
         }
      }
      
      public function hideOwnUserNotification() : void
      {
         var _loc1_:ITextWindow = var_61.findChildByName("info_text_0") as ITextWindow;
         _loc1_.visible = false;
         var _loc2_:IItemGridWindow = var_61.findChildByName("item_grid_0") as IItemGridWindow;
         if(_loc2_)
         {
            _loc2_.visible = true;
         }
      }
      
      public function startConfirmCountdown() : void
      {
         if(var_168 == null)
         {
            var_168 = new Timer(1000,3);
            var_168.addEventListener(TimerEvent.TIMER,timerEventHandler);
         }
         var_168.reset();
         var_168.repeatCount = 3;
         var_168.start();
         _windowManager.registerLocalizationParameter("inventory.trading.countdown","counter","3");
         updateUserInterface();
      }
      
      public function hideOtherUserNotification() : void
      {
         var _loc1_:ITextWindow = var_61.findChildByName("info_text_1") as ITextWindow;
         _loc1_.visible = false;
         var _loc2_:IItemGridWindow = var_61.findChildByName("item_grid_1") as IItemGridWindow;
         if(_loc2_)
         {
            _loc2_.visible = true;
         }
      }
      
      public function updateUserInterface() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(var_61)
         {
            updateActionState();
            _loc2_ = var_61.findChildByTag("OTHER_USER_NAME") as ITextWindow;
            if(_loc2_)
            {
               _loc2_.text = var_22.otherUserName;
            }
            _loc1_ = var_61.findChildByTag("OWN_USER_BORDER");
            if(_loc1_)
            {
               _loc1_.color = !true ? uint(const_767) : uint(const_768);
            }
            _loc3_ = var_61.findChildByTag("OWN_USER_LOCK") as IBitmapWrapperWindow;
            if(_loc3_)
            {
               if(_loc3_.bitmap == null)
               {
                  _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true);
               }
               _loc3_.bitmap.fillRect(_loc3_.bitmap.rect,16777215);
               _loc3_.bitmap.copyPixels(_assetLibrary.getAssetByName(!true ? "trading_locked_icon_png" : "trading_unlocked_icon_png").content as BitmapData,_loc3_.bitmap.rect,new Point());
               _loc3_.invalidate();
            }
            _loc1_ = var_61.findChildByTag("OTHER_USER_BORDER");
            if(_loc1_)
            {
               _loc1_.color = !true ? uint(const_767) : uint(const_768);
            }
            _loc3_ = var_61.findChildByTag("OTHER_USER_LOCK") as IBitmapWrapperWindow;
            if(_loc3_)
            {
               if(_loc3_.bitmap == null)
               {
                  _loc3_.bitmap = new BitmapData(_loc3_.width,_loc3_.height,true);
               }
               _loc3_.bitmap.fillRect(_loc3_.bitmap.rect,16777215);
               _loc3_.bitmap.copyPixels(_assetLibrary.getAssetByName(!true ? "trading_locked_icon_png" : "trading_unlocked_icon_png").content as BitmapData,_loc3_.bitmap.rect,new Point());
               _loc3_.invalidate();
            }
         }
      }
      
      public function removeSelection() : void
      {
         if(var_586)
         {
            var_586.isSelected = false;
            var_586 = null;
         }
      }
      
      public function showAlertNotification(param1:String, param2:String, param3:Function) : void
      {
         var title:String = param1;
         var description:String = param2;
         var callback:Function = param3;
         _windowManager.alert(title,description,0,callback != null ? callback : function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      public function cancelConfirmCountdown() : void
      {
         if(var_168 != null)
         {
            var_168.reset();
         }
      }
      
      protected function getOtherUsersItemGrid() : IItemGridWindow
      {
         return var_61.findChildByTag("OTHER_USER_GRID") as IItemGridWindow;
      }
      
      public function get visible() : Boolean
      {
         return var_357;
      }
      
      public function clearItemLists() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         _loc1_ = getOwnUsersItemGrid();
         _loc3_ = 0;
         while(_loc3_ < _loc1_.numGridItems)
         {
            _loc2_ = _loc1_.getGridItemAt(_loc3_) as IWindowContainer;
            if(_loc2_)
            {
               _loc2_.id = _loc3_;
               _loc2_.removeChildAt(0);
            }
            _loc3_++;
         }
         _loc1_ = getOtherUsersItemGrid();
         _loc3_ = 0;
         while(_loc3_ < _loc1_.numGridItems)
         {
            _loc2_ = _loc1_.getGridItemAt(_loc3_) as IWindowContainer;
            if(_loc2_)
            {
               _loc2_.id = _loc3_;
               _loc2_.removeChildAt(0);
            }
            _loc3_++;
         }
      }
      
      public function updateActionState() : void
      {
         var _loc1_:* = null;
         if(var_61)
         {
            _loc1_ = var_61.findChildByName("button_accept");
            if(!_loc1_)
            {
               return;
            }
            switch(var_22.state)
            {
               case TradingModel.const_150:
                  if(var_22.otherUserItems.length > 0 || var_22.ownUserItems.length > 0)
                  {
                     _loc1_.enable();
                  }
                  else
                  {
                     _loc1_.disable();
                  }
                  _loc1_.caption = "${inventory.trading.accept}";
                  break;
               case TradingModel.const_161:
                  if(var_22.otherUserItems.length > 0 || var_22.ownUserItems.length > 0)
                  {
                     _loc1_.enable();
                  }
                  else
                  {
                     _loc1_.disable();
                  }
                  _loc1_.caption = !true ? "${inventory.trading.modify}" : "${inventory.trading.accept}";
                  showInfoMessage("${inventory.trading.info.add}");
                  break;
               case TradingModel.const_329:
                  _loc1_.disable();
                  _loc1_.caption = "${inventory.trading.countdown}";
                  showInfoMessage("${inventory.trading.info.confirm}");
                  break;
               case TradingModel.const_238:
                  _loc1_.enable();
                  _loc1_.caption = "${inventory.trading.confirm}";
                  showInfoMessage("${inventory.trading.info.confirm}");
                  break;
               case TradingModel.const_369:
                  _loc1_.disable();
                  showInfoMessage("${inventory.trading.info.waiting}");
                  break;
               case TradingModel.const_199:
                  _loc1_.disable();
                  _loc1_.caption = "${inventory.trading.accept}";
                  showInfoMessage("${inventory.trading.info.confirm}");
                  break;
               case TradingModel.TRADING_STATE_CANCELLED:
                  break;
               default:
                  throw new Error("Unknown trading progress state: \"undefined\"");
            }
         }
      }
      
      private function createMinimizedWindow() : IWindowContainer
      {
         var _loc1_:XML = XmlAsset(_assetLibrary.getAssetByName("inventory_trading_minimized_xml")).content as XML;
         var _loc2_:IWindowContainer = _windowManager.buildFromXML(_loc1_) as IWindowContainer;
         _loc2_.procedure = windowMininizedEventProc;
         return _loc2_;
      }
      
      public function setup(param1:int, param2:Boolean, param3:int, param4:Boolean) : void
      {
         setMinimized(false);
         hideOwnUserNotification();
         hideOtherUserNotification();
         if(!param2 && !param4)
         {
            showInfoMessage("${inventory.trading.warning.both_accounts_disabled}");
            showOwnUserNotification("");
            showOtherUserNotification("");
         }
         else
         {
            if(!param2)
            {
               showOwnUserNotification("${inventory.trading.warning.own_account_disabled}");
            }
            if(!param4)
            {
               showOtherUserNotification("${inventory.trading.warning.others_account_disabled}");
            }
         }
      }
   }
}
