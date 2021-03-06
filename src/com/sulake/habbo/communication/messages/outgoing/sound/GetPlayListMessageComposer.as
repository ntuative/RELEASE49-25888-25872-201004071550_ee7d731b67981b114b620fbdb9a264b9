package com.sulake.habbo.communication.messages.outgoing.sound
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.IDisposable;
   
   public class GetPlayListMessageComposer implements IMessageComposer, IDisposable
   {
       
      
      private var var_28:Array;
      
      public function GetPlayListMessageComposer()
      {
         var_28 = new Array();
         super();
      }
      
      public function get disposed() : Boolean
      {
         return false;
      }
      
      public function getMessageArray() : Array
      {
         return var_28;
      }
      
      public function dispose() : void
      {
         var_28 = null;
      }
   }
}
