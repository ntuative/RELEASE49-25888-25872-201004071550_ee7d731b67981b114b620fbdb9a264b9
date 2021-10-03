package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1042:int = 31;
      
      private static const const_1041:int = 32;
      
      private static const const_752:int = 10;
      
      private static const const_484:int = 20;
       
      
      private var var_628:Boolean = false;
      
      private var var_216:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_216 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_628 = true;
            var_216 = new Array();
            var_216.push(const_1042);
            var_216.push(const_1041);
            return;
         }
         if(param1 > 0 && param1 <= const_752)
         {
            if(var_628)
            {
               var_628 = false;
               var_216 = new Array();
               var_216.push(const_752 + param1);
               var_216.push(const_484 + param1);
               var_216.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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
