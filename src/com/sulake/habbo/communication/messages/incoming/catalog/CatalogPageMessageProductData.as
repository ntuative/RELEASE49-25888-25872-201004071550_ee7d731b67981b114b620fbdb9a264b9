package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageProductData
   {
      
      public static const const_210:String = "e";
      
      public static const const_82:String = "i";
      
      public static const const_77:String = "s";
       
      
      private var var_995:String;
      
      private var var_1184:String;
      
      private var var_1182:int;
      
      private var var_2087:int;
      
      private var var_994:int;
      
      public function CatalogPageMessageProductData(param1:IMessageDataWrapper)
      {
         super();
         var_1184 = param1.readString();
         var_2087 = param1.readInteger();
         var_995 = param1.readString();
         var_994 = param1.readInteger();
         var_1182 = param1.readInteger();
      }
      
      public function get productCount() : int
      {
         return var_994;
      }
      
      public function get productType() : String
      {
         return var_1184;
      }
      
      public function get expiration() : int
      {
         return var_1182;
      }
      
      public function get furniClassId() : int
      {
         return var_2087;
      }
      
      public function get extraParam() : String
      {
         return var_995;
      }
   }
}
