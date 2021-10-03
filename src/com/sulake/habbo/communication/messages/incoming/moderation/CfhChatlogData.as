package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CfhChatlogData
   {
       
      
      private var var_1670:int;
      
      private var var_997:int;
      
      private var var_1669:int;
      
      private var var_1412:int;
      
      private var var_114:RoomChatlogData;
      
      public function CfhChatlogData(param1:IMessageDataWrapper)
      {
         super();
         var_1412 = param1.readInteger();
         var_1669 = param1.readInteger();
         var_997 = param1.readInteger();
         var_1670 = param1.readInteger();
         var_114 = new RoomChatlogData(param1);
         Logger.log("READ CFHCHATLOGDATA: callId: " + var_1412);
      }
      
      public function get chatRecordId() : int
      {
         return var_1670;
      }
      
      public function get reportedUserId() : int
      {
         return var_997;
      }
      
      public function get callerUserId() : int
      {
         return var_1669;
      }
      
      public function get callId() : int
      {
         return var_1412;
      }
      
      public function get room() : RoomChatlogData
      {
         return var_114;
      }
   }
}
