package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1840:String;
      
      private var var_831:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_1840 = param1;
         var_831 = param2;
      }
      
      public function get postureType() : String
      {
         return var_1840;
      }
      
      public function get parameter() : String
      {
         return var_831;
      }
   }
}
