package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomThumbnailData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_471:int;
      
      private var _objects:Array;
      
      private var var_393:int;
      
      public function RoomThumbnailData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         _objects = new Array();
         super();
         if(param1 == null)
         {
            return;
         }
         var_393 = param1.readInteger();
         var_471 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new RoomThumbnailObjectData();
            _loc4_.pos = param1.readInteger();
            _loc4_.imgId = param1.readInteger();
            _objects.push(_loc4_);
            _loc3_++;
         }
         if(var_393 == 0)
         {
            setDefaults();
         }
      }
      
      public function get bgImgId() : int
      {
         return var_393;
      }
      
      private function setDefaults() : void
      {
         var_393 = 1;
         var_471 = 0;
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.pos = 4;
         _loc1_.imgId = 1;
         _objects.push(_loc1_);
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function getCopy() : RoomThumbnailData
      {
         var _loc2_:* = null;
         var _loc1_:RoomThumbnailData = new RoomThumbnailData(null);
         _loc1_.var_393 = this.var_393;
         _loc1_.var_471 = this.var_471;
         for each(_loc2_ in _objects)
         {
            _loc1_._objects.push(_loc2_.getCopy());
         }
         return _loc1_;
      }
      
      public function set frontImgId(param1:int) : void
      {
         var_471 = param1;
      }
      
      public function set bgImgId(param1:int) : void
      {
         var_393 = param1;
      }
      
      public function get objects() : Array
      {
         return _objects;
      }
      
      public function getAsString() : String
      {
         var _loc2_:* = null;
         var _loc1_:* = var_471 + ";";
         _loc1_ += var_393 + ";";
         for each(_loc2_ in _objects)
         {
            _loc1_ += _loc2_.imgId + "," + _loc2_.pos + ";";
         }
         return _loc1_;
      }
      
      public function get frontImgId() : int
      {
         return var_471;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this._objects = null;
      }
   }
}
