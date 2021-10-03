package com.sulake.habbo.widget.events
{
   public class RoomWidgetRoomQueueUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_439:String = "RWRQUE_SPECTATOR_QUEUE_STATUS";
      
      public static const const_284:String = "RWRQUE_VISITOR_QUEUE_STATUS";
       
      
      private var var_834:int;
      
      private var var_256:Boolean;
      
      private var var_2197:Boolean;
      
      private var var_1432:Boolean;
      
      public function RoomWidgetRoomQueueUpdateEvent(param1:String, param2:int, param3:Boolean, param4:Boolean, param5:Boolean, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_834 = param2;
         var_2197 = param3;
         var_256 = param4;
         var_1432 = param5;
      }
      
      public function get position() : int
      {
         return var_834;
      }
      
      public function get isActive() : Boolean
      {
         return var_256;
      }
      
      public function get isClubQueue() : Boolean
      {
         return var_1432;
      }
      
      public function get hasHabboClub() : Boolean
      {
         return var_2197;
      }
   }
}
