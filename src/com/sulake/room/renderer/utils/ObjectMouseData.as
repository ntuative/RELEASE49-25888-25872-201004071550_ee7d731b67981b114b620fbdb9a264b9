package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_1771:String = "";
      
      private var var_157:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function set spriteTag(param1:String) : void
      {
         var_1771 = param1;
      }
      
      public function set objectId(param1:String) : void
      {
         var_157 = param1;
      }
      
      public function get spriteTag() : String
      {
         return var_1771;
      }
      
      public function get objectId() : String
      {
         return var_157;
      }
   }
}
