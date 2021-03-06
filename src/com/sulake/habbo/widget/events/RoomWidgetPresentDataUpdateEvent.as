package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPresentDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_383:String = "RWPDUE_CONTENTS_CLUB";
      
      public static const const_402:String = "RWPDUE_CONTENTS_LANDSCAPE";
      
      public static const const_83:String = "RWPDUE_CONTENTS";
      
      public static const const_389:String = "RWPDUE_CONTENTS_WALLPAPER";
      
      public static const const_434:String = "RWPDUE_CONTENTS_FLOOR";
      
      public static const const_66:String = "RWPDUE_PACKAGEINFO";
       
      
      private var var_207:String;
      
      private var var_1993:BitmapData;
      
      private var var_157:int = -1;
      
      private var var_47:Boolean;
      
      public function RoomWidgetPresentDataUpdateEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:BitmapData = null, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_157 = param2;
         var_207 = param3;
         var_47 = param4;
         var_1993 = param5;
      }
      
      public function get iconBitmapData() : BitmapData
      {
         return var_1993;
      }
      
      public function get text() : String
      {
         return var_207;
      }
      
      public function get objectId() : int
      {
         return var_157;
      }
      
      public function get controller() : Boolean
      {
         return var_47;
      }
   }
}
