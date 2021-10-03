package com.sulake.habbo.widget.events
{
   public class RoomWidgetDimmerStateUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_65:String = "RWDSUE_DIMMER_STATE";
       
      
      private var var_993:int;
      
      private var _color:uint;
      
      private var var_992:int;
      
      private var var_2166:int;
      
      private var var_31:int;
      
      public function RoomWidgetDimmerStateUpdateEvent(param1:int, param2:int, param3:int, param4:uint, param5:uint, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_65,param6,param7);
         var_31 = param1;
         var_2166 = param2;
         var_993 = param3;
         _color = param4;
         var_992 = param5;
      }
      
      public function get brightness() : uint
      {
         return var_992;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectId() : int
      {
         return var_993;
      }
      
      public function get state() : int
      {
         return var_31;
      }
      
      public function get presetId() : int
      {
         return var_2166;
      }
   }
}
