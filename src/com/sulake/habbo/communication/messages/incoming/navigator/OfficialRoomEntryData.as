package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1181:int = 4;
      
      public static const const_694:int = 3;
      
      public static const const_679:int = 2;
      
      public static const const_844:int = 1;
       
      
      private var var_2148:String;
      
      private var _disposed:Boolean;
      
      private var var_2030:int;
      
      private var var_2146:Boolean;
      
      private var var_873:String;
      
      private var var_887:PublicRoomData;
      
      private var var_2147:int;
      
      private var _index:int;
      
      private var var_2149:String;
      
      private var _type:int;
      
      private var var_1972:String;
      
      private var var_888:GuestRoomData;
      
      private var var_2145:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         _index = param1.readInteger();
         var_2148 = param1.readString();
         var_2145 = param1.readString();
         var_2146 = param1.readInteger() == 1;
         var_2149 = param1.readString();
         var_873 = param1.readString();
         var_2147 = param1.readInteger();
         var_2030 = param1.readInteger();
         _type = param1.readInteger();
         if(_type == const_844)
         {
            var_1972 = param1.readString();
         }
         else if(_type == const_694)
         {
            var_887 = new PublicRoomData(param1);
         }
         else if(_type == const_679)
         {
            var_888 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return var_2147;
      }
      
      public function get popupCaption() : String
      {
         return var_2148;
      }
      
      public function get userCount() : int
      {
         return var_2030;
      }
      
      public function get open() : Boolean
      {
         return _open;
      }
      
      public function get showDetails() : Boolean
      {
         return var_2146;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_844)
         {
            return 0;
         }
         if(this.type == const_679)
         {
            return this.var_888.maxUserCount;
         }
         if(this.type == const_694)
         {
            return this.var_887.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return var_2145;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         if(this.var_888 != null)
         {
            this.var_888.dispose();
            this.var_888 = null;
         }
         if(this.var_887 != null)
         {
            this.var_887.dispose();
            this.var_887 = null;
         }
      }
      
      public function get index() : int
      {
         return _index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return var_888;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function get picText() : String
      {
         return var_2149;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return var_887;
      }
      
      public function get picRef() : String
      {
         return var_873;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tag() : String
      {
         return var_1972;
      }
      
      public function toggleOpen() : void
      {
         _open = !_open;
      }
   }
}
