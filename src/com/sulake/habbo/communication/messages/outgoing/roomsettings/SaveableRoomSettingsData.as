package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var _password:String;
      
      private var var_2019:int;
      
      private var var_1925:int;
      
      private var var_2017:Boolean;
      
      private var var_2016:Boolean;
      
      private var var_2015:Array;
      
      private var var_2018:Boolean;
      
      private var var_1227:int;
      
      private var _name:String;
      
      private var _roomId:int;
      
      private var var_638:Array;
      
      private var var_1209:String;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function get method_1() : int
      {
         return var_1925;
      }
      
      public function get description() : String
      {
         return var_1209;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return var_2016;
      }
      
      public function get maximumVisitors() : int
      {
         return var_2019;
      }
      
      public function set description(param1:String) : void
      {
         var_1209 = param1;
      }
      
      public function get password() : String
      {
         return _password;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         var_2018 = param1;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         var_2019 = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get categoryId() : int
      {
         return var_1227;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get controllers() : Array
      {
         return var_2015;
      }
      
      public function get tags() : Array
      {
         return var_638;
      }
      
      public function get allowPets() : Boolean
      {
         return var_2018;
      }
      
      public function set method_1(param1:int) : void
      {
         var_1925 = param1;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         var_2017 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         var_638 = param1;
      }
      
      public function set roomId(param1:int) : void
      {
         _roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         var_2015 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         var_1227 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return var_2017;
      }
      
      public function set password(param1:String) : void
      {
         _password = param1;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         var_2016 = param1;
      }
   }
}
