package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.navigator.NavigatorSettingsMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1421:int = 10;
       
      
      private var var_1522:NavigatorSettingsMessageParser;
      
      private var var_1270:int;
      
      private var var_2055:int;
      
      private var var_2054:Boolean;
      
      private var var_1050:Array;
      
      private var var_862:Dictionary;
      
      private var var_1049:Array;
      
      private var var_2320:int;
      
      private var var_2053:int;
      
      private var var_1896:int;
      
      private var var_2057:int;
      
      private var var_591:PublicRoomShortData;
      
      private var var_419:RoomEventData;
      
      private var var_130:MsgWithRequestId;
      
      private var var_2052:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_2056:Boolean;
      
      private var var_196:GuestRoomData;
      
      private var var_709:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         var_1050 = new Array();
         var_1049 = new Array();
         var_862 = new Dictionary();
         super();
         _navigator = param1;
      }
      
      public function get createdFlatId() : int
      {
         return var_2055;
      }
      
      public function get eventMod() : Boolean
      {
         return var_2056;
      }
      
      public function startLoading() : void
      {
         this.var_709 = true;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return false;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         var_2056 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(var_419 != null)
         {
            var_419.dispose();
         }
         var_419 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return var_130 != null && var_130 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return var_130 != null && var_130 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return var_130 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return var_196;
      }
      
      public function get allCategories() : Array
      {
         return var_1050;
      }
      
      public function onRoomExit() : void
      {
         if(var_419 != null)
         {
            var_419.dispose();
            var_419 = null;
         }
         if(var_591 != null)
         {
            var_591.dispose();
            var_591 = null;
         }
         if(var_196 != null)
         {
            var_196.dispose();
            var_196 = null;
         }
         _currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         disposeCurrentMsg();
         var_130 = param1;
         var_709 = false;
      }
      
      public function get settings() : NavigatorSettingsMessageParser
      {
         return var_1522;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         disposeCurrentMsg();
         var_130 = param1;
         var_709 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         var_591 = null;
         var_196 = null;
         _currentRoomOwner = false;
         if(param1.guestRoom)
         {
            _currentRoomOwner = param1.owner;
         }
         else
         {
            var_591 = param1.publicSpace;
            var_419 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return _currentRoomOwner;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2320 = param1.limit;
         this.var_1270 = param1.favouriteRoomIds.length;
         this.var_862 = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this.var_862[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return var_130 as PopularRoomTagsData;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return var_591;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return var_2054;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         disposeCurrentMsg();
         var_130 = param1;
         var_709 = false;
      }
      
      public function set avatarId(param1:int) : void
      {
         var_1896 = param1;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return var_196 != null && _currentRoomOwner;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_709;
      }
      
      public function get visibleCategories() : Array
      {
         return var_1049;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         var_1050 = param1;
         var_1049 = new Array();
         for each(_loc2_ in var_1050)
         {
            if(_loc2_.visible)
            {
               var_1049.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return var_2053;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return var_2057;
      }
      
      public function set settings(param1:NavigatorSettingsMessageParser) : void
      {
         var_1522 = param1;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(var_130 == null)
         {
            return;
         }
         var_130.dispose();
         var_130 = null;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return var_419;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         var_862[param1] = !!param2 ? "yes" : null;
         var_1270 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return var_130 as OfficialRoomsData;
      }
      
      public function get avatarId() : int
      {
         return var_1896;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = 0;
         return false;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return var_130 != null && var_130 as OfficialRoomsData != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         var_2054 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         var_2053 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         var_2052 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(var_196 != null)
         {
            var_196.dispose();
         }
         var_196 = param1;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(var_196 == null)
         {
            return false;
         }
         var _loc1_:int = 0;
         return this.var_1522.homeRoomId == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return var_1270 >= var_2320;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         var_2057 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return var_2052;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return var_196 != null && !_currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         var_2055 = param1;
      }
   }
}
