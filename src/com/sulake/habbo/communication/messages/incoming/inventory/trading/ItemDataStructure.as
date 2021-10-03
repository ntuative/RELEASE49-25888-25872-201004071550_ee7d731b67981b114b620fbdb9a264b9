package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_1059:String;
      
      private var var_1680:int;
      
      private var var_1683:int;
      
      private var var_1422:int;
      
      private var var_1679:int;
      
      private var _category:int;
      
      private var var_2371:int;
      
      private var var_1677:int;
      
      private var var_1681:int;
      
      private var var_1678:int;
      
      private var var_1682:int;
      
      private var var_1676:Boolean;
      
      private var var_1390:String;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         var_1680 = param1;
         var_1059 = param2;
         var_1683 = param3;
         var_1678 = param4;
         _category = param5;
         var_1390 = param6;
         var_1422 = param7;
         var_1681 = param8;
         var_1677 = param9;
         var_1682 = param10;
         var_1679 = param11;
         var_1676 = param12;
      }
      
      public function get itemTypeID() : int
      {
         return var_1678;
      }
      
      public function get extra() : int
      {
         return var_1422;
      }
      
      public function get stuffData() : String
      {
         return var_1390;
      }
      
      public function get groupable() : Boolean
      {
         return var_1676;
      }
      
      public function get creationMonth() : int
      {
         return var_1682;
      }
      
      public function get roomItemID() : int
      {
         return var_1683;
      }
      
      public function get itemType() : String
      {
         return var_1059;
      }
      
      public function get itemID() : int
      {
         return var_1680;
      }
      
      public function get songID() : int
      {
         return var_1422;
      }
      
      public function get timeToExpiration() : int
      {
         return var_1681;
      }
      
      public function get creationYear() : int
      {
         return var_1679;
      }
      
      public function get creationDay() : int
      {
         return var_1677;
      }
      
      public function get category() : int
      {
         return _category;
      }
   }
}
