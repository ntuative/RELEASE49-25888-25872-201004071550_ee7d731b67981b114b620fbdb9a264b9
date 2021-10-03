package com.sulake.habbo.inventory.furni
{
   import flash.display.BitmapData;
   
   public class FurniItem
   {
       
      
      private var _isSelected:Boolean = false;
      
      private var var_1623:int;
      
      private var var_1626:Boolean;
      
      private var var_1945:int;
      
      private var var_1390:String;
      
      private var var_2029:Boolean = false;
      
      private var var_1627:int;
      
      private var var_451:int;
      
      private var var_1059:String;
      
      private var var_1499:String;
      
      private var _image:BitmapData;
      
      private var _objId:int;
      
      private var var_1198:int;
      
      private var var_1622:Boolean;
      
      private var var_2028:int;
      
      public function FurniItem(param1:int, param2:String, param3:int, param4:int, param5:String, param6:Boolean, param7:Boolean, param8:int, param9:String, param10:int)
      {
         super();
         var_1623 = param1;
         var_1059 = param2;
         _objId = param3;
         var_1198 = param4;
         var_1390 = param5;
         var_1626 = param6;
         var_1622 = param7;
         var_1627 = param8;
         var_1499 = param9;
         var_1945 = param10;
         var_451 = -1;
      }
      
      public function get songId() : int
      {
         return var_1945;
      }
      
      public function get iconCallbackId() : int
      {
         return var_451;
      }
      
      public function get expiryTime() : int
      {
         return var_1627;
      }
      
      public function set prevCallbackId(param1:int) : void
      {
         var_2028 = param1;
      }
      
      public function set isLocked(param1:Boolean) : void
      {
         var_2029 = param1;
      }
      
      public function set iconCallbackId(param1:int) : void
      {
         var_451 = param1;
      }
      
      public function get isTradeable() : Boolean
      {
         return var_1622;
      }
      
      public function get slotId() : String
      {
         return var_1499;
      }
      
      public function get classId() : int
      {
         return var_1198;
      }
      
      public function get isRecyclable() : Boolean
      {
         return var_1626;
      }
      
      public function get stuffData() : String
      {
         return var_1390;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         _image = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         _isSelected = param1;
      }
      
      public function get stripId() : int
      {
         return var_1623;
      }
      
      public function get isLocked() : Boolean
      {
         return var_2029;
      }
      
      public function get prevCallbackId() : int
      {
         return var_2028;
      }
      
      public function get iconImage() : BitmapData
      {
         return _image;
      }
      
      public function get isSelected() : Boolean
      {
         return _isSelected;
      }
      
      public function get objId() : int
      {
         return _objId;
      }
      
      public function get itemType() : String
      {
         return var_1059;
      }
   }
}
