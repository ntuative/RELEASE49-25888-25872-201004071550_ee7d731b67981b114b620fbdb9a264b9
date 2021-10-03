package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1042:int = 31;
      
      private static const const_1041:int = 32;
      
      private static const const_485:int = 30;
      
      private static const const_752:int = 20;
      
      private static const const_484:int = 10;
       
      
      private var var_628:Boolean = false;
      
      private var var_216:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_216 = new Array();
         super();
         super.setAnimation(const_485);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_628 = true;
            var_216 = new Array();
            var_216.push(const_1042);
            var_216.push(const_1041);
            return;
         }
         if(param1 > 0 && param1 <= const_484)
         {
            if(var_628)
            {
               var_628 = false;
               var_216 = new Array();
               if(_direction == 2)
               {
                  var_216.push(const_752 + 5 - param1);
                  var_216.push(const_484 + 5 - param1);
               }
               else
               {
                  var_216.push(const_752 + param1);
                  var_216.push(const_484 + param1);
               }
               var_216.push(const_485);
               return;
            }
            super.setAnimation(const_485);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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
