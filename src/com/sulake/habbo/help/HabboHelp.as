package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_2185:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_136:TutorialUI;
      
      private var var_745:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_57:HelpUI;
      
      private var var_746:IHabboConfigurationManager;
      
      private var var_190:IHabboToolbar;
      
      private var var_611:HotelMergeUI;
      
      private var var_302:IHabboCommunicationManager;
      
      private var var_899:FaqIndex;
      
      private var var_1660:String = "";
      
      private var var_1033:IncomingMessages;
      
      private var var_1322:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1322 = new CallForHelpData();
         var_2185 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_899 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return var_190;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_57 != null)
         {
            var_57.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_57 == null)
         {
            if(!createHelpUI())
            {
               return;
            }
         }
         var_57.toggleUI();
      }
      
      private function removeTutorialUI() : void
      {
         if(var_136 != null)
         {
            var_136.dispose();
            var_136 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_1660;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      override public function dispose() : void
      {
         if(var_57 != null)
         {
            var_57.dispose();
            var_57 = null;
         }
         if(var_136 != null)
         {
            var_136.dispose();
            var_136 = null;
         }
         if(var_611)
         {
            var_611.dispose();
            var_611 = null;
         }
         if(var_899 != null)
         {
            var_899.dispose();
            var_899 = null;
         }
         var_1033 = null;
         if(var_190)
         {
            var_190.release(new IIDHabboToolbar());
            var_190 = null;
         }
         if(var_745)
         {
            var_745.release(new IIDHabboLocalizationManager());
            var_745 = null;
         }
         if(var_302)
         {
            var_302.release(new IIDHabboCommunicationManager());
            var_302 = null;
         }
         if(var_746)
         {
            var_746.release(new IIDHabboConfigurationManager());
            var_746 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_745;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_93:
               if(var_57 != null)
               {
                  var_57.setRoomSessionStatus(true);
               }
               if(var_136 != null)
               {
                  var_136.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_103:
               if(var_57 != null)
               {
                  var_57.setRoomSessionStatus(false);
               }
               if(var_136 != null)
               {
                  var_136.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_57 != null)
         {
            var_57.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_2185;
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(var_57 != null)
         {
            var_57.showCallForHelpResult(param1);
         }
      }
      
      public function initHotelMergeUI() : void
      {
         if(!var_611)
         {
            var_611 = new HotelMergeUI(this);
         }
         var_611.startNameChange();
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_136 == null && _assetLibrary != null && _windowManager != null)
         {
            var_136 = new TutorialUI(this);
         }
         return var_136 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(var_57 == null && _assetLibrary != null && _windowManager != null)
         {
            var_57 = new HelpUI(this,_assetLibrary,_windowManager,var_745,var_190);
         }
         return var_57 != null;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1322;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1322.reportedUserId = param1;
         var_1322.reportedUserName = param2;
         var_57.showUI(HabboHelpViewEnum.const_295);
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_1660 = param1;
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(var_190 != null)
         {
            var_190.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_110,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_745 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_136 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_136.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_302 = IHabboCommunicationManager(param2);
         var_1033 = new IncomingMessages(this,var_302);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_57 != null)
         {
            var_57.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(var_57 != null)
         {
            var_57.hideUI();
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_302 != null && param1 != null)
         {
            var_302.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_899;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_57 != null)
         {
            var_57.updateCallForGuideBotUI(false);
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_190 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_746 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),method_9);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_136;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_86)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_57)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return var_611;
      }
      
      private function method_9(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_93,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_103,onRoomSessionEvent);
         var_190.events.addEventListener(HabboToolbarEvent.const_86,onHabboToolbarEvent);
         var_190.events.addEventListener(HabboToolbarEvent.const_57,onHabboToolbarEvent);
         createHelpUI();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_57 != null)
         {
            var_57.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_746 == null)
         {
            return param1;
         }
         return var_746.getKey(param1,param2,param3);
      }
   }
}
