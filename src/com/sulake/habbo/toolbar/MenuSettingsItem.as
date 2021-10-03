package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1887:Array;
      
      private var var_1890:String;
      
      private var var_1888:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1890 = param1;
         var_1887 = param2;
         var_1888 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1890;
      }
      
      public function get yieldList() : Array
      {
         return var_1887;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1888;
      }
   }
}
