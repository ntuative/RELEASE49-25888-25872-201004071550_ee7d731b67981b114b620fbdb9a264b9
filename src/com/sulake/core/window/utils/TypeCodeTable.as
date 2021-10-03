package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowType;
   import flash.utils.Dictionary;
   
   public class TypeCodeTable extends WindowType
   {
       
      
      public function TypeCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["background"] = const_609;
         param1["bitmap"] = const_591;
         param1["border"] = const_717;
         param1["border_notify"] = const_1192;
         param1["button"] = const_423;
         param1["button_thick"] = const_510;
         param1["button_icon"] = const_1376;
         param1["button_group_left"] = const_596;
         param1["button_group_center"] = const_566;
         param1["button_group_right"] = const_554;
         param1["canvas"] = const_699;
         param1["checkbox"] = const_709;
         param1["closebutton"] = const_797;
         param1["container"] = const_336;
         param1["container_button"] = const_521;
         param1["display_object_wrapper"] = const_697;
         param1["dropmenu"] = const_426;
         param1["dropmenu_item"] = const_446;
         param1["frame"] = const_296;
         param1["frame_notify"] = const_1238;
         param1["header"] = const_705;
         param1["icon"] = const_806;
         param1["itemgrid"] = const_824;
         param1["itemgrid_horizontal"] = const_467;
         param1["itemgrid_vertical"] = const_586;
         param1["itemlist"] = const_951;
         param1["itemlist_horizontal"] = const_312;
         param1["itemlist_vertical"] = const_283;
         param1["maximizebox"] = const_1397;
         param1["menu"] = const_1145;
         param1["menu_item"] = WINDOW_TYPE_MENU_ITEM;
         param1["submenu"] = const_869;
         param1["minimizebox"] = const_1182;
         param1["notify"] = const_1230;
         param1["null"] = const_552;
         param1["password"] = const_594;
         param1["radiobutton"] = const_526;
         param1["region"] = const_417;
         param1["restorebox"] = const_1299;
         param1["scaler"] = const_615;
         param1["scaler_horizontal"] = const_1304;
         param1["scaler_vertical"] = const_1378;
         param1["scrollbar_horizontal"] = const_377;
         param1["scrollbar_vertical"] = const_695;
         param1["scrollbar_slider_button_up"] = const_1003;
         param1["scrollbar_slider_button_down"] = const_855;
         param1["scrollbar_slider_button_left"] = const_864;
         param1["scrollbar_slider_button_right"] = const_871;
         param1["scrollbar_slider_bar_horizontal"] = const_915;
         param1["scrollbar_slider_bar_vertical"] = const_827;
         param1["scrollbar_slider_track_horizontal"] = const_920;
         param1["scrollbar_slider_track_vertical"] = const_836;
         param1["scrollable_itemlist"] = const_1137;
         param1["scrollable_itemlist_vertical"] = const_404;
         param1["scrollable_itemlist_horizontal"] = const_853;
         param1["selector"] = const_706;
         param1["selector_list"] = const_736;
         param1["submenu"] = const_869;
         param1["tab_button"] = const_687;
         param1["tab_container_button"] = const_995;
         param1["tab_context"] = const_418;
         param1["tab_content"] = const_854;
         param1["tab_selector"] = WINDOW_TYPE_TAB_SELECTOR;
         param1["text"] = const_605;
         param1["input"] = const_553;
         param1["toolbar"] = const_1195;
         param1["tooltip"] = const_335;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  Logger.log("Overlapping window type code " + _loc3_ + "!");
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
