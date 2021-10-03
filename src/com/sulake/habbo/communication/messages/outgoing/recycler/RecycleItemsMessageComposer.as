package com.sulake.habbo.communication.messages.outgoing.recycler
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class RecycleItemsMessageComposer implements IMessageComposer
   {
       
      
      private var var_796:Array;
      
      public function RecycleItemsMessageComposer(param1:Array)
      {
         super();
         var_796 = new Array();
         var_796.push(param1.length);
         var_796 = var_796.concat(param1);
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return var_796;
      }
   }
}
