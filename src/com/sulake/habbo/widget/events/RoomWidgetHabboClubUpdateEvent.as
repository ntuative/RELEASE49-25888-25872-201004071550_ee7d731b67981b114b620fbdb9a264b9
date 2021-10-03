package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_206:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2070:Boolean = false;
      
      private var var_2069:int = 0;
      
      private var var_2071:int = 0;
      
      private var var_1664:int;
      
      private var var_2072:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_206,param6,param7);
         var_2072 = param1;
         var_2071 = param2;
         var_2069 = param3;
         var_2070 = param4;
         var_1664 = param5;
      }
      
      public function get clubLevel() : int
      {
         return var_1664;
      }
      
      public function get pastPeriods() : int
      {
         return var_2069;
      }
      
      public function get periodsLeft() : int
      {
         return var_2071;
      }
      
      public function get daysLeft() : int
      {
         return var_2072;
      }
      
      public function get allowClubDances() : Boolean
      {
         return var_2070;
      }
   }
}
