package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2173:int;
      
      private var var_412:Boolean;
      
      private var var_2174:Boolean;
      
      private var var_897:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2174 = param1.readBoolean();
         if(var_2174)
         {
            var_2173 = param1.readInteger();
            var_412 = param1.readBoolean();
         }
         else
         {
            var_897 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_897 != null)
         {
            var_897.dispose();
            var_897 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_2173;
      }
      
      public function get owner() : Boolean
      {
         return var_412;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_2174;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_897;
      }
   }
}
