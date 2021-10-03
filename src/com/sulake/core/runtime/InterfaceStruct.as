package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_400:uint;
      
      private var var_1000:IUnknown;
      
      private var var_1197:String;
      
      private var var_999:IID;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         var_999 = param1;
         var_1197 = getQualifiedClassName(var_999);
         var_1000 = param2;
         var_400 = 0;
      }
      
      public function get iid() : IID
      {
         return var_999;
      }
      
      public function get disposed() : Boolean
      {
         return var_1000 == null;
      }
      
      public function get references() : uint
      {
         return var_400;
      }
      
      public function release() : uint
      {
         return references > 0 ? uint(--var_400) : uint(0);
      }
      
      public function get unknown() : IUnknown
      {
         return var_1000;
      }
      
      public function get iis() : String
      {
         return var_1197;
      }
      
      public function reserve() : uint
      {
         return ++var_400;
      }
      
      public function dispose() : void
      {
         var_999 = null;
         var_1197 = null;
         var_1000 = null;
         var_400 = 0;
      }
   }
}
