package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDimmerSavePresetMessage extends RoomWidgetMessage
   {
      
      public static const const_511:String = "RWSDPM_SAVE_PRESET";
       
      
      private var _color:uint;
      
      private var var_1633:int;
      
      private var var_1636:int;
      
      private var var_1657:Boolean;
      
      private var var_992:int;
      
      public function RoomWidgetDimmerSavePresetMessage(param1:int, param2:int, param3:uint, param4:int, param5:Boolean)
      {
         super(const_511);
         var_1636 = param1;
         var_1633 = param2;
         _color = param3;
         var_992 = param4;
         var_1657 = param5;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get effectTypeId() : int
      {
         return var_1633;
      }
      
      public function get presetNumber() : int
      {
         return var_1636;
      }
      
      public function get brightness() : int
      {
         return var_992;
      }
      
      public function get apply() : Boolean
      {
         return var_1657;
      }
   }
}
