package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.tracking.LatencyPingResponseMessageEvent;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingReportMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LatencyPingRequestMessageComposer;
   import com.sulake.habbo.communication.messages.parser.tracking.LatencyPingResponseMessageParser;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LatencyTracker
   {
       
      
      private var var_148:Array;
      
      private var var_31:Boolean = false;
      
      private var var_1513:int = 0;
      
      private var var_1511:int = 0;
      
      private var _communication:IHabboCommunicationManager;
      
      private var var_507:Map;
      
      private var var_2014:int = 0;
      
      private var var_1510:int = 0;
      
      private var var_151:IHabboConfigurationManager;
      
      private var var_1245:int = 0;
      
      private var _connection:IConnection;
      
      private var var_1512:int = 0;
      
      public function LatencyTracker()
      {
         super();
      }
      
      public function update(param1:uint) : void
      {
         if(!var_31)
         {
            return;
         }
         if(getTimer() - var_1513 > var_1511)
         {
            testLatency();
         }
      }
      
      private function testLatency() : void
      {
         var_1513 = getTimer();
         var_507.add(var_1245,var_1513);
         _connection.send(new LatencyPingRequestMessageComposer(var_1245));
         ++var_1245;
      }
      
      public function set communication(param1:IHabboCommunicationManager) : void
      {
         _communication = param1;
      }
      
      public function init() : void
      {
         if(var_151 == null || _communication == null || _connection == null)
         {
            return;
         }
         var_1511 = int(var_151.getKey("latencytest.interval"));
         var_1512 = int(var_151.getKey("latencytest.report.index"));
         var_2014 = int(var_151.getKey("latencytest.report.delta"));
         _communication.addHabboConnectionMessageEvent(new LatencyPingResponseMessageEvent(onPingResponse));
         if(var_1511 < 1)
         {
            return;
         }
         var_507 = new Map();
         var_148 = new Array();
         var_31 = true;
      }
      
      private function onPingResponse(param1:IMessageEvent) : void
      {
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:int = 0;
         var _loc11_:* = null;
         if(var_507 == null || var_148 == null)
         {
            return;
         }
         var _loc2_:LatencyPingResponseMessageParser = (param1 as LatencyPingResponseMessageEvent).getParser();
         var _loc3_:int = var_507.getValue(_loc2_.requestId);
         var_507.remove(_loc2_.requestId);
         var _loc4_:int = getTimer() - _loc3_;
         var_148.push(_loc4_);
         if(var_148.length == var_1512 && var_1512 > 0)
         {
            _loc5_ = 0;
            _loc6_ = 0;
            _loc7_ = 0;
            _loc8_ = 0;
            while(_loc8_ < var_148.length)
            {
               _loc5_ += var_148[_loc8_];
               _loc8_++;
            }
            _loc9_ = _loc5_ / 0;
            _loc8_ = 0;
            while(_loc8_ < var_148.length)
            {
               if(var_148[_loc8_] < _loc9_ * 2)
               {
                  _loc6_ += var_148[_loc8_];
                  _loc7_++;
               }
               _loc8_++;
            }
            if(_loc7_ == 0)
            {
               var_148 = [];
               return;
            }
            _loc10_ = _loc6_ / _loc7_;
            if(Math.abs(_loc9_ - var_1510) > var_2014 || var_1510 == 0)
            {
               var_1510 = _loc9_;
               _loc11_ = new LatencyPingReportMessageComposer(_loc9_,_loc10_,var_148.length);
               _connection.send(_loc11_);
            }
            var_148 = [];
         }
      }
      
      public function dispose() : void
      {
         var_31 = false;
         var_151 = null;
         _communication = null;
         _connection = null;
         if(var_507 != null)
         {
            var_507.dispose();
            var_507 = null;
         }
         var_148 = null;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         var_151 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         _connection = param1;
      }
   }
}
