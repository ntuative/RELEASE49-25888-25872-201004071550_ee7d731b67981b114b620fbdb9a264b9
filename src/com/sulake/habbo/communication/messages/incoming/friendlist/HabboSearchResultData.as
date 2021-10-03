package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2310:Boolean;
      
      private var var_2312:int;
      
      private var var_2309:Boolean;
      
      private var var_1588:String;
      
      private var var_1229:String;
      
      private var var_1896:int;
      
      private var var_2228:String;
      
      private var var_2311:String;
      
      private var var_2229:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1896 = param1.readInteger();
         this.var_1588 = param1.readString();
         this.var_2228 = param1.readString();
         this.var_2310 = param1.readBoolean();
         this.var_2309 = param1.readBoolean();
         param1.readString();
         this.var_2312 = param1.readInteger();
         this.var_2229 = param1.readString();
         this.var_2311 = param1.readString();
         this.var_1229 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1229;
      }
      
      public function get avatarName() : String
      {
         return this.var_1588;
      }
      
      public function get avatarId() : int
      {
         return this.var_1896;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2310;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2311;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2229;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2309;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2228;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2312;
      }
   }
}
