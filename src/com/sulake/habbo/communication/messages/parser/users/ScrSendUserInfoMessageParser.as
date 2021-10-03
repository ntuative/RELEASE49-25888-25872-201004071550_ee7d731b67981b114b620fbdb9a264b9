package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_1186:int = 2;
      
      public static const const_1569:int = 1;
       
      
      private var var_1990:int;
      
      private var var_1987:int;
      
      private var var_1989:Boolean;
      
      private var var_1988:int;
      
      private var var_1191:String;
      
      private var var_1986:Boolean;
      
      private var var_1991:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_1987;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1989;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_1991;
      }
      
      public function get memberPeriods() : int
      {
         return var_1988;
      }
      
      public function get productName() : String
      {
         return var_1191;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_1986;
      }
      
      public function get responseType() : int
      {
         return var_1990;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1191 = param1.readString();
         var_1987 = param1.readInteger();
         var_1988 = param1.readInteger();
         var_1991 = param1.readInteger();
         var_1990 = param1.readInteger();
         var_1986 = param1.readBoolean();
         var_1989 = param1.readBoolean();
         return true;
      }
   }
}
