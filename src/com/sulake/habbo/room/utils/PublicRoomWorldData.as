package com.sulake.habbo.room.utils
{
   public class PublicRoomWorldData
   {
       
      
      private var var_1725:Number = 1;
      
      private var var_193:Number = 1;
      
      private var var_2202:String = "";
      
      public function PublicRoomWorldData(param1:String, param2:Number, param3:Number)
      {
         super();
         var_2202 = param1;
         var_193 = param2;
         var_1725 = param3;
      }
      
      public function get scale() : Number
      {
         return var_193;
      }
      
      public function get heightScale() : Number
      {
         return var_1725;
      }
   }
}
