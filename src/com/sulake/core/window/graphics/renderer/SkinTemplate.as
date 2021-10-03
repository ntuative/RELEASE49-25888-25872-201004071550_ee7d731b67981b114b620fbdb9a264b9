package com.sulake.core.window.graphics.renderer
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.window.utils.ChildEntityArray;
   
   public class SkinTemplate extends ChildEntityArray implements ISkinTemplate
   {
       
      
      protected var _name:String;
      
      protected var var_911:IAsset;
      
      protected var var_638:Array;
      
      public function SkinTemplate(param1:String, param2:IAsset)
      {
         super();
         _name = param1;
         var_638 = new Array();
         var_911 = param2;
      }
      
      public function get tags() : Array
      {
         return var_638;
      }
      
      public function get id() : uint
      {
         return 0;
      }
      
      public function dispose() : void
      {
         var _loc2_:int = 0;
         var _loc1_:uint = this.numChildren;
         _loc2_ = 0;
         while(_loc2_ < _loc1_)
         {
            this.removeChildAt(0);
            _loc2_++;
         }
         var_911 = null;
         var_638 = null;
         _name = null;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get asset() : IAsset
      {
         return var_911;
      }
   }
}
