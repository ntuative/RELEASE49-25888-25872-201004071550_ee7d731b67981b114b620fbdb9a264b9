package com.sulake.core.utils
{
   import deng.fzip.FZip;
   import flash.display.LoaderInfo;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.ProgressEvent;
   import flash.net.URLRequest;
   import flash.system.LoaderContext;
   import flash.utils.getQualifiedClassName;
   
   public class ZipLoader extends LibraryLoader
   {
       
      
      private var var_406:FZip;
      
      private var var_1225:Array;
      
      private var var_1977:uint = 0;
      
      private var var_839:int = 0;
      
      private var var_2385:Array;
      
      public function ZipLoader(param1:Boolean)
      {
         super(param1);
         var_1225 = new Array();
      }
      
      private function onIOError(param1:IOErrorEvent) : void
      {
         Logger.log(param1.text);
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_ERROR,0));
      }
      
      public function get resources() : Array
      {
         return var_1225;
      }
      
      private function onLoaderComplete(param1:Event) : void
      {
         var _loc2_:LoaderInfo = param1.target as LoaderInfo;
         var _loc3_:String = getQualifiedClassName(var_16.content);
         var_1225.push(var_16.contentLoaderInfo.applicationDomain.getDefinition(_loc3_));
         ++var_839;
         if(var_1225.length == var_1977)
         {
            var_16.contentLoaderInfo.removeEventListener(Event.COMPLETE,onLoaderComplete);
            var_16.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR,onIOError);
            dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_COMPLETE,0));
         }
         else
         {
            var_16.loadBytes(var_406.getFileAt(var_839).content);
         }
      }
      
      override public function load(param1:URLRequest, param2:LoaderContext = null, param3:int = 1) : void
      {
         var_322 = param1;
         if(var_406)
         {
            var_406.close();
         }
         var_406 = new FZip();
         var_406.addEventListener(Event.COMPLETE,onComplete);
         var_406.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_406.addEventListener(ProgressEvent.PROGRESS,onProgress);
         var_406.load(var_322);
      }
      
      private function onProgress(param1:ProgressEvent) : void
      {
         dispatchEvent(new LibraryLoaderEvent(LibraryLoaderEvent.LIBRARY_LOADER_EVENT_PROGRESS,0));
      }
      
      private function onComplete(param1:Event) : void
      {
         var_839 = 0;
         var_1977 = var_406.getFileCount();
         removeEventListeners();
         var_16.contentLoaderInfo.addEventListener(Event.COMPLETE,onLoaderComplete);
         var_16.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR,onIOError);
         var_16.loadBytes(var_406.getFileAt(var_839).content);
      }
   }
}
