package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1855:int;
      
      private var var_308:String;
      
      private var var_1857:int;
      
      private var var_1866:int;
      
      private var var_1851:int;
      
      private var var_2263:int;
      
      private var _nutrition:int;
      
      private var var_1241:int;
      
      private var var_2266:int;
      
      private var var_2265:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1854:int;
      
      private var var_2264:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1857;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get maxEnergy() : int
      {
         return var_2263;
      }
      
      public function flush() : Boolean
      {
         var_1241 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return var_2266;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return var_2265;
      }
      
      public function get maxNutrition() : int
      {
         return var_2264;
      }
      
      public function get figure() : String
      {
         return var_308;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function get respect() : int
      {
         return var_1866;
      }
      
      public function get petId() : int
      {
         return var_1241;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var_1241 = param1.readInteger();
         _name = param1.readString();
         var_1857 = param1.readInteger();
         var_2266 = param1.readInteger();
         var_1851 = param1.readInteger();
         var_2265 = param1.readInteger();
         _energy = param1.readInteger();
         var_2263 = param1.readInteger();
         _nutrition = param1.readInteger();
         var_2264 = param1.readInteger();
         var_308 = param1.readString();
         var_1866 = param1.readInteger();
         var_1854 = param1.readInteger();
         var_1855 = param1.readInteger();
         _ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function get experience() : int
      {
         return var_1851;
      }
      
      public function get ownerId() : int
      {
         return var_1854;
      }
      
      public function get age() : int
      {
         return var_1855;
      }
   }
}
