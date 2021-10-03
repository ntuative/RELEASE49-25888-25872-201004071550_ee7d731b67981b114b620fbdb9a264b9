package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_308:String;
      
      private var var_2337:String;
      
      private var var_2336:int;
      
      private var var_2339:int;
      
      private var var_607:String;
      
      private var var_1229:String;
      
      private var _name:String;
      
      private var var_511:int;
      
      private var var_867:int;
      
      private var var_2338:int;
      
      private var var_1788:int;
      
      private var var_2340:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2339;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1229;
      }
      
      public function get customData() : String
      {
         return this.var_2337;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_511;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2336;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2340;
      }
      
      public function get figure() : String
      {
         return this.var_308;
      }
      
      public function get respectTotal() : int
      {
         return this.var_1788;
      }
      
      public function get sex() : String
      {
         return this.var_607;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_308 = param1.readString();
         this.var_607 = param1.readString();
         this.var_2337 = param1.readString();
         this.var_1229 = param1.readString();
         this.var_2338 = param1.readInteger();
         this.var_2340 = param1.readString();
         this.var_2336 = param1.readInteger();
         this.var_2339 = param1.readInteger();
         this.var_1788 = param1.readInteger();
         this.var_867 = param1.readInteger();
         this.var_511 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2338;
      }
      
      public function get respectLeft() : int
      {
         return this.var_867;
      }
   }
}
