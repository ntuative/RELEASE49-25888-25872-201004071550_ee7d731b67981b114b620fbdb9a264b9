package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_2023:String;
      
      private var var_411:int;
      
      private var var_2111:String;
      
      private var var_2110:String;
      
      private var var_2113:int;
      
      private var var_2112:String;
      
      private var var_2114:int;
      
      private var var_638:Array;
      
      private var var_1020:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_638 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1020 = false;
            return;
         }
         this.var_1020 = true;
         var_2113 = int(_loc2_);
         var_2111 = param1.readString();
         var_411 = int(param1.readString());
         var_2114 = param1.readInteger();
         var_2023 = param1.readString();
         var_2110 = param1.readString();
         var_2112 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_638.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_2114;
      }
      
      public function get eventName() : String
      {
         return var_2023;
      }
      
      public function get eventDescription() : String
      {
         return var_2110;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_2111;
      }
      
      public function get tags() : Array
      {
         return var_638;
      }
      
      public function get creationTime() : String
      {
         return var_2112;
      }
      
      public function get exists() : Boolean
      {
         return var_1020;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_2113;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_638 = null;
      }
      
      public function get flatId() : int
      {
         return var_411;
      }
   }
}
