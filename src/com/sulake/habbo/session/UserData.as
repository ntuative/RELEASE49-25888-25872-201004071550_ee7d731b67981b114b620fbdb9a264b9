package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_308:String = "";
      
      private var var_1832:String = "";
      
      private var var_1829:int = 0;
      
      private var var_1707:int = 0;
      
      private var _type:int = 0;
      
      private var var_1831:String = "";
      
      private var var_607:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_1706:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         _id = param1;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function set name(param1:String) : void
      {
         _name = param1;
      }
      
      public function set groupStatus(param1:int) : void
      {
         var_1829 = param1;
      }
      
      public function set groupID(param1:String) : void
      {
         var_1831 = param1;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set figure(param1:String) : void
      {
         var_308 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         var_607 = param1;
      }
      
      public function get groupStatus() : int
      {
         return var_1829;
      }
      
      public function set webID(param1:int) : void
      {
         var_1706 = param1;
      }
      
      public function get groupID() : String
      {
         return var_1831;
      }
      
      public function set custom(param1:String) : void
      {
         var_1832 = param1;
      }
      
      public function get figure() : String
      {
         return var_308;
      }
      
      public function get sex() : String
      {
         return var_607;
      }
      
      public function get custom() : String
      {
         return var_1832;
      }
      
      public function get webID() : int
      {
         return var_1706;
      }
      
      public function set xp(param1:int) : void
      {
         var_1707 = param1;
      }
      
      public function set type(param1:int) : void
      {
         _type = param1;
      }
      
      public function get xp() : int
      {
         return var_1707;
      }
   }
}
