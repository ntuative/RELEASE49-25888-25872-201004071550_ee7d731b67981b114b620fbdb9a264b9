package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_693:String;
      
      private var _id:int;
      
      private var var_2059:String = "";
      
      private var var_2058:int;
      
      private var var_2060:String;
      
      private var var_1901:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         _id = parseInt(param1.@id);
         var_2058 = parseInt(param1.@pattern);
         var_693 = String(param1.@gender);
         var_1901 = Boolean(parseInt(param1.@colorable));
         var_2059 = String(param1.@localizationKey);
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get localizationKey() : String
      {
         return var_2059;
      }
      
      public function get isColorable() : Boolean
      {
         return var_1901;
      }
      
      public function get gender() : String
      {
         return var_693;
      }
      
      public function get patternId() : int
      {
         return var_2058;
      }
      
      public function get avatarFigureString() : String
      {
         return var_2060;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         var_2060 = param1;
      }
   }
}
