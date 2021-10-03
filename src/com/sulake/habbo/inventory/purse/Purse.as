package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2005:Boolean = false;
      
      private var var_2004:int = 0;
      
      private var var_1595:int = 0;
      
      private var var_2006:int = 0;
      
      private var var_1989:Boolean = false;
      
      private var var_1481:int = 0;
      
      private var var_1594:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1481 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2004;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2005;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2005 = param1;
      }
      
      public function get isVIP() : Boolean
      {
         return var_1989;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2004 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1595 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1481;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         var_1989 = param1;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2006 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1595;
      }
      
      public function get pixelBalance() : int
      {
         return var_2006;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1594 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1594;
      }
   }
}
