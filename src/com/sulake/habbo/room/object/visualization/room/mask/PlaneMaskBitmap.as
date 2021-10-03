package com.sulake.habbo.room.object.visualization.room.mask
{
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   
   public class PlaneMaskBitmap
   {
      
      public static const const_49:Number = -1;
      
      public static const MAX_NORMAL_COORDINATE_VALUE:Number = 1;
       
      
      private var _normalMaxX:Number = 1;
      
      private var var_1675:Number = -1;
      
      private var var_911:IGraphicAsset = null;
      
      private var var_1673:Number = 1;
      
      private var var_1674:Number = -1;
      
      public function PlaneMaskBitmap(param1:IGraphicAsset, param2:Number = -1, param3:Number = 1, param4:Number = -1, param5:Number = 1)
      {
         super();
         var_1675 = param2;
         _normalMaxX = param3;
         var_1674 = param4;
         var_1673 = param5;
         var_911 = param1;
      }
      
      public function get normalMaxY() : Number
      {
         return var_1673;
      }
      
      public function get normalMaxX() : Number
      {
         return _normalMaxX;
      }
      
      public function get normalMinX() : Number
      {
         return var_1675;
      }
      
      public function get normalMinY() : Number
      {
         return var_1674;
      }
      
      public function get asset() : IGraphicAsset
      {
         return var_911;
      }
      
      public function dispose() : void
      {
         var_911 = null;
      }
   }
}
