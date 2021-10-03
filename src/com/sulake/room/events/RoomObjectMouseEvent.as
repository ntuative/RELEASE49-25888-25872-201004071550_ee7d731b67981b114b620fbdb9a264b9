package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1456:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1618:String = "ROE_MOUSE_ENTER";
      
      public static const const_424:String = "ROE_MOUSE_MOVE";
      
      public static const const_1492:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const const_209:String = "ROE_MOUSE_CLICK";
      
      public static const ROOM_OBJECT_MOUSE_DOWN:String = "ROE_MOUSE_DOWN";
       
      
      private var var_1921:Boolean;
      
      private var var_1916:Boolean;
      
      private var var_1919:Boolean;
      
      private var var_1917:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false)
      {
         super(param1,param2,param3,param8,param9);
         var_1919 = param4;
         var_1917 = param5;
         var_1921 = param6;
         var_1916 = param7;
      }
      
      public function get buttonDown() : Boolean
      {
         return var_1916;
      }
      
      public function get altKey() : Boolean
      {
         return var_1919;
      }
      
      public function get ctrlKey() : Boolean
      {
         return var_1917;
      }
      
      public function get shiftKey() : Boolean
      {
         return var_1921;
      }
   }
}
