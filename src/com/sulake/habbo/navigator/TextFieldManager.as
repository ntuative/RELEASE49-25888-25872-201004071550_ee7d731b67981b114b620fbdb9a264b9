package com.sulake.habbo.navigator
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.ITextFieldWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowKeyboardEvent;
   import flash.events.Event;
   import flash.geom.Point;
   import flash.ui.Keyboard;
   
   public class TextFieldManager
   {
       
      
      private var var_2327:Boolean;
      
      private var var_1538:int;
      
      private var var_2326:String = "";
      
      private var var_69:ITextFieldWindow;
      
      private var var_2328:uint;
      
      private var _orgTextBackgroundColor:uint;
      
      private var _navigator:HabboNavigator;
      
      private var var_1147:String = "";
      
      private var var_152:IWindowContainer;
      
      private var var_313:Boolean;
      
      private var var_1290:Function;
      
      public function TextFieldManager(param1:HabboNavigator, param2:ITextFieldWindow, param3:int = 1000, param4:Function = null, param5:String = null)
      {
         super();
         _navigator = param1;
         var_69 = param2;
         var_1538 = param3;
         var_1290 = param4;
         if(param5 != null)
         {
            var_313 = true;
            var_1147 = param5;
            var_69.text = param5;
         }
         Util.setProcDirectly(var_69,onInputClick);
         var_69.addEventListener(WindowKeyboardEvent.const_134,checkEnterPress);
         var_69.addEventListener(WindowEvent.const_136,checkMaxLen);
         this.var_2327 = var_69.textBackground;
         this._orgTextBackgroundColor = var_69.textBackgroundColor;
         this.var_2328 = var_69.textColor;
      }
      
      private function checkEnterPress(param1:Event) : void
      {
         var _loc2_:IWindow = IWindow(param1.target);
         if(!(param1 is WindowKeyboardEvent))
         {
            return;
         }
         var _loc3_:WindowKeyboardEvent = WindowKeyboardEvent(param1);
         if(_loc3_.charCode == Keyboard.ENTER)
         {
            if(var_1290 != null)
            {
               var_1290();
            }
         }
      }
      
      public function goBackToInitialState() : void
      {
         clearErrors();
         if(var_1147 != null)
         {
            var_69.text = var_1147;
            var_313 = true;
         }
         else
         {
            var_69.text = "";
            var_313 = false;
         }
      }
      
      public function get input() : ITextFieldWindow
      {
         return var_69;
      }
      
      public function restoreBackground() : void
      {
         var_69.textBackground = this.var_2327;
         var_69.textBackgroundColor = this._orgTextBackgroundColor;
         var_69.textColor = this.var_2328;
      }
      
      private function onInputClick(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowEvent.const_233)
         {
            return;
         }
         if(!var_313)
         {
            return;
         }
         var_69.text = var_2326;
         var_313 = false;
         this.restoreBackground();
      }
      
      public function clearErrors() : void
      {
         this.restoreBackground();
         if(this.var_152 != null)
         {
            var_152.visible = false;
         }
      }
      
      public function displayError(param1:String) : void
      {
         var_69.textBackground = true;
         var_69.textBackgroundColor = 4294021019;
         var_69.textColor = 4278190080;
         if(this.var_152 == null)
         {
            this.var_152 = IWindowContainer(_navigator.getXmlWindow("nav_error_popup"));
            _navigator.refreshButton(this.var_152,"popup_arrow_down",true,null,0);
            IWindowContainer(var_69.parent).addChild(this.var_152);
         }
         var _loc2_:ITextWindow = ITextWindow(this.var_152.findChildByName("error_text"));
         _loc2_.text = param1;
         _loc2_.width = _loc2_.textWidth + 5;
         var_152.findChildByName("border").width = _loc2_.width + 15;
         var_152.width = _loc2_.width + 15;
         var _loc3_:Point = new Point();
         var_69.getLocalPosition(_loc3_);
         this.var_152.x = _loc3_.x;
         this.var_152.y = _loc3_.y - this.var_152.height + 3;
         var _loc4_:IWindow = var_152.findChildByName("popup_arrow_down");
         _loc4_.x = this.var_152.width / 2 - _loc4_.width / 2;
         var_152.x += (0 - 0) / 2;
         this.var_152.visible = true;
      }
      
      public function getText() : String
      {
         if(var_313)
         {
            return var_2326;
         }
         return var_69.text;
      }
      
      private function isInputValid() : Boolean
      {
         return !var_313 && Util.trim(getText()).length > 2;
      }
      
      public function setText(param1:String) : void
      {
         var_313 = false;
         var_69.text = param1;
      }
      
      public function checkMandatory(param1:String) : Boolean
      {
         if(!isInputValid())
         {
            displayError(param1);
            return false;
         }
         restoreBackground();
         return true;
      }
      
      private function checkMaxLen(param1:Event) : void
      {
         var _loc2_:String = "null";
         if(_loc2_.length > var_1538)
         {
            var_69.text = _loc2_.substring(0,var_1538);
         }
      }
   }
}
