package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_1015:Boolean;
      
      private var _name:String;
      
      private var var_2109:String;
      
      private var var_1016:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_2109 = String(param1.@link);
         var_1016 = Boolean(parseInt(param1.@fliph));
         var_1015 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_1016;
      }
      
      public function get flipV() : Boolean
      {
         return var_1015;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_2109;
      }
   }
}
