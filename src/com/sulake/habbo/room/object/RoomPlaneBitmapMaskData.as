package com.sulake.habbo.room.object
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomPlaneBitmapMaskData
   {
      
      public static const const_221:String = "hole";
      
      public static const const_421:String = "window";
       
      
      private var var_71:Vector3d = null;
      
      private var _type:String = null;
      
      private var _category:String = null;
      
      public function RoomPlaneBitmapMaskData(param1:String, param2:IVector3d, param3:String)
      {
         super();
         this.type = param1;
         this.loc = param2;
         this.category = param3;
      }
      
      public function get loc() : IVector3d
      {
         return var_71;
      }
      
      public function set loc(param1:IVector3d) : void
      {
         if(var_71 == null)
         {
            var_71 = new Vector3d();
         }
         var_71.assign(param1);
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function set category(param1:String) : void
      {
         _category = param1;
      }
      
      public function get category() : String
      {
         return _category;
      }
      
      public function dispose() : void
      {
         var_71 = null;
      }
   }
}
