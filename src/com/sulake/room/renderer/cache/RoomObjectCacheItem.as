package com.sulake.room.renderer.cache
{
   public class RoomObjectCacheItem
   {
       
      
      private var var_572:RoomObjectLocationCacheItem = null;
      
      private var var_176:RoomObjectSortableSpriteCacheItem = null;
      
      public function RoomObjectCacheItem(param1:String)
      {
         super();
         var_572 = new RoomObjectLocationCacheItem(param1);
         var_176 = new RoomObjectSortableSpriteCacheItem();
      }
      
      public function get location() : RoomObjectLocationCacheItem
      {
         return var_572;
      }
      
      public function dispose() : void
      {
         if(var_572 != null)
         {
            var_572.dispose();
            var_572 = null;
         }
         if(var_176 != null)
         {
            var_176.dispose();
            var_176 = null;
         }
      }
      
      public function get sprites() : RoomObjectSortableSpriteCacheItem
      {
         return var_176;
      }
   }
}
