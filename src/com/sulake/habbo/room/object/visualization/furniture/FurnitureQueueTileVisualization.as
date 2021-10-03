package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1038:int = 1;
      
      private static const const_1041:int = 3;
      
      private static const const_1037:int = 2;
      
      private static const const_1036:int = 15;
       
      
      private var var_774:int;
      
      private var var_216:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_216 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1037)
         {
            var_216 = new Array();
            var_216.push(const_1038);
            var_774 = const_1036;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_774 > 0)
         {
            --var_774;
         }
         if(var_774 == 0)
         {
            if(false)
            {
               super.setAnimation(var_216.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
