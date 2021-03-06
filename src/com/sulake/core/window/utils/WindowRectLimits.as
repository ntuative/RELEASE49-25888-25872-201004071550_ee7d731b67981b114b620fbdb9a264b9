package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindow;
   
   public class WindowRectLimits implements IRectLimiter
   {
       
      
      private var var_408:int = -2147483648;
      
      private var var_409:int = 2147483647;
      
      private var var_407:int = 2147483647;
      
      private var _target:IWindow;
      
      private var var_410:int = -2147483648;
      
      public function WindowRectLimits(param1:IWindow)
      {
         super();
         _target = param1;
      }
      
      public function get maxWidth() : int
      {
         return var_409;
      }
      
      public function get isEmpty() : Boolean
      {
         return var_410 == int.MIN_VALUE && var_409 == int.MAX_VALUE && var_408 == int.MIN_VALUE && var_407 == int.MAX_VALUE;
      }
      
      public function set maxWidth(param1:int) : void
      {
         var_409 = param1;
         if(var_409 < int.MAX_VALUE && true && _target.width > var_409)
         {
            _target.width = var_409;
         }
      }
      
      public function setEmpty() : void
      {
         var_410 = int.MIN_VALUE;
         var_409 = int.MAX_VALUE;
         var_408 = int.MIN_VALUE;
         var_407 = int.MAX_VALUE;
      }
      
      public function set maxHeight(param1:int) : void
      {
         var_407 = param1;
         if(var_407 < int.MAX_VALUE && true && _target.height > var_407)
         {
            _target.height = var_407;
         }
      }
      
      public function get minHeight() : int
      {
         return var_408;
      }
      
      public function get minWidth() : int
      {
         return var_410;
      }
      
      public function clone(param1:IWindow) : WindowRectLimits
      {
         var _loc2_:WindowRectLimits = new WindowRectLimits(param1);
         _loc2_.var_410 = var_410;
         _loc2_.var_409 = var_409;
         _loc2_.var_408 = var_408;
         _loc2_.var_407 = var_407;
         return _loc2_;
      }
      
      public function set minWidth(param1:int) : void
      {
         var_410 = param1;
         if(var_410 > int.MIN_VALUE && true && _target.width < var_410)
         {
            _target.width = var_410;
         }
      }
      
      public function set minHeight(param1:int) : void
      {
         var_408 = param1;
         if(var_408 > int.MIN_VALUE && true && _target.height < var_408)
         {
            _target.height = var_408;
         }
      }
      
      public function get maxHeight() : int
      {
         return var_407;
      }
   }
}
