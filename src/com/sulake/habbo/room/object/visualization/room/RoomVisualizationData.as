package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_446:FloorRasterizer;
      
      private var var_813:Boolean = false;
      
      private var var_631:PlaneMaskManager;
      
      private var var_447:WallRasterizer;
      
      private var var_630:WallAdRasterizer;
      
      private var var_448:LandscapeRasterizer;
      
      public function RoomVisualizationData()
      {
         super();
         var_447 = new WallRasterizer();
         var_446 = new FloorRasterizer();
         var_630 = new WallAdRasterizer();
         var_448 = new LandscapeRasterizer();
         var_631 = new PlaneMaskManager();
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return var_447;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return var_630;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return var_446;
      }
      
      public function get initialized() : Boolean
      {
         return var_813;
      }
      
      protected function reset() : void
      {
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return var_631;
      }
      
      public function dispose() : void
      {
         if(var_447 != null)
         {
            var_447.dispose();
            var_447 = null;
         }
         if(var_446 != null)
         {
            var_446.dispose();
            var_446 = null;
         }
         if(var_630 != null)
         {
            var_630.dispose();
            var_630 = null;
         }
         if(var_448 != null)
         {
            var_448.dispose();
            var_448 = null;
         }
         if(var_631 != null)
         {
            var_631.dispose();
            var_631 = null;
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            var_447.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            var_446.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            var_630.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            var_448.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            var_631.initialize(_loc11_);
         }
         return true;
      }
      
      public function clearCache() : void
      {
         if(var_447 != null)
         {
            var_447.clearCache();
         }
         if(var_446 != null)
         {
            var_446.clearCache();
         }
         if(var_448 != null)
         {
            var_448.clearCache();
         }
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return var_448;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(var_813)
         {
            return;
         }
         var_447.initializeAssetCollection(param1);
         var_446.initializeAssetCollection(param1);
         var_630.initializeAssetCollection(param1);
         var_448.initializeAssetCollection(param1);
         var_631.initializeAssetCollection(param1);
         var_813 = true;
      }
   }
}
