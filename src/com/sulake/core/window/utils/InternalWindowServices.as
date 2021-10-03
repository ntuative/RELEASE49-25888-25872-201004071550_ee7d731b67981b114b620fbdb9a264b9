package com.sulake.core.window.utils
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class InternalWindowServices implements IInternalWindowServices
   {
       
      
      private var var_117:DisplayObject;
      
      private var var_2298:uint;
      
      private var var_783:IWindowToolTipAgentService;
      
      private var var_785:IWindowMouseScalingService;
      
      private var _windowContext:IWindowContext;
      
      private var var_781:IWindowFocusManagerService;
      
      private var var_784:IWindowMouseListenerService;
      
      private var var_782:IWindowMouseDraggingService;
      
      public function InternalWindowServices(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         var_2298 = 0;
         var_117 = param2;
         _windowContext = param1;
         var_782 = new WindowMouseDragger(param2);
         var_785 = new WindowMouseScaler(param2);
         var_784 = new WindowMouseListener(param2);
         var_781 = new FocusManager(param2);
         var_783 = new WindowToolTipAgent(param2);
      }
      
      public function getMouseScalingService() : IWindowMouseScalingService
      {
         return var_785;
      }
      
      public function getFocusManagerService() : IWindowFocusManagerService
      {
         return var_781;
      }
      
      public function getToolTipAgentService() : IWindowToolTipAgentService
      {
         return var_783;
      }
      
      public function dispose() : void
      {
         if(var_782 != null)
         {
            var_782.dispose();
            var_782 = null;
         }
         if(var_785 != null)
         {
            var_785.dispose();
            var_785 = null;
         }
         if(var_784 != null)
         {
            var_784.dispose();
            var_784 = null;
         }
         if(var_781 != null)
         {
            var_781.dispose();
            var_781 = null;
         }
         if(var_783 != null)
         {
            var_783.dispose();
            var_783 = null;
         }
         _windowContext = null;
      }
      
      public function getMouseListenerService() : IWindowMouseListenerService
      {
         return var_784;
      }
      
      public function getMouseDraggingService() : IWindowMouseDraggingService
      {
         return var_782;
      }
   }
}
