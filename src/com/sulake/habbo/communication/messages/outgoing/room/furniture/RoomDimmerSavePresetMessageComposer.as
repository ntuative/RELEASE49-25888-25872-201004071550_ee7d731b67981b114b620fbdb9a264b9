package com.sulake.habbo.communication.messages.outgoing.room.furniture
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RoomDimmerSavePresetMessageComposer implements IMessageComposer
   {
       
      
      private var var_1633:int;
      
      private var var_1636:int;
      
      private var var_1634:Boolean;
      
      private var var_1635:String;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1637:int;
      
      public function RoomDimmerSavePresetMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:Boolean, param6:int = 0, param7:int = 0)
      {
         super();
         _roomId = param6;
         _roomCategory = param7;
         var_1636 = param1;
         var_1633 = param2;
         var_1635 = param3;
         var_1637 = param4;
         var_1634 = param5;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1636,var_1633,var_1635,var_1637,int(var_1634)];
      }
      
      public function dispose() : void
      {
      }
   }
}
