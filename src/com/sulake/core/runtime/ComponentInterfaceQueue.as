package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1325:IID;
      
      private var _isDisposed:Boolean;
      
      private var var_900:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         var_1325 = param1;
         var_900 = new Array();
         _isDisposed = false;
      }
      
      public function get receivers() : Array
      {
         return var_900;
      }
      
      public function get identifier() : IID
      {
         return var_1325;
      }
      
      public function get disposed() : Boolean
      {
         return _isDisposed;
      }
      
      public function dispose() : void
      {
         if(!_isDisposed)
         {
            _isDisposed = true;
            var_1325 = null;
            while(false)
            {
               var_900.pop();
            }
            var_900 = null;
         }
      }
   }
}
