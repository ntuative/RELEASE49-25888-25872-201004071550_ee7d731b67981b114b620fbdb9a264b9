package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_1879:Number;
      
      private var var_572:Number = 0;
      
      private var var_1878:Number;
      
      private var var_571:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_1879 = param1;
         var_1878 = param2;
      }
      
      public function update() : void
      {
         var_571 += var_1878;
         var_572 += var_571;
         if(var_572 > 0)
         {
            var_572 = 0;
            var_571 = var_1879 * -1 * var_571;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_571 = param1;
         var_572 = 0;
      }
      
      public function get location() : Number
      {
         return var_572;
      }
   }
}
