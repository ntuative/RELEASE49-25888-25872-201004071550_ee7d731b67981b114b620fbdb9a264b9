package com.sulake.habbo.avatar.pets
{
   public class PetEditorInfo
   {
       
      
      private var var_1933:Boolean;
      
      private var var_1663:Boolean;
      
      public function PetEditorInfo(param1:XML)
      {
         super();
         var_1933 = Boolean(parseInt(param1.@club));
         var_1663 = Boolean(parseInt(param1.@selectable));
      }
      
      public function get isClub() : Boolean
      {
         return var_1933;
      }
      
      public function get isSelectable() : Boolean
      {
         return var_1663;
      }
   }
}
