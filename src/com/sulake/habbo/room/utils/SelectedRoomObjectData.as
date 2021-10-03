package com.sulake.habbo.room.utils
{
   import com.sulake.habbo.room.ISelectedRoomObjectData;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class SelectedRoomObjectData implements ISelectedRoomObjectData
   {
       
      
      private var var_71:Vector3d = null;
      
      private var _id:int = 0;
      
      private var var_235:Vector3d = null;
      
      private var var_2073:int = 0;
      
      private var var_2159:String = null;
      
      private var _category:int = 0;
      
      private var var_2160:String = "";
      
      public function SelectedRoomObjectData(param1:int, param2:int, param3:String, param4:IVector3d, param5:IVector3d, param6:int = 0, param7:String = null)
      {
         super();
         _id = param1;
         _category = param2;
         var_2160 = param3;
         var_71 = new Vector3d();
         var_71.assign(param4);
         var_235 = new Vector3d();
         var_235.assign(param5);
         var_2073 = param6;
         var_2159 = param7;
      }
      
      public function get loc() : Vector3d
      {
         return var_71;
      }
      
      public function get typeId() : int
      {
         return var_2073;
      }
      
      public function get dir() : Vector3d
      {
         return var_235;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get instanceData() : String
      {
         return var_2159;
      }
      
      public function get operation() : String
      {
         return var_2160;
      }
      
      public function dispose() : void
      {
         var_71 = null;
         var_235 = null;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
