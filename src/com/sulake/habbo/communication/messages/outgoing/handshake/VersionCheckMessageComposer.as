package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class VersionCheckMessageComposer implements IMessageComposer
   {
       
      
      private var var_1765:String;
      
      private var var_1218:String;
      
      private var var_1764:int;
      
      public function VersionCheckMessageComposer(param1:int, param2:String, param3:String)
      {
         super();
         var_1764 = param1;
         var_1218 = param2;
         var_1765 = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1764,var_1218,var_1765];
      }
      
      public function dispose() : void
      {
      }
   }
}
