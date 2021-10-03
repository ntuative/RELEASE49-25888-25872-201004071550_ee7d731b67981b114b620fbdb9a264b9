package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1502:int = 9;
      
      public static const const_1548:int = 4;
      
      public static const const_1477:int = 1;
      
      public static const const_1366:int = 10;
      
      public static const const_1626:int = 2;
      
      public static const const_1241:int = 7;
      
      public static const const_1273:int = 11;
      
      public static const const_1544:int = 3;
      
      public static const const_1177:int = 8;
      
      public static const const_1185:int = 5;
      
      public static const const_1595:int = 6;
      
      public static const const_1261:int = 12;
       
      
      private var var_2120:String;
      
      private var _roomId:int;
      
      private var var_1120:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_2120;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1120 = param1.readInteger();
         var_2120 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1120;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}
