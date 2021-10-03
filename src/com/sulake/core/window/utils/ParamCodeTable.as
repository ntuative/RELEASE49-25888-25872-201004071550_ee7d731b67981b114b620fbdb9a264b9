package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_132;
         param1["bound_to_parent_rect"] = const_90;
         param1["child_window"] = const_958;
         param1["embedded_controller"] = const_282;
         param1["resize_to_accommodate_children"] = const_60;
         param1["input_event_processor"] = const_47;
         param1["internal_event_handling"] = const_685;
         param1["mouse_dragging_target"] = const_212;
         param1["mouse_dragging_trigger"] = const_300;
         param1["mouse_scaling_target"] = const_255;
         param1["mouse_scaling_trigger"] = const_356;
         param1["horizontal_mouse_scaling_trigger"] = const_218;
         param1["vertical_mouse_scaling_trigger"] = const_205;
         param1["observe_parent_input_events"] = const_974;
         param1["optimize_region_to_layout_size"] = const_392;
         param1["parent_window"] = const_837;
         param1["relative_horizontal_scale_center"] = const_178;
         param1["relative_horizontal_scale_fixed"] = const_126;
         param1["relative_horizontal_scale_move"] = const_293;
         param1["relative_horizontal_scale_strech"] = const_243;
         param1["relative_scale_center"] = const_893;
         param1["relative_scale_fixed"] = const_663;
         param1["relative_scale_move"] = const_944;
         param1["relative_scale_strech"] = const_892;
         param1["relative_vertical_scale_center"] = const_170;
         param1["relative_vertical_scale_fixed"] = const_108;
         param1["relative_vertical_scale_move"] = const_285;
         param1["relative_vertical_scale_strech"] = const_275;
         param1["on_resize_align_left"] = const_604;
         param1["on_resize_align_right"] = const_464;
         param1["on_resize_align_center"] = const_407;
         param1["on_resize_align_top"] = const_712;
         param1["on_resize_align_bottom"] = const_457;
         param1["on_resize_align_middle"] = const_427;
         param1["on_accommodate_align_left"] = const_867;
         param1["on_accommodate_align_right"] = const_411;
         param1["on_accommodate_align_center"] = const_681;
         param1["on_accommodate_align_top"] = const_881;
         param1["on_accommodate_align_bottom"] = WINDOW_PARAM_ON_ACCOMMODATE_ALIGN_BOTTOM;
         param1["on_accommodate_align_middle"] = const_672;
         param1["route_input_events_to_parent"] = const_474;
         param1["use_parent_graphic_context"] = const_32;
         param1["draggable_with_mouse"] = const_863;
         param1["scalable_with_mouse"] = const_885;
         param1["reflect_horizontal_resize_to_parent"] = const_393;
         param1["reflect_vertical_resize_to_parent"] = WINDOW_PARAM_REFLECT_VERTICAL_RESIZE_TO_PARENT;
         param1["reflect_resize_to_parent"] = const_271;
         if(param2 != null)
         {
            for(_loc3_ in param1)
            {
               if(param2[param1[_loc3_]] != null)
               {
                  if(param1[_loc3_] != 0)
                  {
                     Logger.log("Conflictiong flags in window params: \"" + _loc3_ + "\"!");
                  }
               }
               param2[param1[_loc3_]] = _loc3_;
            }
         }
      }
   }
}
