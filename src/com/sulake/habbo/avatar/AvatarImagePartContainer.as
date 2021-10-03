package com.sulake.habbo.avatar
{
   import com.sulake.habbo.avatar.actions.IActionDefinition;
   import com.sulake.habbo.avatar.structure.figure.IPartColor;
   import flash.geom.ColorTransform;
   
   public class AvatarImagePartContainer
   {
       
      
      private var _frames:Array;
      
      private var var_2234:int;
      
      private var var_2232:String;
      
      private var var_1524:IActionDefinition;
      
      private var var_2233:Boolean;
      
      private var _color:IPartColor;
      
      private var var_2231:String;
      
      private var var_2236:String;
      
      private var var_1901:Boolean;
      
      private var var_2235:ColorTransform;
      
      private var var_1666:int;
      
      public function AvatarImagePartContainer(param1:String, param2:String, param3:int, param4:IPartColor, param5:Array, param6:IActionDefinition, param7:Boolean, param8:int, param9:String = "", param10:Boolean = false, param11:Number = 1)
      {
         super();
         var_2232 = param1;
         var_2231 = param2;
         var_2234 = param3;
         _color = param4;
         _frames = param5;
         var_1524 = param6;
         var_1901 = param7;
         var_1666 = param8;
         var_2236 = param9;
         var_2233 = param10;
         var_2235 = new ColorTransform(1,1,1,param11);
      }
      
      public function get isColorable() : Boolean
      {
         return var_1901;
      }
      
      public function get partType() : String
      {
         return var_2231;
      }
      
      public function getFrameIndex(param1:int) : int
      {
         return 0;
      }
      
      public function get paletteMapId() : int
      {
         return var_1666;
      }
      
      public function get isBlendable() : Boolean
      {
         return var_2233;
      }
      
      public function get color() : IPartColor
      {
         return _color;
      }
      
      public function get partId() : int
      {
         return var_2234;
      }
      
      public function get flippedPartType() : String
      {
         return var_2236;
      }
      
      public function get bodyPartId() : String
      {
         return var_2232;
      }
      
      public function get action() : IActionDefinition
      {
         return var_1524;
      }
      
      public function get blendTransform() : ColorTransform
      {
         return var_2235;
      }
   }
}
