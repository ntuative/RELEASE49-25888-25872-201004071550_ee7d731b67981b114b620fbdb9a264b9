package com.sulake.room.messages
{
   import com.sulake.room.utils.IVector3d;
   
   public class RoomObjectUpdateMessage
   {
       
      
      protected var var_71:IVector3d;
      
      protected var var_235:IVector3d;
      
      public function RoomObjectUpdateMessage(param1:IVector3d, param2:IVector3d)
      {
         super();
         var_71 = param1;
         var_235 = param2;
      }
      
      public function get loc() : IVector3d
      {
         return var_71;
      }
      
      public function get dir() : IVector3d
      {
         return var_235;
      }
   }
}
