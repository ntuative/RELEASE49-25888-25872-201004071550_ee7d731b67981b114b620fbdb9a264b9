package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_1390:String;
      
      private var var_1059:String;
      
      private var var_1625:Boolean;
      
      private var var_1422:int;
      
      private var var_1623:int;
      
      private var var_1624:Boolean;
      
      private var var_1499:String = "";
      
      private var var_1626:Boolean;
      
      private var _category:int;
      
      private var _objId:int;
      
      private var var_1198:int;
      
      private var var_1622:Boolean;
      
      private var var_1945:int = -1;
      
      private var var_1627:int;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         var_1623 = param1;
         var_1059 = param2;
         _objId = param3;
         var_1198 = param4;
         _category = param5;
         var_1390 = param6;
         var_1625 = param7;
         var_1626 = param8;
         var_1622 = param9;
         var_1624 = param10;
         var_1627 = param11;
      }
      
      public function get slotId() : String
      {
         return var_1499;
      }
      
      public function get extra() : int
      {
         return var_1422;
      }
      
      public function get classId() : int
      {
         return var_1198;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get isSellable() : Boolean
      {
         return var_1624;
      }
      
      public function get isGroupable() : Boolean
      {
         return var_1625;
      }
      
      public function get stripId() : int
      {
         return var_1623;
      }
      
      public function get stuffData() : String
      {
         return var_1390;
      }
      
      public function get songId() : int
      {
         return var_1945;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         var_1499 = param1;
         var_1422 = param2;
      }
      
      public function get itemType() : String
      {
         return var_1059;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get expiryTime() : int
      {
         return var_1627;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1622;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1626;
      }
   }
}
