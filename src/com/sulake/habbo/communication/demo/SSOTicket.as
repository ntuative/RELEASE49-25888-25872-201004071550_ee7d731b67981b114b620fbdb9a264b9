package com.sulake.habbo.communication.demo
{
   import com.sulake.core.assets.AssetLoaderStruct;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.loaders.AssetLoaderEvent;
   import com.sulake.habbo.communication.IHabboWebLogin;
   import com.sulake.habbo.communication.enum.HabboWeb;
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.net.URLLoader;
   import flash.net.URLRequest;
   
   public class SSOTicket extends EventDispatcher
   {
      
      public static const const_257:String = "failure";
      
      public static const const_308:String = "success";
       
      
      private var _assets:IAssetLibrary;
      
      private var var_1218:String;
      
      private var var_1956:String;
      
      private var var_1492:String;
      
      private var var_1217:IHabboWebLogin;
      
      private var var_16:URLLoader;
      
      private var var_2383:String;
      
      public function SSOTicket(param1:IAssetLibrary, param2:IHabboWebLogin, param3:String)
      {
         super();
         _assets = param1;
         var_1217 = param2;
         var_1218 = "http://" + param3 + "/client";
         var_1217.init();
         var_1217.addEventListener(HabboWeb.const_207,requestClientURL);
      }
      
      public function get shockwaveClientUrl() : String
      {
         return var_1956;
      }
      
      private function requestClientURL(param1:Event = null) : void
      {
         var _loc2_:String = var_1218;
         if(_assets.hasAsset(_loc2_))
         {
            Logger.log("[CoreLocalizationManager] reload localization for url: " + var_1218);
         }
         var _loc3_:URLRequest = new URLRequest(var_1218);
         if(_assets.hasAsset(_loc2_))
         {
            _assets.removeAsset(_assets.getAssetByName(_loc2_));
         }
         var _loc4_:AssetLoaderStruct = _assets.loadAssetFromFile(_loc2_,_loc3_,"text/plain");
         _loc4_.addEventListener(AssetLoaderEvent.const_34,clientURLComplete);
      }
      
      public function get ticket() : String
      {
         return var_1492;
      }
      
      private function clientURLComplete(param1:Event = null) : void
      {
         var event:Event = param1;
         var loaderStruct:AssetLoaderStruct = event.target as AssetLoaderStruct;
         if(loaderStruct == null)
         {
            return;
         }
         var data:String = loaderStruct.assetLoader.content as String;
         if(data.indexOf("account/reauthenticate\"") > -1)
         {
            var_1217.requestReAuthenticate();
         }
         else
         {
            try
            {
               var_1492 = /\"sso.ticket\" : \"(.*?)\"/.exec(data)[1];
               var_1956 = /\"flash.client.url\" : \"(.*?)\"/.exec(data)[1];
               if(false)
               {
                  dispatchEvent(new Event(const_308));
               }
               else
               {
                  dispatchEvent(new Event(const_257));
               }
            }
            catch(e:Error)
            {
               trace(e);
               dispatchEvent(new Event(const_257));
            }
         }
      }
   }
}
