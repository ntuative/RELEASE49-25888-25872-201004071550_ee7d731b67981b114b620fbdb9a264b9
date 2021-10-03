package com.sulake.habbo.widget.events
{
   public class RoomWidgetUserTagsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_148:String = "RWUTUE_USER_TAGS";
       
      
      private var _userId:int;
      
      private var var_638:Array;
      
      private var var_1672:Boolean;
      
      public function RoomWidgetUserTagsUpdateEvent(param1:int, param2:Array, param3:Boolean, param4:Boolean = false, param5:Boolean = false)
      {
         super(const_148,param4,param5);
         _userId = param1;
         var_638 = param2;
         var_1672 = param3;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get tags() : Array
      {
         return var_638;
      }
      
      public function get isOwnUser() : Boolean
      {
         return var_1672;
      }
   }
}
