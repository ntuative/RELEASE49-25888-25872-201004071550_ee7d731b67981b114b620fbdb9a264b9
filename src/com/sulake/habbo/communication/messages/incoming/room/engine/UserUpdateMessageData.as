package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var _y:Number = 0;
      
      private var var_84:Number = 0;
      
      private var var_235:int = 0;
      
      private var var_1957:int = 0;
      
      private var var_2165:Number = 0;
      
      private var var_2161:Number = 0;
      
      private var var_2163:Number = 0;
      
      private var var_2164:Number = 0;
      
      private var var_2162:Boolean = false;
      
      private var var_85:Number = 0;
      
      private var _id:int = 0;
      
      private var var_194:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         var_194 = [];
         super();
         _id = param1;
         var_85 = param2;
         _y = param3;
         var_84 = param4;
         var_2164 = param5;
         var_235 = param6;
         var_1957 = param7;
         var_2165 = param8;
         var_2161 = param9;
         var_2163 = param10;
         var_2162 = param11;
         var_194 = param12;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function get dir() : int
      {
         return var_235;
      }
      
      public function get localZ() : Number
      {
         return var_2164;
      }
      
      public function get isMoving() : Boolean
      {
         return var_2162;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get dirHead() : int
      {
         return var_1957;
      }
      
      public function get targetX() : Number
      {
         return var_2165;
      }
      
      public function get targetY() : Number
      {
         return var_2161;
      }
      
      public function get targetZ() : Number
      {
         return var_2163;
      }
      
      public function get x() : Number
      {
         return var_85;
      }
      
      public function get actions() : Array
      {
         return var_194.slice();
      }
   }
}
