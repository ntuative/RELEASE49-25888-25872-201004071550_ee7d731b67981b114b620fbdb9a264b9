package com.sulake.habbo.widget.roomchat
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetChatSelectAvatarMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class RoomChatWidget extends RoomWidgetBase implements IUpdateReceiver
   {
      
      private static const const_772:int = 10;
      
      private static const const_490:int = 25;
      
      private static const const_1092:int = 6000;
      
      private static const const_1094:int = 9;
      
      private static const const_771:int = 4000;
      
      private static const const_1091:int = 3;
      
      private static const const_99:int = 18;
      
      private static const const_1047:int = 25;
      
      private static const const_1093:int = 1;
      
      private static const const_278:int = 9;
      
      private static const const_488:int = 8;
      
      private static const const_350:int = 0;
      
      private static const const_489:int = (const_488 + const_350) * const_99 + const_99;
       
      
      private var var_868:Number = 1;
      
      private var _disposed:Boolean = false;
      
      private var var_595:int = 18;
      
      private var var_356:IItemListWindow;
      
      private var var_714:int = 0;
      
      private var var_37:IWindowContainer;
      
      private var var_417:Boolean = false;
      
      private var var_150:int;
      
      private var var_2078:int = 0;
      
      private var var_1284:Boolean = false;
      
      private var var_131:IWindowContainer;
      
      private var _itemList:Array;
      
      private var var_25:RoomChatHistoryViewer;
      
      private var var_2079:int = 150;
      
      private var var_512:Number = 1;
      
      private var var_64:Array;
      
      private var var_224:Array;
      
      private var var_716:int = 0;
      
      private var var_2080:int;
      
      private var var_715:Point;
      
      private var var_1528:Number = 0;
      
      private var var_21:Component = null;
      
      public function RoomChatWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager, param5:int, param6:Component)
      {
         _itemList = new Array();
         var_64 = new Array();
         var_224 = new Array();
         var_715 = new Point();
         var_150 = const_489 + const_278;
         super(param1,param2,param3);
         var_2080 = param5;
         var_37 = param1.createWindow("chat_container","",HabboWindowType.const_59,HabboWindowStyle.const_40,HabboWindowParam.const_39,new Rectangle(0,0,200,var_150 + RoomChatHistoryPulldown.const_73),null,0) as IWindowContainer;
         var_37.background = true;
         var_37.color = 33554431;
         var_37.tags.push("room_widget_chat");
         var_356 = param1.createWindow("chat_contentlist","",HabboWindowType.const_936,HabboWindowStyle.const_39,0 | 0,new Rectangle(0,0,200,var_150),null,0) as IItemListWindow;
         var_37.addChild(var_356);
         var_131 = param1.createWindow("chat_active_content","",HabboWindowType.const_59,HabboWindowStyle.const_39,HabboWindowParam.const_69,new Rectangle(0,0,200,var_150),null,0) as IWindowContainer;
         var_356.addListItem(var_131);
         var_25 = new RoomChatHistoryViewer(this,param1,var_37,param2);
         var_2079 = int(param4.getKey("chat.history.item.max.count","150"));
         var _loc7_:Boolean = int(param4.getKey("chat.history.disabled","0")) == 1 ? true : false;
         if(var_25 != null)
         {
            var_25.disabled = _loc7_;
         }
         if(param6 != null)
         {
            var_21 = param6;
            var_21.registerUpdateReceiver(this,1);
         }
      }
      
      public function onPulldownCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(var_25 != null)
         {
            var_25.hideHistoryViewer();
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetChatUpdateEvent.const_506,onChatMessage);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_239,onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_529,onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_561,onRoomViewUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function get mainWindow() : IWindow
      {
         return var_37;
      }
      
      public function onItemMouseOver(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      public function resetArea() : void
      {
         if(var_25 == null)
         {
            return;
         }
         animationStop();
         var_150 = const_489 + const_278;
         var_37.height = var_150 + var_25.pulldownBarHeight;
         var_356.width = 0 - 0;
         var_356.height = var_150;
         var_131.width = 0 - 0;
         if(historyViewerActive())
         {
            var_131.height = getTotalContentHeight() + const_278;
         }
         else
         {
            var_131.height = var_150;
         }
         var_356.scrollV = 1;
         if(!historyViewerActive())
         {
            var_25.containerResized(var_37.rectangle);
         }
         purgeItems();
         alignItems();
      }
      
      public function resizeContainerToLowestItem() : void
      {
         var _loc4_:* = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc4_ = _itemList[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_64.length)
         {
            _loc4_ = var_64[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc1_ += const_490;
         _loc1_ = _loc1_ < 0 ? 0 : int(_loc1_);
         var _loc3_:int = var_37.rectangle.bottom;
         stretchAreaBottomTo(var_37.rectangle.top + _loc1_);
         _loc3_ -= var_37.rectangle.bottom;
         if(Math.abs(_loc3_) < RoomChatHistoryViewer.const_1026)
         {
            resetArea();
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc4_ = _itemList[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_64.length)
         {
            _loc4_ = var_64[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         var_1284 = true;
      }
      
      private function processBuffer() : void
      {
         if(var_417)
         {
            return;
         }
         if(false)
         {
            return;
         }
         while(var_64.length > const_1093 || historyViewerActive() && false)
         {
            activateItemFromBuffer();
         }
         var _loc1_:Boolean = false;
         if(false)
         {
            _loc1_ = true;
         }
         else
         {
            _loc1_ = checkLastItemAllowsAdding(var_64[0]);
         }
         if(_loc1_)
         {
            activateItemFromBuffer();
            var_714 = getTimer() + const_771;
         }
         else
         {
            if(false && false)
            {
               var_595 = getItemSpacing(_itemList["-1"],var_64[0]);
            }
            else
            {
               var_595 = const_99;
            }
            animationStart();
         }
      }
      
      private function setChatItemLocHorizontal(param1:RoomChatItem) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         if(param1 == null || var_25 == null)
         {
            return;
         }
         var _loc2_:Number = (param1.senderX + var_715.x) * var_868;
         var _loc3_:Number = _loc2_ - param1.width / 2;
         var _loc4_:Number = _loc3_ + param1.width;
         var _loc5_:Number = 0 - const_772;
         var _loc6_:Number = 0 + const_772 - 0;
         var _loc7_:Boolean = _loc3_ >= _loc5_ && _loc3_ <= _loc6_;
         var _loc8_:Boolean = _loc4_ >= _loc5_ && _loc4_ <= _loc6_;
         if(_loc7_ && _loc8_)
         {
            _loc9_ = _loc3_;
            _loc10_ = _loc9_;
         }
         else if(_loc2_ >= 0)
         {
            _loc9_ = _loc6_ - param1.width;
         }
         else
         {
            _loc9_ = _loc5_;
         }
         param1.x = _loc9_ + 0 + var_37.x;
         if(_loc2_ < _loc5_ || _loc2_ > _loc6_)
         {
            param1.hidePointer();
         }
         else
         {
            param1.setPointerOffset(_loc3_ - _loc9_);
         }
      }
      
      public function onItemMouseOut(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      private function checkLastItemAllowsAdding(param1:RoomChatItem) : Boolean
      {
         if(false)
         {
            return true;
         }
         var _loc2_:RoomChatItem = _itemList["-1"];
         if(param1 == null || _loc2_ == null)
         {
            return false;
         }
         if(_loc2_.view == null)
         {
            return true;
         }
         if(var_131.rectangle.bottom - (var_131.y + _loc2_.y + _loc2_.height) <= getItemSpacing(_loc2_,param1))
         {
            return false;
         }
         return true;
      }
      
      public function mouseUp() : void
      {
         var _loc1_:Number = var_37.rectangle.bottom - 0;
         if(_loc1_ < const_489)
         {
            if(_loc1_ <= var_150 + var_37.y)
            {
               if(historyViewerActive())
               {
                  hideHistoryViewer();
               }
               resetArea();
               return;
            }
         }
         if(var_1284 && !historyViewerActive())
         {
            resetArea();
            var_1284 = false;
         }
      }
      
      private function getFreeItemId() : String
      {
         return "chat_" + var_2080.toString() + "_item_" + (var_2078++).toString();
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(_disposed)
         {
            return;
         }
         while(false)
         {
            _loc1_ = var_224.shift();
         }
         var_25.dispose();
         var_25 = null;
         while(false)
         {
            _loc1_ = _itemList.shift();
            _loc1_.dispose();
         }
         while(false)
         {
            _loc1_ = var_64.shift();
            _loc1_.dispose();
         }
         var_37.dispose();
         if(var_21 != null)
         {
            var_21.removeUpdateReceiver(this);
            var_21 = null;
         }
         super.dispose();
         _disposed = true;
      }
      
      private function animationStop() : void
      {
         var_417 = false;
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetChatUpdateEvent.const_506,onChatMessage);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_239,onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_529,onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_561,onRoomViewUpdate);
      }
      
      public function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(var_25 != null)
         {
            var_25.beginDrag(param1.stageY,true);
         }
      }
      
      private function alignItems() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(var_25 == null)
         {
            return;
         }
         _loc1_ = -1;
         while(_loc1_ >= 0)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemLocHorizontal(_loc2_);
               setChatItemLocVertical(_loc2_);
            }
            _loc1_--;
         }
         _loc1_ = 0;
         while(_loc1_ < _itemList.length)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemRenderable(_loc2_);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < var_64.length)
         {
            _loc2_ = var_64[_loc1_];
            if(_loc2_ != null)
            {
               setChatItemLocHorizontal(_loc2_);
            }
            _loc1_++;
         }
      }
      
      private function onChatMessage(param1:RoomWidgetChatUpdateEvent) : void
      {
         var _loc2_:RoomChatItem = new RoomChatItem(this,windowManager,assets,getFreeItemId(),localizations);
         _loc2_.define(param1);
         if(var_868 != 1)
         {
            _loc2_.senderX /= var_868;
         }
         _loc2_.senderX -= 0;
         setChatItemLocHorizontal(_loc2_);
         var_64.push(_loc2_);
         processBuffer();
      }
      
      private function setChatItemLocVertical(param1:RoomChatItem) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 != null)
         {
            _loc2_ = _itemList.indexOf(param1);
            _loc3_ = !!historyViewerActive() ? 0 : Number(var_512);
            if(_loc2_ == -1)
            {
               param1.y = getAreaBottom() - (_loc3_ + 1) * const_99 - const_278;
            }
            else
            {
               _loc4_ = _itemList[_loc2_ + 1].aboveLevels;
               if(_loc4_ < 2)
               {
                  param1.y = _itemList[_loc2_ + 1].y - getItemSpacing(param1,_itemList[_loc2_ + 1]);
               }
               else
               {
                  param1.y = _itemList[_loc2_ + 1].y - _loc4_ * const_99;
               }
            }
         }
      }
      
      public function disableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_64.length)
         {
            _loc1_ = var_64[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
      }
      
      private function animationStart() : void
      {
         if(var_417)
         {
            return;
         }
         selectItemsToMove();
         var_417 = true;
      }
      
      public function hideHistoryViewer() : void
      {
         if(var_25 != null)
         {
            var_25.hideHistoryViewer();
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(getTimer() > var_714 && var_714 > 0)
         {
            var_714 = -1;
            animationStart();
         }
         if(var_417)
         {
            _loc2_ = param1 / const_1047 * const_1091;
            if(_loc2_ + var_716 > var_595)
            {
               _loc2_ = var_595 - var_716;
            }
            if(_loc2_ > 0)
            {
               moveItemsUp(_loc2_);
               var_716 += _loc2_;
            }
            if(var_716 >= var_595)
            {
               var_595 = const_99;
               var_716 = 0;
               animationStop();
               processBuffer();
               var_714 = getTimer() + const_771;
            }
         }
         if(var_25 != null)
         {
            var_25.update(param1);
         }
      }
      
      public function getTotalContentHeight() : int
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc3_];
            if(_loc1_ != null)
            {
               if(_loc3_ == 0)
               {
                  _loc2_ += const_99;
               }
               else
               {
                  _loc2_ += getItemSpacing(_itemList[_loc3_ - 1],_loc1_);
               }
               _loc2_ += (_loc1_.aboveLevels - 1) * const_99;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function onRoomViewUpdate(param1:RoomWidgetRoomViewUpdateEvent) : void
      {
         var _loc2_:Rectangle = param1.rect;
         if(param1.scale > 0)
         {
            if(var_1528 == 0)
            {
               var_1528 = param1.scale;
            }
            else
            {
               var_868 = param1.scale / var_1528;
            }
         }
         if(param1.positionDelta != null)
         {
            var_715.x += param1.positionDelta.x / var_868;
            var_715.y += param1.positionDelta.y / var_868;
         }
         if(param1.rect != null)
         {
            if(var_25 == null)
            {
               return;
            }
            var_37.width = _loc2_.width;
            var_37.height = var_150 + var_25.pulldownBarHeight;
            var_356.width = 0 - 0;
            var_356.height = var_150;
            var_356.x = var_37.x;
            var_356.y = var_37.y;
            var_131.width = 0 - 0;
            var_131.height = var_150;
            if(historyViewerActive())
            {
               reAlignItemsToHistoryContent();
            }
            var_25.containerResized(var_37.rectangle,true);
         }
         alignItems();
      }
      
      private function getAreaBottom() : Number
      {
         if(historyViewerActive())
         {
            return var_131.height;
         }
         return var_150 + var_37.y;
      }
      
      private function purgeItems() : void
      {
         var _loc2_:* = null;
         if(historyViewerActive())
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         while(_itemList.length > var_2079)
         {
            _loc2_ = _itemList.shift();
            _loc3_ = var_224.indexOf(_loc2_);
            if(_loc3_ > -1)
            {
               var_224.splice(_loc3_,1);
            }
            if(_loc2_.view != null)
            {
               var_131.removeChild(_loc2_.view);
               _loc2_.hideView();
            }
            _loc2_.dispose();
            _loc2_ = null;
         }
         var _loc4_:Boolean = false;
         _loc1_ = 0;
         for(; _loc1_ < _itemList.length; _loc1_++)
         {
            _loc2_ = _itemList[_loc1_];
            if(_loc2_ != null)
            {
               if(_loc2_.y > -const_490)
               {
                  _loc4_ = true;
               }
               _loc2_.aboveLevels = 1;
               if(_loc2_.view != null)
               {
                  _loc3_ = var_224.indexOf(_loc2_);
                  if(_loc3_ > -1)
                  {
                     var_224.splice(_loc3_,1);
                  }
                  var_131.removeChild(_loc2_.view);
                  _loc2_.hideView();
               }
               continue;
               break;
            }
         }
         if(false)
         {
            _loc4_ = true;
         }
         if(getTotalContentHeight() > const_99 && !_loc4_ && !historyViewerActive())
         {
            if(var_25 != null)
            {
               stretchAreaBottomTo(var_37.y);
               alignItems();
               if(!historyViewerActive())
               {
                  var_25.showHistoryViewer();
               }
               if(!historyViewerVisible())
               {
                  var_25.visible = true;
               }
            }
         }
         else if(historyViewerVisible())
         {
            var_25.visible = false;
         }
      }
      
      public function stretchAreaBottomBy(param1:Number) : void
      {
         var _loc2_:Number = var_37.rectangle.bottom + param1 - 0;
         stretchAreaBottomTo(_loc2_);
      }
      
      private function activateItemFromBuffer() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(false)
         {
            return;
         }
         if(historyViewerMinimized())
         {
            resetArea();
            hideHistoryViewer();
         }
         if(!checkLastItemAllowsAdding(var_64[0]))
         {
            selectItemsToMove();
            moveItemsUp(getItemSpacing(_itemList["-1"],var_64[0]));
            if(!checkLastItemAllowsAdding(var_64[0]))
            {
               var_131.height += const_99;
               if(var_25 != null)
               {
                  var_25.containerResized(var_37.rectangle);
               }
            }
         }
         _loc1_ = var_64.shift();
         if(_loc1_ != null)
         {
            _loc1_.renderView();
            _loc2_ = _loc1_.view;
            if(_loc2_ != null)
            {
               var_131.addChild(_loc2_);
               _loc1_.timestamp = new Date().time;
               _itemList.push(_loc1_);
               _loc3_ = 0;
               if(false)
               {
                  _loc3_ = _itemList["-2"].screenLevel;
                  if(historyViewerActive())
                  {
                     _loc1_.screenLevel = _loc3_ + 1;
                  }
                  else
                  {
                     _loc1_.screenLevel = _loc3_ + Math.max(var_512,1);
                  }
               }
               else
               {
                  _loc1_.screenLevel = 100;
               }
               _loc1_.aboveLevels = var_512;
               if(_loc1_.aboveLevels > const_488 + const_350 + 2)
               {
                  _loc1_.aboveLevels = const_488 + const_350 + 2;
               }
               var_512 = 0;
               setChatItemLocHorizontal(_loc1_);
               setChatItemLocVertical(_loc1_);
               setChatItemRenderable(_loc1_);
            }
         }
      }
      
      public function stretchAreaBottomTo(param1:Number) : void
      {
         var _loc2_:int = var_37.context.getDesktopWindow().height - 0;
         param1 = Math.min(param1,_loc2_);
         var_150 = param1 - 0;
         var_37.height = var_150 + RoomChatHistoryPulldown.const_73;
         if(var_25 != null)
         {
            var_25.containerResized(var_37.rectangle);
         }
      }
      
      public function onItemMouseClick(param1:int, param2:String, param3:int, param4:int, param5:int, param6:WindowMouseEvent) : void
      {
         if(param6.shiftKey)
         {
            if(var_25 != null)
            {
               var_25.toggleHistoryViewer();
            }
            return;
         }
         var _loc7_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_318,param1,param3);
         messageListener.processWidgetMessage(_loc7_);
         var _loc8_:RoomWidgetChatSelectAvatarMessage = new RoomWidgetChatSelectAvatarMessage(RoomWidgetChatSelectAvatarMessage.const_573,param1,param2,param4,param5);
         messageListener.processWidgetMessage(_loc8_);
      }
      
      private function selectItemsToMove() : void
      {
         var _loc4_:* = null;
         if(var_417)
         {
            return;
         }
         purgeItems();
         var_224 = new Array();
         var _loc1_:int = new Date().time;
         var _loc2_:int = 0;
         if(false)
         {
            var_512 = 1;
            return;
         }
         if(historyViewerActive())
         {
            return;
         }
         ++var_512;
         var _loc3_:int = -1;
         while(_loc3_ >= 0)
         {
            _loc4_ = _itemList[_loc3_];
            if(_loc4_.view != null)
            {
               if(_loc4_.screenLevel > const_350 || _loc4_.screenLevel == _loc2_ - 1 || _loc1_ - _loc4_.timestamp >= const_1092)
               {
                  _loc4_.timestamp = _loc1_;
                  _loc2_ = _loc4_.screenLevel;
                  --_loc4_.screenLevel;
                  var_224.push(_loc4_);
               }
            }
            _loc3_--;
         }
      }
      
      public function enableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < _itemList.length)
         {
            _loc1_ = _itemList[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < var_64.length)
         {
            _loc1_ = var_64[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
      }
      
      public function reAlignItemsToHistoryContent() : void
      {
         if(historyViewerActive())
         {
            var_131.height = getTotalContentHeight() + const_278;
            alignItems();
         }
      }
      
      private function setChatItemRenderable(param1:RoomChatItem) : void
      {
         if(param1 != null)
         {
            if(param1.y < -const_490)
            {
               if(param1.view != null)
               {
                  var_131.removeChild(param1.view);
                  param1.hideView();
               }
            }
            else if(param1.view == null)
            {
               param1.renderView();
               if(param1.view != null)
               {
                  var_131.addChild(param1.view);
               }
            }
         }
      }
      
      private function historyViewerMinimized() : Boolean
      {
         return true;
      }
      
      private function moveItemsUp(param1:int) : void
      {
         var _loc3_:Boolean = false;
         if(var_224 == null)
         {
            return;
         }
         if(false)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc4_:int = -1;
         var _loc5_:int = -1;
         while(_loc5_ >= 0)
         {
            _loc2_ = var_224[_loc5_];
            if(_loc2_ != null)
            {
               if(_loc4_ == -1)
               {
                  _loc4_ = _itemList.indexOf(_loc2_);
               }
               else
               {
                  _loc4_++;
               }
               _loc3_ = true;
               if(historyViewerActive())
               {
                  if(_loc2_.y - param1 + _loc2_.height < 0)
                  {
                     _loc3_ = false;
                  }
               }
               if(_loc4_ > 0)
               {
                  if(_itemList[_loc4_ - 1].view != null)
                  {
                     if(_loc2_.y - param1 - _itemList[_loc4_ - 1].y < getItemSpacing(_itemList[_loc4_ - 1],_loc2_))
                     {
                        _loc3_ = false;
                     }
                  }
               }
               if(_loc3_)
               {
                  _loc2_.y -= param1;
               }
            }
            _loc5_--;
         }
      }
      
      private function historyViewerActive() : Boolean
      {
         return var_25 == null ? false : Boolean(var_25.active);
      }
      
      private function getItemSpacing(param1:RoomChatItem, param2:RoomChatItem) : Number
      {
         if(param1.checkOverlap(param2.x,param1.y,param2.width,param2.height))
         {
            return const_99;
         }
         return const_1094;
      }
      
      public function onItemMouseDown(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
         if(historyViewerVisible())
         {
            return;
         }
         if(var_25 != null)
         {
            var_25.beginDrag(param5.stageY);
         }
      }
      
      private function historyViewerVisible() : Boolean
      {
         return var_25 == null ? false : Boolean(var_25.visible);
      }
   }
}
