package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_2011:int;
      
      private var var_2008:int;
      
      private var var_2007:int;
      
      private var _userName:String;
      
      private var var_2012:int;
      
      private var var_2010:int;
      
      private var var_2009:int;
      
      private var _userId:int;
      
      private var var_760:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_2010 = param1.readInteger();
         var_2012 = param1.readInteger();
         var_760 = param1.readBoolean();
         var_2007 = param1.readInteger();
         var_2008 = param1.readInteger();
         var_2011 = param1.readInteger();
         var_2009 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_2009;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_760;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_2012;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_2008;
      }
      
      public function get cautionCount() : int
      {
         return var_2011;
      }
      
      public function get cfhCount() : int
      {
         return var_2007;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_2010;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}
