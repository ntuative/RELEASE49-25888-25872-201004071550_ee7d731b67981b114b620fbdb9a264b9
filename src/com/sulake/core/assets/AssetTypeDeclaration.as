package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_1818:Class;
      
      private var var_1820:Class;
      
      private var var_1819:String;
      
      private var var_1175:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_1819 = param1;
         var_1820 = param2;
         var_1818 = param3;
         if(rest == null)
         {
            var_1175 = new Array();
         }
         else
         {
            var_1175 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_1818;
      }
      
      public function get assetClass() : Class
      {
         return var_1820;
      }
      
      public function get mimeType() : String
      {
         return var_1819;
      }
      
      public function get fileTypes() : Array
      {
         return var_1175;
      }
   }
}
