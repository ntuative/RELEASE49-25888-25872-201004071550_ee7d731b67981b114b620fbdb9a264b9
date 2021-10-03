package com.sulake.habbo.ui
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.advertisement.IAdManager;
   import com.sulake.habbo.advertisement.events.AdEvent;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.IHabboAvatarEditor;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.moderation.IHabboModeration;
   import com.sulake.habbo.navigator.IHabboNavigator;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.room.events.RoomEngineDimmerStateEvent;
   import com.sulake.habbo.room.events.RoomEngineEvent;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.events.RoomEngineRoomColorEvent;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.events.RoomSessionChatEvent;
   import com.sulake.habbo.session.events.RoomSessionDimmerPresetsEvent;
   import com.sulake.habbo.session.events.RoomSessionDoorbellEvent;
   import com.sulake.habbo.session.events.RoomSessionErrorMessageEvent;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.session.events.RoomSessionFriendRequestEvent;
   import com.sulake.habbo.session.events.RoomSessionPollEvent;
   import com.sulake.habbo.session.events.RoomSessionPresentEvent;
   import com.sulake.habbo.session.events.RoomSessionQueueEvent;
   import com.sulake.habbo.session.events.RoomSessionUserBadgesEvent;
   import com.sulake.habbo.session.events.RoomSessionVoteEvent;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.widget.IRoomWidgetFactory;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboAdManager;
   import com.sulake.iid.IIDHabboAvatarEditor;
   import com.sulake.iid.IIDHabboCatalog;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboFriendList;
   import com.sulake.iid.IIDHabboHelp;
   import com.sulake.iid.IIDHabboInventory;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboModeration;
   import com.sulake.iid.IIDHabboNavigator;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboRoomWidget;
   import com.sulake.iid.IIDHabboSoundManager;
   import com.sulake.iid.IIDHabboToolbar;
   import com.sulake.iid.IIDRoomEngine;
   import com.sulake.iid.IIDSessionDataManager;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class RoomUI extends Component implements IRoomUI, IUpdateReceiver
   {
       
      
      private var var_477:IHabboSoundManager;
      
      private var var_1194:IHabboAvatarEditor = null;
      
      private var var_254:IAdManager;
      
      private var var_821:IRoomWidgetFactory;
      
      private var var_18:IRoomSessionManager;
      
      private var _roomEngine:IRoomEngine;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_585:IAvatarRenderManager;
      
      private var var_253:Map;
      
      private var var_190:IHabboToolbar;
      
      private var var_676:IHabboModeration;
      
      private var var_358:ISessionDataManager;
      
      private var _navigator:IHabboNavigator;
      
      private var _catalog:IHabboCatalog;
      
      private var var_10:IHabboInventory;
      
      private var var_1474:int = -1;
      
      private var _config:IHabboConfigurationManager;
      
      private var _localization:IHabboLocalizationManager;
      
      private var _friendList:IHabboFriendList;
      
      private var _connection:IConnection;
      
      private var var_822:IHabboHelp;
      
      public function RoomUI(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
         queueInterface(new IIDRoomEngine(),onRoomEngineReady);
         queueInterface(new IIDHabboRoomSessionManager(),method_9);
         queueInterface(new IIDHabboRoomWidget(),onRoomWidgetFactoryReady);
         queueInterface(new IIDSessionDataManager(),onSessionDataManagerReady);
         queueInterface(new IIDHabboFriendList(),onFriendListReady);
         queueInterface(new IIDAvatarRenderManager(),onAvatarRenderManagerReady);
         queueInterface(new IIDHabboInventory(),onInventoryReady);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
         queueInterface(new IIDHabboNavigator(),onNavigatorReady);
         queueInterface(new IIDHabboAvatarEditor(),onAvatarEditorReady);
         queueInterface(new IIDHabboCatalog(),onCatalogReady);
         queueInterface(new IIDHabboAdManager(),onAdManagerReady);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
         queueInterface(new IIDHabboHelp(),onHabboHelpReady);
         queueInterface(new IIDHabboModeration(),onHabboModerationReady);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
         queueInterface(new IIDHabboSoundManager(),onSoundManagerReady);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationReady);
         var_253 = new Map();
         registerUpdateReceiver(this,0);
      }
      
      public function createDesktop(param1:IRoomSession) : IRoomDesktop
      {
         if(param1 == null)
         {
            return null;
         }
         if(_roomEngine == null)
         {
            return null;
         }
         var _loc2_:String = getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ != null)
         {
            return _loc3_;
         }
         _loc3_ = new RoomDesktop(param1,assets,_connection);
         _loc3_.roomEngine = _roomEngine;
         _loc3_.windowManager = _windowManager;
         _loc3_.roomWidgetFactory = var_821;
         _loc3_.sessionDataManager = var_358;
         _loc3_.roomSessionManager = var_18;
         _loc3_.friendList = _friendList;
         _loc3_.avatarRenderManager = var_585;
         _loc3_.inventory = var_10;
         _loc3_.toolbar = var_190;
         _loc3_.navigator = _navigator;
         _loc3_.avatarEditor = var_1194;
         _loc3_.catalog = _catalog;
         _loc3_.adManager = var_254;
         _loc3_.localization = _localization;
         _loc3_.habboHelp = var_822;
         _loc3_.moderation = var_676;
         _loc3_.config = _config;
         _loc3_.soundManager = var_477;
         var _loc4_:XmlAsset = _assets.getAssetByName("room_desktop_layout_xml") as XmlAsset;
         if(_loc4_ != null)
         {
            _loc3_.layout = _loc4_.content as XML;
         }
         _loc3_.createWidget(RoomWidgetEnum.const_443);
         _loc3_.createWidget(RoomWidgetEnum.const_623);
         _loc3_.init();
         var_253.add(_loc2_,_loc3_);
         return _loc3_;
      }
      
      public function processWidgetMessage(param1:int, param2:int, param3:RoomWidgetMessage) : void
      {
         if(param3 == null)
         {
            return;
         }
         if(_roomEngine == null)
         {
            return;
         }
         var _loc4_:String = getRoomIdentifier(param1,param2);
         var _loc5_:RoomDesktop = getDesktop(_loc4_) as RoomDesktop;
         if(_loc5_ == null)
         {
            return;
         }
         _loc5_.processWidgetMessage(param3);
      }
      
      private function onSoundManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_477 = param2 as IHabboSoundManager;
      }
      
      private function onCatalogReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _catalog = param2 as IHabboCatalog;
      }
      
      private function roomSessionStateEventHandler(param1:RoomSessionEvent) : void
      {
         var _loc2_:* = null;
         if(_roomEngine == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomSessionEvent.const_319:
               _loc2_ = createDesktop(param1.session);
               break;
            case RoomSessionEvent.const_93:
               break;
            case RoomSessionEvent.const_103:
               if(param1.session != null)
               {
                  disposeDesktop(getRoomIdentifier(param1.session.roomId,param1.session.roomCategory));
                  var_190.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_154,HabboToolbarIconEnum.ZOOM));
                  var_190.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_154,HabboToolbarIconEnum.MEMENU));
                  var_190.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_154,HabboToolbarIconEnum.INVENTORY));
               }
         }
      }
      
      private function onAdManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_254 = param2 as IAdManager;
         if(var_254 != null && false)
         {
            var_254.events.addEventListener(AdEvent.const_435,adEventHandler);
            var_254.events.addEventListener(AdEvent.const_442,adEventHandler);
            var_254.events.addEventListener(AdEvent.const_373,adEventHandler);
         }
      }
      
      private function adEventHandler(param1:AdEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:String = getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.processEvent(param1);
      }
      
      private function onConnectionReady(param1:IConnection) : void
      {
         if(disposed)
         {
            return;
         }
         if(param1 != null)
         {
            _connection = param1;
         }
      }
      
      private function onRoomWidgetFactoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_821 = param2 as IRoomWidgetFactory;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(_windowManager != null)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         if(_roomEngine != null)
         {
            _roomEngine.release(new IIDRoomEngine());
            _roomEngine = null;
         }
         if(var_18 != null)
         {
            var_18.release(new IIDHabboRoomSessionManager());
            var_18 = null;
         }
         if(var_821 != null)
         {
            var_821.release(new IIDHabboRoomWidget());
            var_821 = null;
         }
         if(var_10 != null)
         {
            var_10.release(new IIDHabboInventory());
            var_10 = null;
         }
         if(var_190 != null)
         {
            var_190.release(new IIDHabboToolbar());
            var_190 = null;
         }
         if(_config != null)
         {
            _config.release(new IIDHabboConfigurationManager());
            _config = null;
         }
         if(var_477 != null)
         {
            var_477.release(new IIDHabboSoundManager());
            var_477 = null;
         }
         if(var_254 != null)
         {
            var_254.release(new IIDHabboAdManager());
            var_254 = null;
         }
         if(var_585 != null)
         {
            var_585.release(new IIDAvatarRenderManager());
            var_585 = null;
         }
         if(_catalog != null)
         {
            _catalog.release(new IIDHabboCatalog());
            _catalog = null;
         }
         if(_friendList != null)
         {
            _friendList.release(new IIDHabboFriendList());
            _friendList = null;
         }
         if(var_822 != null)
         {
            var_822.release(new IIDHabboHelp());
            var_822 = null;
         }
         if(_localization != null)
         {
            _localization.release(new IIDHabboLocalizationManager());
            _localization = null;
         }
         if(var_676 != null)
         {
            var_676.release(new IIDHabboModeration());
            var_676 = null;
         }
         if(_navigator != null)
         {
            _navigator.release(new IIDHabboNavigator());
            _navigator = null;
         }
         if(var_358 != null)
         {
            var_358.release(new IIDSessionDataManager());
            var_358 = null;
         }
         var_1194 = null;
         _connection = null;
         if(var_253)
         {
            while(false)
            {
               _loc1_ = var_253.getKey(0) as String;
               _loc2_ = var_253.remove(_loc1_) as RoomDesktop;
               if(_loc2_ != null)
               {
                  _loc2_.dispose();
               }
            }
            var_253.dispose();
            var_253 = null;
         }
         removeUpdateReceiver(this);
         super.dispose();
      }
      
      public function disposeDesktop(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc2_:RoomDesktop = var_253.remove(param1) as RoomDesktop;
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.getWidgetState(RoomWidgetEnum.const_263);
            if(_loc3_ != RoomDesktop.const_607)
            {
               var_1474 = _loc3_;
            }
            _loc2_.dispose();
         }
      }
      
      private function onHabboHelpReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_822 = param2 as IHabboHelp;
      }
      
      private function onCommunicationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var _loc3_:IHabboCommunicationManager = param2 as IHabboCommunicationManager;
         if(_loc3_ != null)
         {
            _connection = _loc3_.getHabboMainConnection(onConnectionReady);
            if(_connection != null)
            {
               onConnectionReady(_connection);
            }
         }
      }
      
      private function onHabboModerationReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_676 = param2 as IHabboModeration;
         Logger.log("XXXX GOT HABBO MODERATION: " + var_676);
      }
      
      private function onSessionDataManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_358 = param2 as ISessionDataManager;
      }
      
      private function roomSessionEventHandler(param1:RoomSessionEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(_roomEngine == null)
         {
            return;
         }
         if(param1.session != null)
         {
            _loc2_ = getRoomIdentifier(param1.session.roomId,param1.session.roomCategory);
            _loc3_ = getDesktop(_loc2_);
            if(_loc3_ != null)
            {
               _loc3_.processEvent(param1);
            }
         }
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _localization = param2 as IHabboLocalizationManager;
      }
      
      private function onRoomEngineReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _roomEngine = param2 as IRoomEngine;
         initializeRoomEngineEvents();
         if(var_18 != null && _roomEngine != null && false)
         {
            var_18.roomEngineReady = true;
         }
      }
      
      private function onFriendListReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _friendList = param2 as IHabboFriendList;
      }
      
      public function update(param1:uint) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < var_253.length)
         {
            _loc3_ = var_253.getWithIndex(_loc2_) as RoomDesktop;
            if(_loc3_ != null)
            {
               _loc3_.update();
            }
            _loc2_++;
         }
      }
      
      private function onNavigatorReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _navigator = param2 as IHabboNavigator;
      }
      
      private function roomEventHandler(param1:RoomEngineEvent) : void
      {
         var _loc4_:* = null;
         var _loc5_:Boolean = false;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(_roomEngine == null)
         {
            return;
         }
         var _loc2_:String = getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            if(var_18 == null)
            {
               return;
            }
            _loc4_ = var_18.getSession(param1.roomId,param1.roomCategory);
            if(_loc4_ != null)
            {
               _loc3_ = createDesktop(_loc4_) as RoomDesktop;
            }
         }
         if(_loc3_ == null)
         {
            return;
         }
         switch(param1.type)
         {
            case RoomEngineEvent.const_548:
               _loc5_ = false;
               _loc3_.createRoomView(getActiveCanvasId(param1.roomId,param1.roomCategory));
               if(_roomEngine != null)
               {
                  _roomEngine.setActiveRoom(param1.roomId,param1.roomCategory);
                  if(!_roomEngine.isPublicRoomWorldType(_roomEngine.method_2(param1.roomId,param1.roomCategory)))
                  {
                     _loc7_ = new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_168,HabboToolbarIconEnum.ZOOM);
                     _loc7_.iconState = "2";
                     var_190.events.dispatchEvent(_loc7_);
                  }
                  else
                  {
                     _loc5_ = true;
                  }
               }
               _loc3_.createWidget(RoomWidgetEnum.const_326);
               _loc3_.createWidget(RoomWidgetEnum.const_359);
               if(!_loc3_.session.isSpectatorMode)
               {
                  _loc3_.createWidget(RoomWidgetEnum.const_419);
                  _loc3_.createWidget(RoomWidgetEnum.CHAT_INPUT_WIDGET);
                  _loc3_.createWidget(RoomWidgetEnum.const_123);
               }
               _loc3_.createWidget(RoomWidgetEnum.const_608);
               _loc3_.createWidget(RoomWidgetEnum.const_441);
               _loc3_.createWidget(RoomWidgetEnum.const_376);
               _loc3_.createWidget(RoomWidgetEnum.const_440);
               _loc3_.createWidget(RoomWidgetEnum.const_422);
               _loc3_.createWidget(RoomWidgetEnum.const_409);
               _loc3_.createWidget(RoomWidgetEnum.const_101);
               _loc3_.createWidget(RoomWidgetEnum.const_327);
               _loc3_.createWidget(RoomWidgetEnum.const_127);
               _loc3_.createWidget(RoomWidgetEnum.const_353);
               if(!_loc5_)
               {
                  _loc3_.createWidget(RoomWidgetEnum.const_470);
               }
               _loc3_.createWidget(RoomWidgetEnum.const_263);
               if(var_1474 != RoomDesktop.const_607)
               {
                  _loc3_.initializeWidget(RoomWidgetEnum.const_263,var_1474);
               }
               if(var_254 != null)
               {
                  var_254.showRoomAd();
               }
               break;
            case RoomEngineEvent.const_648:
               disposeDesktop(_loc2_);
               break;
            case RoomEngineRoomColorEvent.const_656:
               _loc6_ = param1 as RoomEngineRoomColorEvent;
               if(_loc6_ == null)
               {
                  break;
               }
               if(_loc6_.bgOnly)
               {
                  _loc3_.setRoomViewColor(16777215,255);
               }
               else
               {
                  _loc3_.setRoomViewColor(_loc6_.color,_loc6_.brightness);
               }
               break;
            case RoomEngineDimmerStateEvent.const_65:
               _loc3_.processEvent(param1);
         }
      }
      
      private function roomSessionDialogEventHandler(param1:RoomSessionEvent) : void
      {
         var errorMessage:String = null;
         var event:RoomSessionEvent = param1;
         var errorTitle:String = "${error.title}";
         switch(event.type)
         {
            case RoomSessionErrorMessageEvent.const_223:
               errorMessage = "${room.error.cant_trade_stuff}";
               break;
            case RoomSessionErrorMessageEvent.const_220:
               errorMessage = "${room.error.cant_set_item}";
               break;
            case RoomSessionErrorMessageEvent.const_500:
               errorMessage = "${room.error.cant_set_not_owner}";
               break;
            case RoomSessionErrorMessageEvent.const_216:
               errorMessage = "${room.error.max_furniture}";
               break;
            case RoomSessionErrorMessageEvent.const_171:
               errorMessage = "${room.error.max_pets}";
               break;
            case RoomSessionErrorMessageEvent.const_204:
               errorMessage = "${room.error.max_queuetiles}";
               break;
            case RoomSessionErrorMessageEvent.const_217:
               errorMessage = "${room.error.max_soundfurni}";
               break;
            case RoomSessionErrorMessageEvent.const_214:
               errorMessage = "${room.error.max_stickies}";
               break;
            case RoomSessionErrorMessageEvent.const_208:
               errorMessage = "${room.error.kicked}";
               errorTitle = "${generic.alert.title}";
               break;
            case RoomSessionErrorMessageEvent.const_215:
               errorMessage = "${room.error.guide.not.available}";
               break;
            case RoomSessionErrorMessageEvent.const_192:
               errorMessage = "${room.error.guide.already.exists}";
               break;
            case RoomSessionErrorMessageEvent.const_702:
               errorMessage = "${room.error.pets.forbidden_in_hotel}";
               break;
            case RoomSessionErrorMessageEvent.const_728:
               errorMessage = "${room.error.pets.forbidden_in_flat}";
               break;
            case RoomSessionErrorMessageEvent.const_738:
               errorMessage = "${room.error.pets.no_free_tiles}";
               break;
            case RoomSessionErrorMessageEvent.const_690:
               errorMessage = "${room.error.pets.selected_tile_not_free}";
               break;
            default:
               return;
         }
         _windowManager.alert(errorTitle,errorMessage,0,function(param1:IAlertDialog, param2:Event):void
         {
            param1.dispose();
         });
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _windowManager = param2 as IHabboWindowManager;
      }
      
      public function getActiveCanvasId(param1:int, param2:int) : int
      {
         return 1;
      }
      
      private function initializeRoomEngineEvents() : void
      {
         if(_roomEngine != null && false)
         {
            _roomEngine.events.addEventListener(RoomEngineEvent.const_540,roomEngineEventHandler);
            _roomEngine.events.addEventListener(RoomEngineEvent.const_548,roomEventHandler);
            _roomEngine.events.addEventListener(RoomEngineEvent.const_648,roomEventHandler);
            _roomEngine.events.addEventListener(RoomEngineDimmerStateEvent.const_65,roomEventHandler);
            _roomEngine.events.addEventListener(RoomEngineRoomColorEvent.const_656,roomEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_629,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_475,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_270,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_654,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_224,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_686,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.ROOM_OBJECT_WIDGET_REQUEST_CREDITFURNI,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_116,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_130,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_129,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_106,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_112,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_111,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_416,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_460,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_420,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_395,roomObjectEventHandler);
            _roomEngine.events.addEventListener(RoomEngineObjectEvent.const_94,roomObjectEventHandler);
         }
      }
      
      private function onAvatarRenderManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_585 = param2 as IAvatarRenderManager;
      }
      
      private function onInventoryReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_10 = param2 as IHabboInventory;
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_190 = param2 as IHabboToolbar;
      }
      
      private function getRoomIdentifier(param1:int, param2:int) : String
      {
         return "hard_coded_room_id";
      }
      
      private function roomObjectEventHandler(param1:RoomEngineObjectEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(_roomEngine == null)
         {
            return;
         }
         var _loc2_:String = getRoomIdentifier(param1.roomId,param1.roomCategory);
         var _loc3_:RoomDesktop = getDesktop(_loc2_) as RoomDesktop;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.roomObjectEventHandler(param1);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         _config = param2 as IHabboConfigurationManager;
      }
      
      private function method_9(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_18 = param2 as IRoomSessionManager;
         registerSessionEvents();
         if(var_18 != null && _roomEngine != null && false)
         {
            var_18.roomEngineReady = true;
         }
      }
      
      private function registerSessionEvents() : void
      {
         if(var_18)
         {
            var_18.events.addEventListener(RoomSessionEvent.const_319,roomSessionStateEventHandler);
            var_18.events.addEventListener(RoomSessionEvent.const_93,roomSessionStateEventHandler);
            var_18.events.addEventListener(RoomSessionEvent.const_103,roomSessionStateEventHandler);
            var_18.events.addEventListener(RoomSessionChatEvent.const_137,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionUserBadgesEvent.const_121,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionDoorbellEvent.const_101,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionDoorbellEvent.const_122,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionDoorbellEvent.const_54,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionPresentEvent.const_236,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_223,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_220,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_500,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_823,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_796,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_216,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_204,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_217,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_214,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_208,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_192,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_215,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_702,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_728,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_171,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_738,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionErrorMessageEvent.const_690,roomSessionDialogEventHandler);
            var_18.events.addEventListener(RoomSessionQueueEvent.const_425,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionVoteEvent.const_131,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionVoteEvent.const_125,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionPollEvent.const_109,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionPollEvent.const_64,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionPollEvent.const_128,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionDimmerPresetsEvent.const_429,roomSessionEventHandler);
            var_18.events.addEventListener(RoomSessionFriendRequestEvent.const_123,roomSessionEventHandler);
         }
      }
      
      private function roomEngineEventHandler(param1:RoomEngineEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.type == RoomEngineEvent.const_540)
         {
            if(var_18 != null)
            {
               var_18.roomEngineReady = true;
            }
         }
      }
      
      public function getDesktop(param1:String) : IRoomDesktop
      {
         return var_253.getValue(param1) as RoomDesktop;
      }
      
      private function onAvatarEditorReady(param1:IID = null, param2:IUnknown = null) : void
      {
         if(disposed)
         {
            return;
         }
         var_1194 = param2 as IHabboAvatarEditor;
      }
   }
}
