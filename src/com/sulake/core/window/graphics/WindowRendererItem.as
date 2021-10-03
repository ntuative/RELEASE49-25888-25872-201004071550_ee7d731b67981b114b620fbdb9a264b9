package com.sulake.core.window.graphics
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.enum.WindowStyle;
   import com.sulake.core.window.graphics.renderer.ISkinRenderer;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Matrix;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowRendererItem implements IDisposable
   {
      
      private static const const_495:uint = 0;
      
      private static const const_789:uint = 1;
      
      private static const const_788:uint = 2;
       
      
      private var var_675:ISkinContainer;
      
      private var _drawBufferAllocator:DrawBufferAllocator;
      
      private var _disposed:Boolean;
      
      private var var_238:Rectangle;
      
      private var var_237:Boolean;
      
      private var var_92:BitmapData;
      
      private var var_949:Matrix;
      
      private var var_133:WindowRenderer;
      
      private var var_1097:uint;
      
      private var _colorTransform:ColorTransform;
      
      private var var_761:uint;
      
      public function WindowRendererItem(param1:WindowRenderer, param2:DrawBufferAllocator, param3:ISkinContainer)
      {
         super();
         _disposed = false;
         var_133 = param1;
         var_675 = param3;
         _drawBufferAllocator = param2;
         var_1097 = 4294967295;
         var_761 = 0;
         _colorTransform = new ColorTransform();
         var_949 = new Matrix();
         var_238 = new Rectangle();
      }
      
      public function get buffer() : BitmapData
      {
         return var_92;
      }
      
      public function invalidate(param1:IWindow, param2:Rectangle, param3:uint) : Boolean
      {
         var _loc4_:Boolean = false;
         switch(param3)
         {
            case WindowRedrawFlag.const_76:
               var_237 = true;
               _loc4_ = true;
               break;
            case WindowRedrawFlag.RESIZE:
               var_237 = true;
               _loc4_ = true;
               break;
            case WindowRedrawFlag.const_397:
               if(param1.testParamFlag(WindowParam.const_32))
               {
                  _loc4_ = true;
               }
               else
               {
                  IGraphicContextHost(param1).getGraphicContext(true).setDrawRegion(param1.rectangle,false);
               }
               break;
            case WindowRedrawFlag.const_966:
               var_761 = var_675.getTheActualState(param1.type,param1.style,param1.state);
               if(var_761 != var_1097)
               {
                  var_237 = true;
                  _loc4_ = true;
               }
               break;
            case WindowRedrawFlag.const_828:
               if(param1.testParamFlag(WindowParam.const_32))
               {
                  var_237 = true;
                  _loc4_ = true;
               }
               else
               {
                  IGraphicContextHost(param1).getGraphicContext(true).blend = param1.blend;
               }
               break;
            case WindowRedrawFlag.const_242:
               _loc4_ = true;
         }
         if(_loc4_)
         {
            var_238.left = Math.min(var_238.left,param2.left);
            var_238.top = Math.min(var_238.top,param2.top);
            var_238.right = Math.max(var_238.right,param2.right);
            var_238.bottom = Math.max(var_238.bottom,param2.bottom);
         }
         return _loc4_;
      }
      
      public function testForStateChange(param1:IWindow) : Boolean
      {
         return var_675.getTheActualState(param1.type,param1.style,param1.state) != var_1097;
      }
      
      public function get dirty() : Rectangle
      {
         return var_238;
      }
      
      public function render(param1:IWindow, param2:Point, param3:Rectangle) : Boolean
      {
         var _loc4_:* = null;
         var _loc11_:* = 0;
         var _loc5_:uint = !!param1.background ? uint(const_788) : uint(const_495);
         var _loc7_:ISkinRenderer = resolveSkinRenderer(param1);
         if(_loc7_ != null)
         {
            if(_loc7_.isStateDrawable(var_761))
            {
               _loc5_ = const_789;
            }
         }
         var _loc8_:int = Math.max(param1.width,1);
         var _loc9_:int = Math.max(param1.height,1);
         if(_loc5_ != const_495)
         {
            if(var_92 == null)
            {
               var_92 = _drawBufferAllocator.allocate(_loc8_,_loc9_,true,param1.color);
               var_237 = true;
            }
            else if(var_92.width != _loc8_ || var_92.height != _loc9_)
            {
               _drawBufferAllocator.free(var_92);
               var_92 = _drawBufferAllocator.allocate(_loc8_,_loc9_,true,param1.color);
               var_237 = true;
            }
         }
         var _loc10_:IGraphicContext = IGraphicContextHost(param1).getGraphicContext(false);
         if(_loc10_)
         {
            _loc10_.setDrawRegion(param1.rectangle,!param1.testParamFlag(WindowParam.const_32));
         }
         if(_loc5_ != const_495)
         {
            var_1097 = var_761;
            _loc4_ = param1.fetchDrawBuffer() as BitmapData;
            if(_loc4_ != null)
            {
               _loc4_.lock();
               if(_loc5_ == const_789)
               {
                  if(!param1.testParamFlag(WindowParam.const_32))
                  {
                     _loc4_.fillRect(param3,0);
                  }
                  if(var_237)
                  {
                     var_237 = false;
                     var_92.fillRect(var_92.rect,param1.color);
                     _loc7_.draw(param1,var_92,var_92.rect,var_761,false);
                     if(!param1.background)
                     {
                        _loc11_ = uint(param1.color);
                        if((_loc11_ & 16777215) < 16777215)
                        {
                           var_92.colorTransform(_loc4_.rect,new ColorTransform(((_loc11_ & 16711680) >> 16) / 255,((_loc11_ & 65280) >> 8) / 255,(_loc11_ & 255) / 255));
                        }
                     }
                  }
                  if(param1.blend < 1 && param1.testParamFlag(WindowParam.const_32))
                  {
                     var_949.tx = param2.x;
                     var_949.ty = param2.y;
                     _colorTransform.alphaMultiplier = param1.blend;
                     param3.offset(param2.x,param2.y);
                     _loc4_.draw(var_92,var_949,_colorTransform,null,param3,false);
                     param3.offset(-param2.x,-param2.y);
                  }
                  else
                  {
                     _loc4_.copyPixels(var_92,param3,param2,null,null,true);
                  }
               }
               else if(_loc5_ == const_788)
               {
                  if(param1.testParamFlag(WindowParam.const_32))
                  {
                     var_92.fillRect(var_92.rect,param1.color);
                     _loc4_.copyPixels(var_92,param3,param2,null,null,true);
                  }
                  else
                  {
                     _loc4_.fillRect(new Rectangle(param2.x,param2.y,param3.width,param3.height),param1.color);
                     _loc10_.blend = param1.blend;
                  }
               }
               _loc4_.unlock();
            }
            var_238.left = int.MAX_VALUE;
            var_238.top = int.MAX_VALUE;
            var_238.right = int.MIN_VALUE;
            var_238.bottom = int.MIN_VALUE;
         }
         return true;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            _disposed = true;
            var_133 = null;
            var_675 = null;
            if(var_92 != null)
            {
               _drawBufferAllocator.free(var_92);
               var_92 = null;
            }
         }
      }
      
      private function drawRect(param1:BitmapData, param2:Rectangle, param3:uint) : void
      {
         var _loc4_:int = 0;
         _loc4_ = param2.left;
         while(_loc4_ < param2.right)
         {
            param1.setPixel32(_loc4_,param2.top,param3);
            param1.setPixel32(_loc4_,param2.bottom - 1,param3);
            _loc4_++;
         }
         _loc4_ = param2.top;
         while(_loc4_ < param2.bottom)
         {
            param1.setPixel32(param2.left,_loc4_,param3);
            param1.setPixel32(param2.right - 1,_loc4_,param3);
            _loc4_++;
         }
      }
      
      private function resolveSkinRenderer(param1:IWindow) : ISkinRenderer
      {
         var _loc2_:ISkinRenderer = var_675.getSkinRendererByTypeAndStyle(param1.type,param1.style);
         if(_loc2_ == null)
         {
            if(param1.style != WindowStyle.const_947)
            {
               _loc2_ = var_675.getSkinRendererByTypeAndStyle(param1.type,WindowStyle.const_947);
            }
         }
         return _loc2_;
      }
   }
}
