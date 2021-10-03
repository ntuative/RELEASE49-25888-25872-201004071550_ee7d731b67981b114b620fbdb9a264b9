package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var _removeSetType:String;
      
      private var var_1396:int = -1;
      
      private var var_1122:Boolean;
      
      private var var_1123:String;
      
      private var var_1632:String;
      
      public function PartDefinition(param1:XML)
      {
         super();
         var_1632 = String(param1["set-type"]);
         var_1123 = String(param1["flipped-set-type"]);
         _removeSetType = String(param1["remove-set-type"]);
         var_1122 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return var_1396 >= 0;
      }
      
      public function get flippedSetType() : String
      {
         return var_1123;
      }
      
      public function get staticId() : int
      {
         return var_1396;
      }
      
      public function set staticId(param1:int) : void
      {
         var_1396 = param1;
      }
      
      public function get appendToFigure() : Boolean
      {
         return var_1122;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         var_1122 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         var_1123 = param1;
      }
      
      public function get setType() : String
      {
         return var_1632;
      }
      
      public function get removeSetType() : String
      {
         return _removeSetType;
      }
   }
}
