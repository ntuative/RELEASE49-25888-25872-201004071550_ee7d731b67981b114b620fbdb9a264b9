package com.sulake.habbo.navigator.mainview
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IFrameWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ISelectableWindow;
   import com.sulake.core.window.components.ITabButtonWindow;
   import com.sulake.core.window.components.ITabContextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetOfficialRoomsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.GetPopularRoomTagsMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.LatestEventsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFavouriteRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyFriendsRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomHistorySearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.MyRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.PopularRoomsSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTagSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomTextSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWhereMyFriendsAreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.navigator.RoomsWithHighestScoreSearchMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.room.session.QuitMessageComposer;
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.IViewCtrl;
   import com.sulake.habbo.navigator.Util;
   import com.sulake.habbo.navigator.domain.Tab;
   import com.sulake.habbo.navigator.domain.Tabs;
   import com.sulake.habbo.navigator.events.HabboNavigatorTrackingEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import flash.events.Event;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class MainViewCtrl implements IUpdateReceiver, IDisposable
   {
      
      public static const const_715:int = 2;
      
      public static const const_821:int = 4;
      
      private static const const_494:int = 2;
      
      private static const const_787:int = 1;
      
      public static const const_1503:int = 3;
      
      private static const const_1122:int = 4;
      
      private static const SCROLLBAR_WIDTH:int = 22;
      
      public static const const_382:int = 1;
      
      private static const const_786:int = 3;
       
      
      private var var_2226:int = 0;
      
      private var _disposed:Boolean = false;
      
      private var var_1354:IRegionWindow;
      
      private var var_441:int;
      
      private var var_1353:Boolean = true;
      
      private var var_757:GuestRoomListCtrl;
      
      private var var_13:IFrameWindow;
      
      private var var_384:Timer;
      
      private var var_282:IWindowContainer;
      
      private var var_205:IWindowContainer;
      
      private var var_236:IWindowContainer;
      
      private var var_1350:IWindow;
      
      private var var_1351:Boolean;
      
      private var var_922:OfficialRoomListCtrl;
      
      private var var_19:IWindowContainer;
      
      private var var_758:PopularTagsListCtrl;
      
      private var _navigator:HabboNavigator;
      
      private var var_1352:int = 0;
      
      private var var_241:ITabContextWindow;
      
      public function MainViewCtrl(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_758 = new PopularTagsListCtrl(_navigator);
         var_757 = new GuestRoomListCtrl(_navigator);
         var_922 = new OfficialRoomListCtrl(_navigator);
         var_384 = new Timer(300,1);
         var_384.addEventListener(TimerEvent.TIMER,onResizeTimer);
      }
      
      private function getSearchMsg(param1:int, param2:String) : IMessageComposer
      {
         if(param1 == Tabs.const_550)
         {
            return new MyFavouriteRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_507)
         {
            return new MyFriendsRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_646)
         {
            return new MyRoomHistorySearchMessageComposer();
         }
         if(param1 == Tabs.const_226)
         {
            return new MyRoomsSearchMessageComposer();
         }
         if(param1 == Tabs.const_306)
         {
            return new PopularRoomsSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_732)
         {
            return new RoomsWhereMyFriendsAreSearchMessageComposer();
         }
         if(param1 == Tabs.const_692)
         {
            return new RoomsWithHighestScoreSearchMessageComposer();
         }
         if(param1 == Tabs.const_299)
         {
            return new RoomTagSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_200)
         {
            return new RoomTextSearchMessageComposer(param2);
         }
         if(param1 == Tabs.const_472)
         {
            return new LatestEventsSearchMessageComposer(param2);
         }
         Logger.log("No message for searchType: " + param1);
         return null;
      }
      
      private function prepare() : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var_13 = IFrameWindow(_navigator.getXmlWindow("grs_main_window"));
         var_241 = ITabContextWindow(var_13.findChildByName("tab_context"));
         var_19 = IWindowContainer(var_13.findChildByName("tab_content"));
         var_236 = IWindowContainer(var_13.findChildByName("custom_content"));
         var_205 = IWindowContainer(var_13.findChildByName("list_content"));
         var_282 = IWindowContainer(var_13.findChildByName("custom_footer"));
         var_1350 = var_13.findChildByName("loading_text");
         var _loc1_:IWindow = var_13.findChildByTag("close");
         _loc1_.procedure = onWindowClose;
         var_1354 = IRegionWindow(var_13.findChildByName("to_hotel_view"));
         var_1354.procedure = onHotelView;
         refreshToHotelViewButton(false);
         var_13.procedure = onWindow;
         for each(_loc2_ in _navigator.tabs.tabs)
         {
            _loc3_ = var_241.getTabItemByID(_loc2_.id);
            _loc3_.setParamFlag(HabboWindowParam.const_41,true);
            _loc3_.procedure = onTabClick;
            _loc2_.button = _loc3_;
         }
         var_13.scaler.setParamFlag(HabboWindowParam.const_617,false);
         var_13.scaler.setParamFlag(HabboWindowParam.const_1326,true);
      }
      
      public function get mainWindow() : IFrameWindow
      {
         return var_13;
      }
      
      private function onTabClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_58)
         {
            return;
         }
         var _loc3_:int = param2.id;
         if(var_1351)
         {
            var_1351 = false;
            return;
         }
         var _loc4_:Tab = _navigator.tabs.getTab(_loc3_);
         _loc4_.sendSearchRequest();
         switch(_loc4_.id)
         {
            case Tabs.const_330:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_EVENTS));
               break;
            case Tabs.const_253:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ME));
               break;
            case Tabs.const_322:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_OFFICIAL));
               break;
            case Tabs.const_273:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_ROOMS));
               break;
            case Tabs.const_222:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCH));
         }
      }
      
      private function refreshScrollbar(param1:IViewCtrl) : void
      {
         if(param1.content == null || !param1.content.visible)
         {
            return;
         }
         var _loc2_:IItemListWindow = IItemListWindow(param1.content.findChildByName("item_list"));
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         var _loc4_:* = _loc2_.scrollableRegion.height > _loc2_.height;
         if(_loc3_.visible)
         {
            if(_loc4_)
            {
               return;
            }
            _loc3_.visible = false;
            _loc2_.width += SCROLLBAR_WIDTH;
         }
         else
         {
            if(!_loc4_)
            {
               return;
            }
            _loc3_.visible = true;
            _loc2_.width -= SCROLLBAR_WIDTH;
         }
      }
      
      private function onWindowClose(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         Logger.log("Close window");
         this.close();
      }
      
      private function sendTrackingEvent(param1:int) : void
      {
         switch(param1)
         {
            case Tabs.const_472:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_LATEST_EVENTS));
               break;
            case Tabs.const_550:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FAVOURITES));
               break;
            case Tabs.const_507:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_FRIENDS_ROOMS));
               break;
            case Tabs.const_646:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_HISTORY));
               break;
            case Tabs.const_226:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_MY_ROOMS));
               break;
            case Tabs.const_551:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_OFFICIALROOMS));
               break;
            case Tabs.const_306:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_POPULAR_ROOMS));
               break;
            case Tabs.const_732:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WHERE_MY_FRIENDS_ARE));
               break;
            case Tabs.const_692:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_ROOMS_WITH_HIGHEST_SCORE));
               break;
            case Tabs.const_299:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TAG_SEARCH));
               break;
            case Tabs.const_200:
               _navigator.events.dispatchEvent(new Event(HabboNavigatorTrackingEvent.HABBO_NAVIGATOR_TRACKING_EVENT_SEARCHTYPE_TEXT_SEARCH));
         }
      }
      
      private function refreshList(param1:Boolean, param2:Boolean, param3:IViewCtrl, param4:String) : void
      {
         var _loc5_:* = null;
         if(!param2)
         {
            return;
         }
         if(param3.content == null)
         {
            _loc5_ = var_205.getChildByName(param4);
            param3.content = IWindowContainer(_loc5_);
         }
         if(param1)
         {
            param3.refresh();
         }
         param3.content.visible = true;
      }
      
      public function isOpen() : Boolean
      {
         return var_13 != null && false;
      }
      
      private function refreshListContent(param1:Boolean) : void
      {
         Util.hideChildren(var_205);
         refreshGuestRooms(param1,_navigator.data.guestRoomSearchArrived);
         refreshPopularTags(param1,_navigator.data.popularTagsArrived);
         refreshOfficialRooms(param1,_navigator.data.officialRoomsArrived);
      }
      
      private function onResizeTimer(param1:TimerEvent) : void
      {
         refreshScrollbar(var_758);
         refreshScrollbar(var_757);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function stretchNewEntryIfNeeded(param1:IViewCtrl, param2:IWindowContainer) : void
      {
         var _loc3_:IWindow = param1.content.findChildByName("scroller");
         if(_loc3_.visible)
         {
            return;
         }
         param2.width += SCROLLBAR_WIDTH;
      }
      
      public function startSearch(param1:int, param2:int, param3:String = "-1", param4:int = 1) : void
      {
         var _loc5_:Tab = _navigator.tabs.getSelected();
         _navigator.tabs.setSelectedTab(param1);
         var _loc6_:Tab = _navigator.tabs.getSelected();
         ErrorReportStorage.addDebugData("StartSearch","Start search " + _loc5_.id + " => " + _loc6_.id);
         this.var_1353 = _loc5_ != _loc6_;
         if(_loc5_ != _loc6_)
         {
            _loc6_.tabPageDecorator.tabSelected();
         }
         _navigator.data.startLoading();
         if(param4 == const_382)
         {
            _navigator.send(getSearchMsg(param2,param3));
         }
         else if(param4 == const_715)
         {
            _navigator.send(new GetPopularRoomTagsMessageComposer());
         }
         else
         {
            _navigator.send(new GetOfficialRoomsMessageComposer());
         }
         if(!isOpen())
         {
            open();
            this.var_441 = const_494;
            this.var_205.blend = 0;
            if(this.var_236.visible)
            {
               this.var_236.blend = 0;
               this.var_282.blend = 0;
            }
         }
         else
         {
            this.var_441 = const_787;
         }
         this.var_1352 = 0;
         _navigator.registerUpdateReceiver(this,2);
         sendTrackingEvent(param2);
      }
      
      private function refreshCustomContent() : void
      {
         Util.hideChildren(var_236);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshCustomContent(var_236);
         if(Util.hasVisibleChildren(var_236))
         {
            var_236.visible = true;
         }
         else
         {
            var_236.visible = false;
            var_236.blend = 1;
         }
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            _navigator = null;
            if(var_13)
            {
               var_13.dispose();
               var_13 = null;
            }
            if(var_19)
            {
               var_19.dispose();
               var_19 = null;
            }
            if(var_384)
            {
               var_384.removeEventListener(TimerEvent.TIMER,onResizeTimer);
               var_384.reset();
               var_384 = null;
            }
            if(var_758)
            {
               var_758.dispose();
               var_758 = null;
            }
            if(var_757)
            {
               var_757.dispose();
               var_757 = null;
            }
            if(var_922)
            {
               var_922.dispose();
               var_922 = null;
            }
         }
      }
      
      private function onWindow(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_45 || param2 != var_13)
         {
            return;
         }
         if(!this.var_384.running)
         {
            this.var_384.reset();
            this.var_384.start();
         }
      }
      
      private function refreshOfficialRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_922,"official_rooms");
      }
      
      private function refreshGuestRooms(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_757,"guest_rooms");
      }
      
      private function refreshTab() : void
      {
         var _loc1_:Tab = _navigator.tabs.getSelected();
         var _loc2_:ISelectableWindow = var_241.selector.getSelected();
         if(_loc1_.button != _loc2_)
         {
            var_1351 = true;
            var_241.selector.setSelected(_loc1_.button);
         }
      }
      
      private function refreshPopularTags(param1:Boolean, param2:Boolean) : void
      {
         refreshList(param1,param2,var_758,"popular_tags");
      }
      
      public function onNavigatorToolBarIconClick() : Boolean
      {
         if(isOpen())
         {
            close();
            return false;
         }
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.navigatorOpenedWhileInTab();
         return true;
      }
      
      public function open() : void
      {
         var _loc1_:Boolean = false;
         if(this.var_13 == null)
         {
            prepare();
            _loc1_ = true;
         }
         refresh();
         var_13.visible = true;
         var_13.activate();
         if(_loc1_)
         {
            _navigator.toolbar.events.dispatchEvent(new HabboToolbarShowMenuEvent(HabboToolbarShowMenuEvent.const_48,HabboToolbarIconEnum.NAVIGATOR,var_13));
         }
      }
      
      private function refreshFooter() : void
      {
         Util.hideChildren(var_282);
         var _loc1_:Tab = _navigator.tabs.getSelected();
         _loc1_.tabPageDecorator.refreshFooter(var_282);
         if(Util.hasVisibleChildren(var_282))
         {
            var_282.visible = true;
         }
         else
         {
            var_282.visible = false;
         }
      }
      
      public function reloadRoomList(param1:int) : Boolean
      {
         ErrorReportStorage.addDebugData("MainViewCtrl","Reloading RoomList");
         if(this.isOpen() && this._navigator.data.guestRoomSearchResults != null && this._navigator.data.guestRoomSearchResults.searchType == param1)
         {
            startSearch(_navigator.tabs.getSelected().id,param1,"");
            return true;
         }
         return false;
      }
      
      private function onHotelView(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER)
         {
            refreshToHotelViewButton(true);
         }
         else if(param1.type == WindowMouseEvent.const_30)
         {
            refreshToHotelViewButton(false);
         }
         else if(param1.type == WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            _navigator.send(new QuitMessageComposer());
         }
      }
      
      public function refresh() : void
      {
         if(var_13 == null)
         {
            return;
         }
         refreshTab();
         refreshCustomContent();
         refreshListContent(true);
         refreshFooter();
         var_236.height = Util.getLowestPoint(var_236);
         var_282.height = Util.getLowestPoint(var_282);
         var _loc1_:int = 0;
         Util.moveChildrenToColumn(var_19,["custom_content","list_content"],var_236.y,8);
         var_205.height = var_205.height + _loc1_ - 0 - 0 + var_2226;
         Util.moveChildrenToColumn(var_19,["list_content","custom_footer"],var_205.y,8);
         var_2226 = var_282.height;
         onResizeTimer(null);
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:Number = NaN;
         if(this.var_205 == null)
         {
            return;
         }
         var _loc2_:Number = param1 / 150;
         if(var_441 == const_787)
         {
            _loc3_ = Math.min(1,Math.max(0,this.var_205.blend - _loc2_));
            this.var_205.blend = _loc3_;
            this.var_236.blend = !!var_1353 ? Number(_loc3_) : Number(1);
            this.var_282.blend = !!var_1353 ? Number(_loc3_) : Number(1);
            if(_loc3_ == 0)
            {
               var_441 = const_494;
            }
         }
         else if(var_441 == const_494)
         {
            if(var_1352 % 10 == 1)
            {
               var_1350.visible = true;
            }
            ++var_1352;
            if(!_navigator.data.isLoading())
            {
               var_441 = const_786;
            }
         }
         else if(var_441 == const_786)
         {
            this.refresh();
            var_441 = const_1122;
         }
         else
         {
            var_1350.visible = false;
            _loc3_ = Math.min(1,Math.max(0,this.var_205.blend + _loc2_));
            this.var_205.blend = _loc3_;
            this.var_236.blend = !!var_1353 ? Number(_loc3_) : Number(1);
            this.var_282.blend = !!var_1353 ? Number(_loc3_) : Number(1);
            if(false)
            {
               _navigator.removeUpdateReceiver(this);
            }
         }
      }
      
      private function refreshToHotelViewButton(param1:Boolean) : void
      {
         _navigator.refreshButton(var_1354,"icon_hotelview",!param1,null,0);
         _navigator.refreshButton(var_1354,"icon_hotelview_reactive",param1,null,0);
      }
      
      public function close() : void
      {
         if(var_13 != null)
         {
            var_13.visible = false;
         }
      }
   }
}
