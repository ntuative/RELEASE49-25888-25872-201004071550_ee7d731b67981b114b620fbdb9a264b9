package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_1733:int;
      
      private var var_1734:String;
      
      private var var_1732:int;
      
      private var _disposed:Boolean;
      
      private var var_1731:int;
      
      private var var_1735:String;
      
      private var var_1158:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         var_1735 = param1.readString();
         var_1733 = param1.readInteger();
         var_1732 = param1.readInteger();
         var_1734 = param1.readString();
         var_1731 = param1.readInteger();
         var_1158 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return var_1731;
      }
      
      public function get worldId() : int
      {
         return var_1732;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
      }
      
      public function get unitPropertySet() : String
      {
         return var_1735;
      }
      
      public function get unitPort() : int
      {
         return var_1733;
      }
      
      public function get castLibs() : String
      {
         return var_1734;
      }
      
      public function get nodeId() : int
      {
         return var_1158;
      }
   }
}
