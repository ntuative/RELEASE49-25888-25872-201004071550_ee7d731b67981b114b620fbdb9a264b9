package com.sulake.core.window.events
{
   import com.sulake.core.window.IWindow;
   import flash.events.Event;
   
   public class WindowEvent extends Event
   {
      
      public static const const_268:String = "WE_CHILD_RESIZED";
      
      public static const const_1135:String = "WE_CLOSE";
      
      public static const const_1190:String = "WE_DESTROY";
      
      public static const const_136:String = "WE_CHANGE";
      
      public static const const_1138:String = "WE_RESIZE";
      
      public static const WINDOW_EVENT_MESSAGE:String = "WE_MESSAGE";
      
      public static const const_1472:String = "WE_PARENT_RESIZE";
      
      public static const const_95:String = "WE_UPDATE";
      
      public static const const_1391:String = "WE_MAXIMIZE";
      
      public static const const_384:String = "WE_DESTROYED";
      
      public static const const_941:String = "WE_UNSELECT";
      
      public static const const_1255:String = "WE_MAXIMIZED";
      
      public static const const_1531:String = "WE_UNLOCKED";
      
      public static const const_450:String = "WE_CHILD_REMOVED";
      
      public static const const_163:String = "WE_OK";
      
      public static const const_45:String = "WE_RESIZED";
      
      public static const const_1294:String = "WE_ACTIVATE";
      
      public static const const_240:String = "WE_ENABLED";
      
      public static const const_454:String = "WE_CHILD_RELOCATED";
      
      public static const const_1320:String = "WE_CREATE";
      
      public static const const_593:String = "WE_SELECT";
      
      public static const const_173:String = "";
      
      public static const const_1485:String = "WE_LOCKED";
      
      public static const const_1479:String = "WE_PARENT_RELOCATE";
      
      public static const const_1443:String = "WE_CHILD_REMOVE";
      
      public static const const_1490:String = "WE_CHILD_RELOCATE";
      
      public static const const_1530:String = "WE_LOCK";
      
      public static const const_233:String = "WE_FOCUSED";
      
      public static const const_638:String = "WE_UNSELECTED";
      
      public static const const_957:String = "WE_DEACTIVATED";
      
      public static const const_1139:String = "WE_MINIMIZED";
      
      public static const const_1606:String = "WE_ARRANGED";
      
      public static const const_1523:String = "WE_UNLOCK";
      
      public static const const_1543:String = "WE_ATTACH";
      
      public static const const_1265:String = "WE_OPEN";
      
      public static const const_1355:String = "WE_RESTORE";
      
      public static const const_1551:String = "WE_PARENT_RELOCATED";
      
      public static const const_1282:String = "WE_RELOCATE";
      
      public static const const_1540:String = "WE_CHILD_RESIZE";
      
      public static const const_1539:String = "WE_ARRANGE";
      
      public static const const_1142:String = "WE_OPENED";
      
      public static const const_1311:String = "WE_CLOSED";
      
      public static const const_1627:String = "WE_DETACHED";
      
      public static const const_1557:String = "WE_UPDATED";
      
      public static const const_1156:String = "WE_UNFOCUSED";
      
      public static const const_458:String = "WE_RELOCATED";
      
      public static const const_1392:String = "WE_DEACTIVATE";
      
      public static const const_219:String = "WE_DISABLED";
      
      public static const const_559:String = "WE_CANCEL";
      
      public static const const_576:String = "WE_ENABLE";
      
      public static const const_1245:String = "WE_ACTIVATED";
      
      public static const const_1162:String = "WE_FOCUS";
      
      public static const const_1518:String = "WE_DETACH";
      
      public static const const_1338:String = "WE_RESTORED";
      
      public static const const_1220:String = "WE_UNFOCUS";
      
      public static const const_58:String = "WE_SELECTED";
      
      public static const const_1315:String = "WE_PARENT_RESIZED";
      
      public static const const_1202:String = "WE_CREATED";
      
      public static const const_1524:String = "WE_ATTACHED";
      
      public static const const_1381:String = "WE_MINIMIZE";
      
      public static const WINDOW_EVENT_DISABLE:String = "WE_DISABLE";
       
      
      protected var _type:String = "";
      
      protected var var_1608:IWindow;
      
      protected var _window:IWindow;
      
      protected var var_1385:Boolean;
      
      public function WindowEvent(param1:String, param2:IWindow, param3:IWindow, param4:Boolean = false, param5:Boolean = false)
      {
         _type = param1;
         _window = param2;
         var_1608 = param3;
         var_1385 = false;
         super(param1,param4,param5);
      }
      
      public function isWindowOperationPrevented() : Boolean
      {
         return var_1385;
      }
      
      public function get related() : IWindow
      {
         return var_1608;
      }
      
      public function get window() : IWindow
      {
         return _window;
      }
      
      public function set type(param1:String) : void
      {
         _type = param1;
      }
      
      override public function get type() : String
      {
         return _type;
      }
      
      override public function toString() : String
      {
         return formatToString("WindowEvent","type","bubbles","cancelable","window");
      }
      
      override public function clone() : Event
      {
         return new WindowEvent(_type,window,related,bubbles,cancelable);
      }
      
      public function preventWindowOperation() : void
      {
         if(cancelable)
         {
            var_1385 = true;
            stopImmediatePropagation();
            return;
         }
         throw new Error("Attempted to prevent window operation that is not canceable!");
      }
   }
}
