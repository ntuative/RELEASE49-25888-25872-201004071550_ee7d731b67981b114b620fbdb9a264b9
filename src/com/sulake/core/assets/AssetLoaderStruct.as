package com.sulake.core.assets
{
   import com.sulake.core.assets.loaders.IAssetLoader;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.events.EventDispatcher;
   
   public class AssetLoaderStruct extends EventDispatcher implements IDisposable
   {
       
      
      private var var_688:IAssetLoader;
      
      private var var_1269:String;
      
      public function AssetLoaderStruct(param1:String, param2:IAssetLoader)
      {
         super();
         var_1269 = param1;
         var_688 = param2;
      }
      
      public function get assetLoader() : IAssetLoader
      {
         return var_688;
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(var_688 != null)
            {
               if(true)
               {
                  var_688.dispose();
                  var_688 = null;
               }
            }
            super.dispose();
         }
      }
      
      public function get assetName() : String
      {
         return var_1269;
      }
   }
}
