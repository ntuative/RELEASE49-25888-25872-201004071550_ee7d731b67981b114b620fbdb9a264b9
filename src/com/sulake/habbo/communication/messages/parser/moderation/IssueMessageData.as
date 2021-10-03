package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_135:int = 1;
      
      public static const const_1165:int = 3;
      
      public static const const_408:int = 2;
       
      
      private var var_1954:int;
      
      private var var_1733:int;
      
      private var var_1948:int;
      
      private var var_1732:int;
      
      private var var_31:int;
      
      private var var_411:int;
      
      private var var_1128:int;
      
      private var var_1875:int;
      
      private var var_997:int;
      
      private var _roomResources:String;
      
      private var var_1670:int;
      
      private var var_1951:int;
      
      private var var_1952:String;
      
      private var var_1876:String;
      
      private var var_1955:int = 0;
      
      private var var_1193:String;
      
      private var _message:String;
      
      private var var_1949:int;
      
      private var var_1953:String;
      
      private var var_1227:int;
      
      private var var_701:String;
      
      private var var_1950:String;
      
      private var var_1470:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         var_997 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         var_1955 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return var_1951;
      }
      
      public function set roomName(param1:String) : void
      {
         var_701 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         var_1670 = param1;
      }
      
      public function get state() : int
      {
         return var_31;
      }
      
      public function get roomResources() : String
      {
         return _roomResources;
      }
      
      public function set roomResources(param1:String) : void
      {
         _roomResources = param1;
      }
      
      public function get roomName() : String
      {
         return var_701;
      }
      
      public function get message() : String
      {
         return _message;
      }
      
      public function set worldId(param1:int) : void
      {
         var_1732 = param1;
      }
      
      public function set state(param1:int) : void
      {
         var_31 = param1;
      }
      
      public function get unitPort() : int
      {
         return var_1733;
      }
      
      public function get priority() : int
      {
         return var_1954 + var_1955;
      }
      
      public function set issueId(param1:int) : void
      {
         var_1875 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return var_1876;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - var_1470) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return var_1227;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         var_1951 = param1;
      }
      
      public function get roomType() : int
      {
         return var_1128;
      }
      
      public function set flatType(param1:String) : void
      {
         var_1952 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return var_1670;
      }
      
      public function set message(param1:String) : void
      {
         _message = param1;
      }
      
      public function get worldId() : int
      {
         return var_1732;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         var_1950 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         var_1193 = param1;
      }
      
      public function get issueId() : int
      {
         return var_1875;
      }
      
      public function set priority(param1:int) : void
      {
         var_1954 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         var_1733 = param1;
      }
      
      public function get flatType() : String
      {
         return var_1952;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         var_1948 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         var_1876 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         var_1949 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return var_1193;
      }
      
      public function set roomType(param1:int) : void
      {
         var_1128 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return var_1948;
      }
      
      public function set flatId(param1:int) : void
      {
         var_411 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1227 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         var_1470 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return var_1949;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         var_1953 = param1;
      }
      
      public function get timeStamp() : int
      {
         return var_1470;
      }
      
      public function get reportedUserId() : int
      {
         return var_997;
      }
      
      public function get flatId() : int
      {
         return var_411;
      }
      
      public function get flatOwnerName() : String
      {
         return var_1950;
      }
      
      public function get reporterUserName() : String
      {
         return var_1953;
      }
   }
}
