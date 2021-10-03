package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class ItemMessageData
   {
       
      
      private var var_84:Number = 0;
      
      private var _data:String = "";
      
      private var var_1422:int = 0;
      
      private var var_31:int = 0;
      
      private var _type:int = 0;
      
      private var _y:Number = 0;
      
      private var var_2150:Boolean = false;
      
      private var var_2396:String = "";
      
      private var _id:int = 0;
      
      private var var_187:Boolean = false;
      
      private var var_235:String = "";
      
      private var var_2152:int = 0;
      
      private var var_2151:int = 0;
      
      private var var_1918:int = 0;
      
      private var var_1920:int = 0;
      
      public function ItemMessageData(param1:int, param2:int, param3:Boolean)
      {
         super();
         _id = param1;
         _type = param2;
         var_2150 = param3;
      }
      
      public function set y(param1:Number) : void
      {
         if(!var_187)
         {
            _y = param1;
         }
      }
      
      public function get isOldFormat() : Boolean
      {
         return var_2150;
      }
      
      public function set type(param1:int) : void
      {
         if(!var_187)
         {
            _type = param1;
         }
      }
      
      public function get dir() : String
      {
         return var_235;
      }
      
      public function get state() : int
      {
         return var_31;
      }
      
      public function set localX(param1:Number) : void
      {
         if(!var_187)
         {
            var_1918 = param1;
         }
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function set wallX(param1:Number) : void
      {
         if(!var_187)
         {
            var_2152 = param1;
         }
      }
      
      public function set wallY(param1:Number) : void
      {
         if(!var_187)
         {
            var_2151 = param1;
         }
      }
      
      public function set dir(param1:String) : void
      {
         if(!var_187)
         {
            var_235 = param1;
         }
      }
      
      public function get data() : String
      {
         return _data;
      }
      
      public function set localY(param1:Number) : void
      {
         if(!var_187)
         {
            var_1920 = param1;
         }
      }
      
      public function set state(param1:int) : void
      {
         if(!var_187)
         {
            var_31 = param1;
         }
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get localX() : Number
      {
         return var_1918;
      }
      
      public function set data(param1:String) : void
      {
         if(!var_187)
         {
            _data = param1;
         }
      }
      
      public function get wallX() : Number
      {
         return var_2152;
      }
      
      public function get wallY() : Number
      {
         return var_2151;
      }
      
      public function get localY() : Number
      {
         return var_1920;
      }
      
      public function setReadOnly() : void
      {
         var_187 = true;
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get z() : Number
      {
         return var_84;
      }
      
      public function set z(param1:Number) : void
      {
         if(!var_187)
         {
            var_84 = param1;
         }
      }
   }
}
