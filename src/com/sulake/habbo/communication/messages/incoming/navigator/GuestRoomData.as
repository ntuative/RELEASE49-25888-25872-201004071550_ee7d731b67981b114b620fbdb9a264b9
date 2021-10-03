package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_2030:int;
      
      private var var_2140:String;
      
      private var var_2142:int;
      
      private var var_2141:int;
      
      private var var_737:Boolean;
      
      private var var_2018:Boolean;
      
      private var var_411:int;
      
      private var var_1209:String;
      
      private var var_1925:int;
      
      private var var_1227:int;
      
      private var _ownerName:String;
      
      private var var_701:String;
      
      private var var_2139:int;
      
      private var var_2138:RoomThumbnailData;
      
      private var var_1929:Boolean;
      
      private var var_638:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         var_638 = new Array();
         super();
         var_411 = param1.readInteger();
         var_737 = param1.readBoolean();
         var_701 = param1.readString();
         _ownerName = param1.readString();
         var_1925 = param1.readInteger();
         var_2030 = param1.readInteger();
         var_2139 = param1.readInteger();
         var_1209 = param1.readString();
         var_2142 = param1.readInteger();
         var_1929 = param1.readBoolean();
         var_2141 = param1.readInteger();
         var_1227 = param1.readInteger();
         var_2140 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            var_638.push(_loc4_);
            _loc3_++;
         }
         var_2138 = new RoomThumbnailData(param1);
         var_2018 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return var_2139;
      }
      
      public function get roomName() : String
      {
         return var_701;
      }
      
      public function get userCount() : int
      {
         return var_2030;
      }
      
      public function get score() : int
      {
         return var_2141;
      }
      
      public function get eventCreationTime() : String
      {
         return var_2140;
      }
      
      public function get allowTrading() : Boolean
      {
         return var_1929;
      }
      
      public function get tags() : Array
      {
         return var_638;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2018;
      }
      
      public function get event() : Boolean
      {
         return var_737;
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
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get categoryId() : int
      {
         return var_1227;
      }
      
      public function get srchSpecPrm() : int
      {
         return var_2142;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return var_2138;
      }
      
      public function get method_1() : int
      {
         return var_1925;
      }
      
      public function get flatId() : int
      {
         return var_411;
      }
      
      public function get description() : String
      {
         return var_1209;
      }
   }
}
