package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_830:String = "AssetLoaderEventUnload";
      
      public static const const_44:String = "AssetLoaderEventError";
      
      public static const const_848:String = "AssetLoaderEventOpen";
      
      public static const const_861:String = "AssetLoaderEventProgress";
      
      public static const const_939:String = "AssetLoaderEventStatus";
      
      public static const const_34:String = "AssetLoaderEventComplete";
       
      
      private var var_375:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         var_375 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return var_375;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,var_375);
      }
   }
}
