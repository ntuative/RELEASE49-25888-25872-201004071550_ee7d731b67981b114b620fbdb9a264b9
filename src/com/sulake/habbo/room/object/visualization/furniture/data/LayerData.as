package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_391:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_433:int = 0;
      
      public static const const_921:int = 2;
      
      public static const const_962:int = 1;
      
      public static const const_631:Boolean = false;
      
      public static const const_527:String = "";
      
      public static const const_400:int = 0;
      
      public static const const_428:int = 0;
      
      public static const const_445:int = 0;
       
      
      private var var_1969:int = 0;
      
      private var var_1972:String = "";
      
      private var var_1574:int = 0;
      
      private var var_1970:int = 0;
      
      private var var_1974:Number = 0;
      
      private var var_1973:int = 255;
      
      private var var_1971:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1969;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1574 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1974;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1970 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1969 = param1;
      }
      
      public function get tag() : String
      {
         return var_1972;
      }
      
      public function get alpha() : int
      {
         return var_1973;
      }
      
      public function get ink() : int
      {
         return var_1574;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1974 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1970;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1971 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1971;
      }
      
      public function set tag(param1:String) : void
      {
         var_1972 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1973 = param1;
      }
   }
}
