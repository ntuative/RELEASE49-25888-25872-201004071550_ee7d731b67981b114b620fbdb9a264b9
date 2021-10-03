package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_308:String;
      
      private var var_1228:String;
      
      private var var_1226:String;
      
      private var var_1227:int;
      
      private var var_693:int;
      
      private var var_1229:String;
      
      private var _name:String;
      
      private var var_1124:Boolean;
      
      private var var_760:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_693 = param1.readInteger();
         this.var_760 = param1.readBoolean();
         this.var_1124 = param1.readBoolean();
         this.var_308 = param1.readString();
         this.var_1227 = param1.readInteger();
         this.var_1226 = param1.readString();
         this.var_1228 = param1.readString();
         this.var_1229 = param1.readString();
      }
      
      public function get gender() : int
      {
         return var_693;
      }
      
      public function get realName() : String
      {
         return var_1229;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1226;
      }
      
      public function get categoryId() : int
      {
         return var_1227;
      }
      
      public function get online() : Boolean
      {
         return var_760;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1124;
      }
      
      public function get lastAccess() : String
      {
         return var_1228;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_308;
      }
   }
}
