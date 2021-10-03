package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_498:int = 2;
      
      public static const const_913:int = 6;
      
      public static const const_731:int = 1;
      
      public static const const_708:int = 3;
      
      public static const const_1001:int = 4;
      
      public static const const_499:int = 5;
       
      
      private var var_2088:String;
      
      private var var_1012:int;
      
      private var var_1772:String;
      
      private var _type:int;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         _type = param1;
         var_1012 = param2;
         var_1772 = param3;
         var_2088 = param4;
      }
      
      public function get time() : String
      {
         return var_2088;
      }
      
      public function get senderId() : int
      {
         return var_1012;
      }
      
      public function get messageText() : String
      {
         return var_1772;
      }
      
      public function get type() : int
      {
         return _type;
      }
   }
}
