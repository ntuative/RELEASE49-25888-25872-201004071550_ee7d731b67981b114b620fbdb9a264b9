package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1595:int = 0;
      
      private var var_2253:int = 0;
      
      private var var_1989:Boolean = false;
      
      private var var_2239:int = 0;
      
      private var var_1594:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get clubPeriods() : int
      {
         return var_1594;
      }
      
      public function get clubDays() : int
      {
         return var_1595;
      }
      
      public function set pixels(param1:int) : void
      {
         var_2253 = param1;
      }
      
      public function get pixels() : int
      {
         return var_2253;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return var_1595 > 0 || var_1594 > 0;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1595 = param1;
      }
      
      public function get credits() : int
      {
         return var_2239;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1989;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1989 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_2239 = param1;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1594 = param1;
      }
   }
}
