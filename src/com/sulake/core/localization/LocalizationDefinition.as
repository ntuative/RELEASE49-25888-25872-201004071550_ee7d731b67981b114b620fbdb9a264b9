package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1553:String;
      
      private var var_943:String;
      
      private var var_1554:String;
      
      private var var_1552:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         var_1552 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         var_1553 = _loc5_[0];
         var_1554 = _loc5_[1];
         _name = param2;
         var_943 = param3;
      }
      
      public function get countryCode() : String
      {
         return var_1553;
      }
      
      public function get languageCode() : String
      {
         return var_1552;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get url() : String
      {
         return var_943;
      }
      
      public function get encoding() : String
      {
         return var_1554;
      }
      
      public function get id() : String
      {
         return var_1552 + "_" + var_1553 + "." + var_1554;
      }
   }
}
