package com.sulake.habbo.widget.memenu
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarActionUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetAvatarEditorUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetCreditBalanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetDanceUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFrameUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetHabboClubUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetSettingsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetToolbarClickedUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetTutorialEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEffectsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetWaveUpdateEvent;
   import com.sulake.habbo.widget.memenu.enum.HabboMeMenuTrackingEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRequestWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetSelectOutfitMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetToolbarMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.external.ExternalInterface;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class MeMenuWidget extends RoomWidgetBase
   {
      
      public static const const_606:String = "me_menu_settings_view";
      
      public static const const_614:String = "me_menu_effects_view";
      
      public static const const_113:String = "me_menu_top_view";
      
      public static const const_1266:String = "me_menu_rooms_view";
      
      public static const const_978:String = "me_menu_dance_moves_view";
      
      public static const const_303:String = "me_menu_my_clothes_view";
       
      
      private var var_1882:Boolean = false;
      
      private var var_417:Boolean = false;
      
      private var var_1480:int = 0;
      
      private var _eventDispatcher:IEventDispatcher;
      
      private var var_1481:int = 0;
      
      private var var_1886:int = 0;
      
      private var var_1884:Boolean = false;
      
      private var var_256:Boolean = false;
      
      private var var_1883:int = 0;
      
      private var var_1638:Number = 0;
      
      private var _mainContainer:IWindowContainer;
      
      private var var_573:Boolean = false;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_1203:int = 0;
      
      private var var_1885:Boolean = false;
      
      private var var_1010:Point;
      
      private var var_35:IMeMenuView;
      
      public function MeMenuWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IEventDispatcher, param5:IHabboConfigurationManager)
      {
         super(param1,param2,param3);
         _config = param5;
         var_1010 = new Point(0,0);
         _eventDispatcher = param4;
         if(param5 != null && false)
         {
            var_1885 = param5.getKey("client.news.embed.enabled","false") == "true";
         }
         changeView(const_113);
         hide();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetWaveUpdateEvent.const_613,onWaveEvent);
         param1.addEventListener(RoomWidgetDanceUpdateEvent.const_570,onDanceEvent);
         param1.addEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_700,onUpdateEffects);
         param1.addEventListener(RoomWidgetToolbarClickedUpdateEvent.const_634,onToolbarClicked);
         param1.addEventListener(RoomWidgetFrameUpdateEvent.const_288,onUpdate);
         param1.addEventListener(RoomWidgetAvatarEditorUpdateEvent.const_569,onAvatarEditorClosed);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_228,onAvatarDeselected);
         param1.addEventListener(RoomWidgetHabboClubUpdateEvent.const_206,onHabboClubEvent);
         param1.addEventListener(RoomWidgetAvatarActionUpdateEvent.const_603,onAvatarActionEvent);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_213,onUserInfo);
         param1.addEventListener(RoomWidgetSettingsUpdateEvent.const_323,onSettingsUpdate);
         param1.addEventListener(RoomWidgetTutorialEvent.const_104,onTutorialEvent);
         param1.addEventListener(RoomWidgetTutorialEvent.const_463,onTutorialEvent);
         param1.addEventListener(RoomWidgetCreditBalanceUpdateEvent.const_177,onCreditBalance);
         super.registerUpdateEvents(param1);
      }
      
      private function onUpdate(param1:Event = null) : void
      {
         if(!var_417)
         {
            return;
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return _mainContainer;
      }
      
      public function get hasEffectOn() : Boolean
      {
         return var_573;
      }
      
      private function onSettingsUpdate(param1:RoomWidgetSettingsUpdateEvent) : void
      {
         if(!var_256)
         {
            return;
         }
         if(var_35.window.name == const_606)
         {
            (var_35 as MeMenuSettingsView).updateSettings(param1);
         }
      }
      
      public function get isHabboClubActive() : Boolean
      {
         return var_1203 > 0;
      }
      
      private function onWaveEvent(param1:RoomWidgetWaveUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Wave Event received");
      }
      
      private function onCreditBalance(param1:RoomWidgetCreditBalanceUpdateEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var_1481 = param1.balance;
         localizations.registerParameter("widget.memenu.credits","credits",var_1481.toString());
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         var _loc2_:* = null;
         if(!(var_256 && var_35.window.name == const_303))
         {
            _loc2_ = new RoomWidgetRequestWidgetMessage(RoomWidgetRequestWidgetMessage.const_620);
            if(messageListener != null)
            {
               messageListener.processWidgetMessage(_loc2_);
            }
         }
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetWaveUpdateEvent.const_613,onWaveEvent);
         param1.removeEventListener(RoomWidgetDanceUpdateEvent.const_570,onDanceEvent);
         param1.removeEventListener(RoomWidgetUpdateEffectsUpdateEvent.const_700,onUpdateEffects);
         param1.removeEventListener(RoomWidgetToolbarClickedUpdateEvent.const_634,onToolbarClicked);
         param1.removeEventListener(RoomWidgetFrameUpdateEvent.const_288,onUpdate);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_228,onAvatarDeselected);
         param1.removeEventListener(RoomWidgetHabboClubUpdateEvent.const_206,onHabboClubEvent);
         param1.removeEventListener(RoomWidgetAvatarActionUpdateEvent.const_603,onAvatarActionEvent);
         param1.removeEventListener(RoomWidgetAvatarEditorUpdateEvent.const_569,onAvatarEditorClosed);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_213,onUserInfo);
         param1.removeEventListener(RoomWidgetSettingsUpdateEvent.const_323,onSettingsUpdate);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_463,onTutorialEvent);
         param1.removeEventListener(RoomWidgetTutorialEvent.const_104,onTutorialEvent);
         param1.removeEventListener(RoomWidgetCreditBalanceUpdateEvent.const_177,onCreditBalance);
      }
      
      override public function dispose() : void
      {
         hide();
         _eventDispatcher = null;
         if(var_35 != null)
         {
            var_35.dispose();
            var_35 = null;
         }
         super.dispose();
      }
      
      public function get allowHabboClubDances() : Boolean
      {
         return var_1882;
      }
      
      public function get creditBalance() : int
      {
         return var_1481;
      }
      
      public function changeToOutfit(param1:int) : void
      {
         var_1638 = new Date().valueOf();
         this.messageListener.processWidgetMessage(new RoomWidgetSelectOutfitMessage(param1));
      }
      
      private function onTutorialEvent(param1:RoomWidgetTutorialEvent) : void
      {
         switch(param1.type)
         {
            case RoomWidgetTutorialEvent.const_463:
               Logger.log("* MeMenuWidget: onHighlightClothesIcon " + var_256 + " view: " + var_35.window.name);
               if(var_256 != true || var_35.window.name != const_113)
               {
                  return;
               }
               (var_35 as MeMenuMainView).setIconAssets("clothes_icon",const_113,"clothes_highlighter_blue");
               break;
            case RoomWidgetTutorialEvent.const_104:
               hide();
         }
      }
      
      public function get isDancing() : Boolean
      {
         return var_1884;
      }
      
      public function canChangeOutfit() : Boolean
      {
         var _loc1_:Number = new Date().valueOf();
         return _loc1_ - var_1638 > 5000;
      }
      
      public function get habboClubPeriods() : int
      {
         return var_1886;
      }
      
      private function onAvatarActionEvent(param1:RoomWidgetAvatarActionUpdateEvent) : void
      {
         switch(param1.actionType)
         {
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_ACTIVE:
               var_573 = true;
               break;
            case RoomWidgetAvatarActionUpdateEvent.EFFECT_INACTIVE:
               var_573 = false;
               break;
            default:
               trace("MeMenuWidget: unknown avatar action event: " + param1.actionType);
         }
      }
      
      private function onHabboClubEvent(param1:RoomWidgetHabboClubUpdateEvent) : void
      {
         var _loc2_:* = param1.daysLeft != var_1203;
         var_1203 = param1.daysLeft;
         var_1886 = param1.periodsLeft;
         var_1883 = param1.pastPeriods;
         var_1882 = param1.allowClubDances;
         _loc2_ = Boolean(_loc2_ || param1.clubLevel != var_1480);
         var_1480 = param1.clubLevel;
         if(_loc2_)
         {
            if(var_35 != null)
            {
               changeView(var_35.window.name);
            }
         }
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         var_1884 = param1;
      }
      
      private function onAvatarDeselected(param1:Event) : void
      {
         if(var_35 != null && var_35.window.name != const_303)
         {
            hide();
         }
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(_mainContainer == null)
         {
            _mainContainer = windowManager.createWindow("me_menu_main_container","",HabboWindowType.const_1205,HabboWindowStyle.const_943,HabboWindowParam.const_39,new Rectangle(0,0,170,260)) as IWindowContainer;
            _mainContainer.tags.push("room_widget_me_menu");
         }
         return _mainContainer;
      }
      
      private function onUpdateEffects(param1:RoomWidgetUpdateEffectsUpdateEvent) : void
      {
         var _loc2_:* = null;
         var_573 = false;
         for each(_loc2_ in param1.effects)
         {
            if(_loc2_.isInUse)
            {
               var_573 = true;
            }
         }
         if(var_35 != null && var_35.window.name == const_614)
         {
            (var_35 as MeMenuEffectsView).updateEffects(param1.effects);
         }
      }
      
      public function get habboClubPastPeriods() : int
      {
         return var_1883;
      }
      
      public function get habboClubDays() : int
      {
         return var_1203;
      }
      
      public function updateSize() : void
      {
         if(var_35 != null)
         {
            var_1010.x = var_35.window.width + 10;
            var_1010.y = var_35.window.height;
            var_35.window.x = 5;
            var_35.window.y = 0;
            _mainContainer.width = var_1010.x;
            _mainContainer.height = var_1010.y;
         }
      }
      
      private function onToolbarClicked(param1:RoomWidgetToolbarClickedUpdateEvent) : void
      {
         switch(param1.iconType)
         {
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ME_MENU:
               var_256 = !var_256;
               break;
            case RoomWidgetToolbarClickedUpdateEvent.ICON_TYPE_ROOM_INFO:
               var_256 = false;
               break;
            default:
               return;
         }
         if(var_256)
         {
            show();
         }
         else
         {
            hide();
         }
      }
      
      private function onDanceEvent(param1:RoomWidgetDanceUpdateEvent) : void
      {
         Logger.log("[MeMenuWidget] Dance Event received, style: " + param1.style);
      }
      
      public function hide(param1:RoomWidgetRoomObjectUpdateEvent = null) : void
      {
         var _loc2_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_547);
         _loc2_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc2_);
         }
         if(var_35 != null)
         {
            _mainContainer.removeChild(var_35.window);
            var_35.dispose();
            var_35 = null;
         }
         var_256 = false;
         _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_CLOSE));
      }
      
      private function onAvatarEditorClosed(param1:RoomWidgetAvatarEditorUpdateEvent) : void
      {
         if(var_35 != null && var_35.window.name == const_303)
         {
            changeView(const_113);
         }
      }
      
      public function get isNewsEnabled() : Boolean
      {
         return var_1885;
      }
      
      public function changeView(param1:String) : void
      {
         var _loc2_:* = null;
         switch(param1)
         {
            case const_113:
               _loc2_ = new MeMenuMainView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DEFAULT));
               break;
            case const_614:
               _loc2_ = new MeMenuEffectsView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_EFFECTS));
               break;
            case const_978:
               _loc2_ = new MeMenuDanceView();
               _eventDispatcher.dispatchEvent(new Event(HabboMeMenuTrackingEvent.HABBO_MEMENU_TRACKING_EVENT_DANCE));
               break;
            case const_303:
               _loc2_ = new MeMenuClothesView();
               break;
            case const_1266:
               _loc2_ = new MeMenuRoomsView();
               break;
            case const_606:
               _loc2_ = new MeMenuSettingsView();
               break;
            default:
               Logger.log("Me Menu Change view: unknown view: " + param1);
         }
         if(_loc2_ != null)
         {
            if(var_35 != null)
            {
               _mainContainer.removeChild(var_35.window);
               var_35.dispose();
               var_35 = null;
            }
            var_35 = _loc2_;
            var_35.init(this,param1);
         }
         updateSize();
      }
      
      public function get habboClubLevel() : int
      {
         return var_1480;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return _config;
      }
      
      private function show() : void
      {
         if(!_mainContainer || true)
         {
            return;
         }
         changeView(const_113);
         var _loc1_:RoomWidgetToolbarMessage = new RoomWidgetToolbarMessage(RoomWidgetToolbarMessage.const_739);
         _loc1_.window = _mainContainer.parent as IWindowContainer;
         if(messageListener != null)
         {
            messageListener.processWidgetMessage(_loc1_);
         }
         var_256 = true;
      }
   }
}
