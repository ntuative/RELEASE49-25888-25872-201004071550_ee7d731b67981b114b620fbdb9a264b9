package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetColoursEvent extends Event
   {
       
      
      private var var_1343:Array;
      
      private var var_1995:String;
      
      private var var_1997:String;
      
      private var var_1996:String;
      
      public function CatalogWidgetColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_COLOUR_ARRAY,param5,param6);
         var_1343 = param1;
         var_1995 = param2;
         var_1997 = param3;
         var_1996 = param4;
      }
      
      public function get colours() : Array
      {
         return var_1343;
      }
      
      public function get backgroundAssetName() : String
      {
         return var_1995;
      }
      
      public function get colourAssetName() : String
      {
         return var_1997;
      }
      
      public function get chosenColourAssetName() : String
      {
         return var_1996;
      }
   }
}
