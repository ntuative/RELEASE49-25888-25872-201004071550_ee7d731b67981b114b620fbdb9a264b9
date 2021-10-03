package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToHeight implements BinarySearchTest
   {
       
      
      private var var_167:String;
      
      private var var_407:int;
      
      private var var_207:ITextWindow;
      
      public function CutToHeight()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         var_167 = param1;
         var_207 = param2;
         var_407 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         var_207.text = var_167.substring(0,param1) + "...";
         return var_207.textHeight > var_407;
      }
   }
}
