package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_1916:Boolean = false;
      
      private var var_1919:Boolean = false;
      
      private var var_1771:String = "";
      
      private var _type:String = "";
      
      private var var_1921:Boolean = false;
      
      private var var_1918:Number = 0;
      
      private var var_1923:Number = 0;
      
      private var var_1922:Number = 0;
      
      private var var_1924:String = "";
      
      private var var_1920:Number = 0;
      
      private var var_1917:Boolean = false;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:Number, param5:Number, param6:Number = 0, param7:Number = 0, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false)
      {
         super();
         _type = param1;
         var_1924 = param2;
         var_1771 = param3;
         var_1923 = param4;
         var_1922 = param5;
         var_1918 = param6;
         var_1920 = param7;
         var_1917 = param8;
         var_1919 = param9;
         var_1921 = param10;
         var_1916 = param11;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1917;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1916;
      }
      
      public function get localX() : Number
      {
         return var_1918;
      }
      
      public function get localY() : Number
      {
         return var_1920;
      }
      
      public function get canvasId() : String
      {
         return var_1924;
      }
      
      public function get altKey() : Boolean
      {
         return var_1919;
      }
      
      public function get spriteTag() : String
      {
         return var_1771;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get screenX() : Number
      {
         return var_1923;
      }
      
      public function get screenY() : Number
      {
         return var_1922;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1921;
      }
   }
}
