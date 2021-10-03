package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_497:int = -1;
      
      public static const const_799:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_1777:int = -1;
      
      private var var_85:int = 0;
      
      private var var_1168:int = 1;
      
      private var var_811:int = 1;
      
      private var var_1776:Boolean = false;
      
      private var var_1775:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_85 = param2;
         _y = param3;
         var_1776 = param5;
         if(param4 < 0)
         {
            param4 = const_497;
         }
         var_811 = param4;
         var_1168 = param4;
         if(param6 >= 0)
         {
            var_1777 = param6;
            var_1775 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_811 > 0 && param1 > var_811)
         {
            param1 = var_811;
         }
         var_1168 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_811;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_1775;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_811 < 0)
         {
            return const_497;
         }
         return var_1168;
      }
      
      public function get activeSequence() : int
      {
         return var_1777;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_1776;
      }
      
      public function get x() : int
      {
         return var_85;
      }
   }
}
