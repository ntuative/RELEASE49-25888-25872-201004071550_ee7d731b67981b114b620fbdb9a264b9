package com.sulake.habbo.window.utils
{
   class AlertDialogCaption implements ICaption
   {
       
      
      private var var_357:Boolean;
      
      private var var_207:String;
      
      private var var_1338:String;
      
      function AlertDialogCaption(param1:String, param2:String, param3:Boolean)
      {
         super();
         var_207 = param1;
         var_1338 = param2;
         var_357 = param3;
      }
      
      public function get toolTip() : String
      {
         return var_1338;
      }
      
      public function set visible(param1:Boolean) : void
      {
         var_357 = param1;
      }
      
      public function get text() : String
      {
         return var_207;
      }
      
      public function get visible() : Boolean
      {
         return var_357;
      }
      
      public function set toolTip(param1:String) : void
      {
         var_1338 = param1;
      }
      
      public function set text(param1:String) : void
      {
         var_207 = param1;
      }
   }
}
