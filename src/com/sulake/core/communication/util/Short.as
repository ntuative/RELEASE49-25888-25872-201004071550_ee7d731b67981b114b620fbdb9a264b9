package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_683:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_683 = new ByteArray();
         var_683.writeShort(param1);
         var_683.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_683.position = 0;
         if(false)
         {
            _loc1_ = var_683.readShort();
            var_683.position = 0;
         }
         return _loc1_;
      }
   }
}
