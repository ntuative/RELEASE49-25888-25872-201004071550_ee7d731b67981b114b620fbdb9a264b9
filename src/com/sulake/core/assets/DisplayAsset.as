package com.sulake.core.assets
{
   import flash.display.DisplayObject;
   
   public class DisplayAsset implements IAsset
   {
       
      
      protected var var_19:DisplayObject;
      
      protected var _disposed:Boolean = false;
      
      protected var var_943:String;
      
      protected var var_456:AssetTypeDeclaration;
      
      public function DisplayAsset(param1:AssetTypeDeclaration, param2:String = null)
      {
         super();
         var_456 = param1;
         var_943 = param2;
      }
      
      public function get declaration() : AssetTypeDeclaration
      {
         return var_456;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function setParamsDesc(param1:XMLList) : void
      {
      }
      
      public function setFromOtherAsset(param1:IAsset) : void
      {
         if(param1 is DisplayAsset)
         {
            var_19 = DisplayAsset(param1).var_19;
            var_456 = DisplayAsset(param1).var_456;
            return;
         }
         throw new Error("Provided asset should be of type DisplayAsset!");
      }
      
      public function get url() : String
      {
         return var_943;
      }
      
      public function setUnknownContent(param1:Object) : void
      {
         if(param1 is DisplayObject)
         {
            var_19 = param1 as DisplayObject;
            if(var_19 != null)
            {
               return;
            }
            throw new Error("Failed to convert DisplayObject to DisplayAsset!");
         }
         if(param1 is DisplayAsset)
         {
            var_19 = DisplayAsset(param1).var_19;
            var_456 = DisplayAsset(param1).var_456;
            if(var_19 == null)
            {
               throw new Error("Failed to read content from DisplayAsset!");
            }
         }
      }
      
      public function get content() : Object
      {
         return var_19;
      }
      
      public function dispose() : void
      {
         if(!_disposed)
         {
            if(false)
            {
               if(var_19.loaderInfo.loader != null)
               {
                  var_19.loaderInfo.loader.unload();
               }
            }
            var_19 = null;
            var_456 = null;
            _disposed = true;
            var_943 = null;
         }
      }
   }
}
