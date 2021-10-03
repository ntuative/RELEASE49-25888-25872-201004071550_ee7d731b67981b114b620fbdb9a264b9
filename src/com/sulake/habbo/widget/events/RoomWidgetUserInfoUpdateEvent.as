package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_232:String = "RWUIUE_PEER";
      
      public static const const_213:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1394:String = "BOT";
      
      public static const const_858:int = 2;
      
      public static const const_1160:int = 0;
      
      public static const const_874:int = 3;
       
      
      private var var_308:String = "";
      
      private var var_1226:String = "";
      
      private var var_1703:Boolean = false;
      
      private var var_1707:int = 0;
      
      private var var_1708:int = 0;
      
      private var var_1702:Boolean = false;
      
      private var var_1229:String = "";
      
      private var var_1710:Boolean = false;
      
      private var var_867:int = 0;
      
      private var var_1701:Boolean = true;
      
      private var var_1081:int = 0;
      
      private var var_1699:Boolean = false;
      
      private var var_1157:Boolean = false;
      
      private var var_1700:Boolean = false;
      
      private var var_1711:int = 0;
      
      private var var_1698:Boolean = false;
      
      private var _image:BitmapData = null;
      
      private var var_249:Array;
      
      private var var_1155:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1706:int = 0;
      
      private var var_1705:Boolean = false;
      
      private var var_1704:int = 0;
      
      private var var_1709:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         var_249 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return var_1708;
      }
      
      public function set userRoomId(param1:int) : void
      {
         var_1708 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return var_1703;
      }
      
      public function get canBeKicked() : Boolean
      {
         return var_1701;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         var_1701 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         var_1710 = param1;
      }
      
      public function get motto() : String
      {
         return var_1226;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         var_1699 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return var_1157;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         var_1226 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return var_1705;
      }
      
      public function get groupBadgeId() : String
      {
         return var_1709;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         var_1157 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return var_1698;
      }
      
      public function set carryItem(param1:int) : void
      {
         var_1711 = param1;
      }
      
      public function get badges() : Array
      {
         return var_249;
      }
      
      public function get amIController() : Boolean
      {
         return var_1702;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         var_1702 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         var_1705 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         var_1704 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         var_1709 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         var_1229 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return var_1710;
      }
      
      public function set figure(param1:String) : void
      {
         var_308 = param1;
      }
      
      public function get carryItem() : int
      {
         return var_1711;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return var_1155;
      }
      
      public function get isIgnored() : Boolean
      {
         return var_1699;
      }
      
      public function set respectLeft(param1:int) : void
      {
         var_867 = param1;
      }
      
      public function get image() : BitmapData
      {
         return _image;
      }
      
      public function get canTradeReason() : int
      {
         return var_1704;
      }
      
      public function get realName() : String
      {
         return var_1229;
      }
      
      public function get figure() : String
      {
         return var_308;
      }
      
      public function set webID(param1:int) : void
      {
         var_1706 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         var_249 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         var_1700 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         var_1698 = param1;
      }
      
      public function get respectLeft() : int
      {
         return var_867;
      }
      
      public function get webID() : int
      {
         return var_1706;
      }
      
      public function set groupId(param1:int) : void
      {
         var_1081 = param1;
      }
      
      public function get xp() : int
      {
         return var_1707;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         var_1703 = param1;
      }
      
      public function get groupId() : int
      {
         return var_1081;
      }
      
      public function get canTrade() : Boolean
      {
         return var_1700;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         var_1155 = param1;
      }
      
      public function set xp(param1:int) : void
      {
         var_1707 = param1;
      }
   }
}
