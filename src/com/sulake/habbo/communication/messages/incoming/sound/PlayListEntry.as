package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1945:int;
      
      private var var_1946:int = 0;
      
      private var var_1943:String;
      
      private var var_1947:int;
      
      private var var_1944:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         var_1945 = param1;
         var_1947 = param2;
         var_1944 = param3;
         var_1943 = param4;
      }
      
      public function get length() : int
      {
         return var_1947;
      }
      
      public function get name() : String
      {
         return var_1944;
      }
      
      public function get creator() : String
      {
         return var_1943;
      }
      
      public function get startPlayHeadPos() : int
      {
         return var_1946;
      }
      
      public function get id() : int
      {
         return var_1945;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         var_1946 = param1;
      }
   }
}
