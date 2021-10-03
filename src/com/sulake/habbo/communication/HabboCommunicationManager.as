package com.sulake.habbo.communication
{
   import com.sulake.core.Core;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.ICoreCommunicationManager;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.connection.IConnectionStateListener;
   import com.sulake.core.communication.enum.ConnectionType;
   import com.sulake.core.communication.messages.IMessageConfiguration;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.protocol.IProtocol;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.habbo.communication.enum.HabboConnectionType;
   import com.sulake.habbo.communication.enum.HabboProtocolType;
   import com.sulake.habbo.communication.messages.outgoing.handshake.DisconnectMessageComposer;
   import com.sulake.habbo.communication.protocol.WedgieProtocol;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.configuration.enum.HabboConfigurationEvent;
   import com.sulake.habbo.tracking.HabboErrorVariableEnum;
   import com.sulake.iid.IIDCoreCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   
   public class HabboCommunicationManager extends Component implements IHabboCommunicationManager, IConnectionStateListener
   {
       
      
      private var var_763:int = 0;
      
      private var var_32:String = "";
      
      private var var_1202:Timer;
      
      private var var_255:Array;
      
      private var var_1874:Boolean = false;
      
      private var var_81:String = "";
      
      private var _habboConfiguration:IHabboConfigurationManager;
      
      private var var_957:IMessageConfiguration;
      
      private const const_1639:int = 5;
      
      private var var_346:int = -1;
      
      private var var_302:ICoreCommunicationManager;
      
      private var var_828:int = 1;
      
      private var var_1873:Boolean = false;
      
      private var var_1872:Boolean = false;
      
      private var _connection:IConnection;
      
      public function HabboCommunicationManager(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_957 = new HabboMessages();
         var_255 = [];
         var_1202 = new Timer(100,1);
         super(param1,param2,param3);
         this.queueInterface(new IIDCoreCommunicationManager(),onCoreCommunicationManagerInit);
         this.queueInterface(new IIDHabboConfigurationManager(),onHabboConfigurationInit);
         param1.events.addEventListener(Event.UNLOAD,unloading);
      }
      
      public function get port() : int
      {
         if(var_346 < 0 || var_346 >= var_255.length)
         {
            return 0;
         }
         return var_255[var_346];
      }
      
      private function unloading(param1:Event) : void
      {
         _connection.send(new DisconnectMessageComposer());
      }
      
      private function onSecurityError(param1:SecurityErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] Security Error: " + param1.text);
         ErrorReportStorage.addDebugData("Communication Security Error","SecurityError on connect: " + param1.text + ". Port was " + var_255[var_346]);
         tryNextPort();
      }
      
      private function onConnect(param1:Event) : void
      {
         ErrorReportStorage.addDebugData("Connection","Connected with " + var_828 + " attempts");
      }
      
      private function onConfigurationReady(param1:Event = null) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         Logger.log("Habbo Communication Manager: init based on configuration: " + _habboConfiguration);
         if(_habboConfiguration == null)
         {
            Core.crash("Received configuration ready event but configuration was null",Core.const_872);
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Ready");
            var_255 = [];
            var_32 = _habboConfiguration.getKey("connection.info.host","fused37-public-proxy-1.hotel.varoke.net");
            _loc2_ = _habboConfiguration.getKey("connection.info.port","25001");
            if(_habboConfiguration.keyExists("local.environment"))
            {
               var_32 = _habboConfiguration.getKey("connection.info.host.local");
               _loc2_ = _habboConfiguration.getKey("connection.info.port.local");
            }
            _loc3_ = _loc2_.split(",");
            for each(_loc4_ in _loc3_)
            {
               var_255.push(parseInt(_loc4_.replace(" ","")));
            }
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Host: " + var_32);
            Logger.log("Connection Host: " + var_32);
            Logger.log("Connection Ports: " + var_255);
            Logger.log("Habbo Connection Info:" + _connection);
            var_1873 = true;
            if(var_1872)
            {
               nextPort();
            }
         }
      }
      
      public function messageReceived(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1316,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1226,param1 + " " + param2);
         if(false)
         {
            var_81 += ",R:" + param1;
         }
         else
         {
            var_81 = "R:" + param1;
         }
         if(false)
         {
            var_81 = var_81.substring(-150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",var_81);
      }
      
      private function nextPort() : void
      {
         ++var_346;
         if(var_346 >= var_255.length)
         {
            ++var_828;
            ErrorReportStorage.addDebugData("ConnectionRetry","Connection attempt " + var_828);
            if(var_828 > const_1639)
            {
               if(var_1874)
               {
                  return;
               }
               var_1874 = true;
               Core.error("Connection failed to host " + var_32 + " ports " + var_255,true,Core.const_659);
               return;
            }
            var_346 = 0;
         }
         _connection.timeout = var_828 * 5000;
         _connection.init(var_32,var_255[var_346]);
      }
      
      private function onTryNextPort(param1:TimerEvent) : void
      {
         var_1202.stop();
         nextPort();
      }
      
      public function get mode() : int
      {
         return var_763;
      }
      
      override public function dispose() : void
      {
         if(_connection)
         {
            _connection.dispose();
            _connection = null;
         }
         if(var_302)
         {
            var_302.release(new IIDCoreCommunicationManager());
            var_302 = null;
         }
         if(_habboConfiguration)
         {
            _habboConfiguration.release(new IIDHabboConfigurationManager());
            _habboConfiguration = null;
         }
         super.dispose();
      }
      
      public function initConnection(param1:String) : void
      {
         switch(param1)
         {
            case HabboConnectionType.const_272:
               if(_habboConfiguration == null)
               {
                  Core.crash("Tried to connect to proxy but configuration was null",Core.const_659);
                  return;
               }
               if(_connection == null)
               {
                  Core.crash("Tried to connect to proxy but connection was null",Core.const_659);
                  return;
               }
               var_1872 = true;
               if(var_1873)
               {
                  nextPort();
               }
               break;
            default:
               Logger.log("Unknown Habbo Connection Type: " + param1);
         }
      }
      
      public function habboWebLogin(param1:String, param2:String) : IHabboWebLogin
      {
         var _loc3_:String = "";
         _loc3_ = _habboConfiguration.getKey("url.prefix",_loc3_);
         _loc3_ = _loc3_.replace("http://","");
         _loc3_ = _loc3_.replace("https://","");
         return new HabboWebLogin(param1,param2,_loc3_);
      }
      
      public function addHabboConnectionMessageEvent(param1:IMessageEvent) : void
      {
         var_302.addConnectionMessageEvent(HabboConnectionType.const_272,param1);
      }
      
      public function connectionInit(param1:String, param2:int) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1295,param1);
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1212,String(param2));
      }
      
      public function messageSent(param1:String, param2:String) : void
      {
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1331,String(new Date().getTime()));
         ErrorReportStorage.setParameter(HabboErrorVariableEnum.const_1272,param1 + " " + param2);
         if(false)
         {
            var_81 += ",S:" + param1;
         }
         else
         {
            var_81 = "S:" + param1;
         }
         if(false)
         {
            var_81 = var_81.substring(-150);
         }
         ErrorReportStorage.addDebugData("MESSAGE_QUEUE",var_81);
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log("[HabboCommunicationManager] IO Error: " + param1.text);
         switch(param1.type)
         {
            case IOErrorEvent.IO_ERROR:
               break;
            case IOErrorEvent.DISK_ERROR:
               break;
            case IOErrorEvent.NETWORK_ERROR:
               break;
            case IOErrorEvent.VERIFY_ERROR:
         }
         ErrorReportStorage.addDebugData("Communication IO Error","IOError " + param1.type + " on connect: " + param1.text + ". Port was " + var_255[var_346]);
         tryNextPort();
      }
      
      public function set mode(param1:int) : void
      {
         var_763 = param1;
      }
      
      private function onCoreCommunicationManagerInit(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:* = null;
         Logger.log("Habbo Communication Manager: Core Communication Manager found:: " + [param1,param2]);
         if(param2 != null)
         {
            var_302 = param2 as ICoreCommunicationManager;
            var_302.connectionStateListener = this;
            var_302.registerProtocolType(HabboProtocolType.const_887,WedgieProtocol);
            _connection = var_302.createConnection(HabboConnectionType.const_272,ConnectionType.const_960);
            _loc3_ = var_302.getProtocolInstanceOfType(HabboProtocolType.const_887);
            _connection.registerMessageClasses(var_957);
            _connection.protocol = _loc3_;
            _connection.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
            _connection.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
            _connection.addEventListener(Event.CONNECT,onConnect);
         }
      }
      
      private function tryNextPort() : void
      {
         var_1202.addEventListener(TimerEvent.TIMER,onTryNextPort);
         var_1202.start();
      }
      
      private function onHabboConfigurationInit(param1:IID = null, param2:IUnknown = null) : void
      {
         if(param2 != null)
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config Received");
            _habboConfiguration = param2 as IHabboConfigurationManager;
            (_habboConfiguration as Component).events.addEventListener(HabboConfigurationEvent.INIT,onConfigurationReady);
         }
         else
         {
            ErrorReportStorage.addDebugData("CommunicationConfigInit","Config NOT received");
         }
      }
      
      public function getHabboMainConnection(param1:Function) : IConnection
      {
         return !!var_302 ? var_302.queueConnection(HabboConnectionType.const_272,param1) : null;
      }
   }
}
