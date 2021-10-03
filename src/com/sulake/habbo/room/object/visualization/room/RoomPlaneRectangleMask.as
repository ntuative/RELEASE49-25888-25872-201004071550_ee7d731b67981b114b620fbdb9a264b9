package com.sulake.habbo.room.object.visualization.room
{
   public class RoomPlaneRectangleMask
   {
       
      
      private var var_1938:Number = 0;
      
      private var var_1939:Number = 0;
      
      private var var_1940:Number = 0;
      
      private var var_1941:Number = 0;
      
      public function RoomPlaneRectangleMask(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1939 = param1;
         var_1940 = param2;
         var_1938 = param3;
         var_1941 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1939;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1938;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1940;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1941;
      }
   }
}
