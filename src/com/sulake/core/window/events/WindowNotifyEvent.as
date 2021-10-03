package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowNotifyEvent extends WindowEvent
   {
      
      public static const const_1340:String = "WN_CREATED";
      
      public static const const_813:String = "WN_DISABLE";
      
      public static const const_897:String = "WN_DEACTIVATED";
      
      public static const const_860:String = "WN_OPENED";
      
      public static const const_959:String = "WN_CLOSED";
      
      public static const const_866:String = "WN_DESTROY";
      
      public static const const_1567:String = "WN_ARRANGED";
      
      public static const const_367:String = "WN_PARENT_RESIZED";
      
      public static const const_841:String = "WN_ENABLE";
      
      public static const const_925:String = "WN_RELOCATE";
      
      public static const const_994:String = "WN_FOCUS";
      
      public static const const_927:String = "WN_PARENT_RELOCATED";
      
      public static const const_358:String = "WN_PARAM_UPDATED";
      
      public static const const_720:String = "WN_PARENT_ACTIVATED";
      
      public static const const_162:String = "WN_RESIZED";
      
      public static const const_1016:String = "WN_CLOSE";
      
      public static const const_969:String = "WN_PARENT_REMOVED";
      
      public static const const_245:String = "WN_CHILD_RELOCATED";
      
      public static const const_718:String = "WN_ENABLED";
      
      public static const const_269:String = "WN_CHILD_RESIZED";
      
      public static const const_905:String = "WN_MINIMIZED";
      
      public static const const_525:String = "WN_DISABLED";
      
      public static const const_225:String = "WN_CHILD_ACTIVATED";
      
      public static const const_437:String = "WN_STATE_UPDATED";
      
      public static const const_714:String = "WN_UNSELECTED";
      
      public static const const_403:String = "WN_STYLE_UPDATED";
      
      public static const const_1596:String = "WN_UPDATE";
      
      public static const const_451:String = "WN_PARENT_ADDED";
      
      public static const const_670:String = "WN_RESIZE";
      
      public static const const_539:String = "WN_CHILD_REMOVED";
      
      public static const const_1491:String = "";
      
      public static const const_883:String = "WN_RESTORED";
      
      public static const const_324:String = "WN_SELECTED";
      
      public static const const_954:String = "WN_MINIMIZE";
      
      public static const const_808:String = "WN_FOCUSED";
      
      public static const const_1203:String = "WN_LOCK";
      
      public static const const_281:String = "WN_CHILD_ADDED";
      
      public static const const_801:String = "WN_UNFOCUSED";
      
      public static const const_412:String = "WN_RELOCATED";
      
      public static const const_907:String = "WN_DEACTIVATE";
      
      public static const const_1262:String = "WN_CRETAE";
      
      public static const const_898:String = "WN_RESTORE";
      
      public static const const_287:String = "WN_ACTVATED";
      
      public static const const_1286:String = "WN_LOCKED";
      
      public static const const_413:String = "WN_SELECT";
      
      public static const const_961:String = "WN_MAXIMIZE";
      
      public static const const_876:String = "WN_OPEN";
      
      public static const const_644:String = "WN_UNSELECT";
      
      public static const const_1561:String = "WN_ARRANGE";
      
      public static const const_1224:String = "WN_UNLOCKED";
      
      public static const const_1486:String = "WN_UPDATED";
      
      public static const const_950:String = "WN_ACTIVATE";
      
      public static const const_1144:String = "WN_UNLOCK";
      
      public static const const_949:String = "WN_MAXIMIZED";
      
      public static const const_891:String = "WN_DESTROYED";
      
      public static const const_826:String = "WN_UNFOCUS";
       
      
      public function WindowNotifyEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false)
      {
         super(param1,param2,param3,false,param4);
      }
      
      override public function toString() : String
      {
         return formatToString("WindowNotifyEvent","type","cancelable");
      }
      
      override public function clone() : Event
      {
         return new WindowNotifyEvent(type,_window,var_1608,cancelable);
      }
   }
}
