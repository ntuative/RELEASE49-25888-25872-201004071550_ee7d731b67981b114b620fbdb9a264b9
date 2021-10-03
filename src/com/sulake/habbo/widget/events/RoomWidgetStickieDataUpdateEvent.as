package com.sulake.habbo.widget.events
{
   public class RoomWidgetStickieDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_592:String = "RWSDUE_STICKIE_DATA";
       
      
      private var var_207:String;
      
      private var var_653:String;
      
      private var var_1413:String;
      
      private var var_157:int = -1;
      
      private var var_47:Boolean;
      
      public function RoomWidgetStickieDataUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:String, param6:Boolean, param7:Boolean = false, param8:Boolean = false)
      {
         super(param1,param7,param8);
         var_157 = param2;
         var_1413 = param3;
         var_207 = param4;
         var_653 = param5;
         var_47 = param6;
      }
      
      public function get objectType() : String
      {
         return var_1413;
      }
      
      public function get colorHex() : String
      {
         return var_653;
      }
      
      public function get text() : String
      {
         return var_207;
      }
      
      public function get objectId() : int
      {
         return var_157;
      }
      
      public function get controller() : Boolean
      {
         return var_47;
      }
   }
}
