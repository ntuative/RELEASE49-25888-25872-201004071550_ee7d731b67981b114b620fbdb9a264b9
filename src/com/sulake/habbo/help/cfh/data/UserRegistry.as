package com.sulake.habbo.help.cfh.data
{
   import com.sulake.core.utils.Map;
   
   public class UserRegistry
   {
      
      private static const const_1074:int = 80;
       
      
      private var var_506:Map;
      
      private var var_701:String = "";
      
      private var var_1244:Array;
      
      public function UserRegistry()
      {
         var_506 = new Map();
         var_1244 = new Array();
         super();
      }
      
      private function addRoomNameForMissing() : void
      {
         var _loc1_:* = null;
         while(false)
         {
            _loc1_ = var_506.getValue(var_1244.shift());
            if(_loc1_ != null)
            {
               _loc1_.roomName = var_701;
            }
         }
      }
      
      public function registerUser(param1:int, param2:String, param3:Boolean = true) : void
      {
         var _loc4_:* = null;
         if(var_506.getValue(param1) != null)
         {
            var_506.remove(param1);
         }
         if(param3)
         {
            _loc4_ = new UserRegistryItem(param1,param2,var_701);
         }
         else
         {
            _loc4_ = new UserRegistryItem(param1,param2);
         }
         if(param3 && var_701 == "")
         {
            var_1244.push(param1);
         }
         var_506.add(param1,_loc4_);
         purgeUserIndex();
      }
      
      public function getRegistry() : Map
      {
         return var_506;
      }
      
      public function unregisterRoom() : void
      {
         var_701 = "";
      }
      
      private function purgeUserIndex() : void
      {
         var _loc1_:int = 0;
         while(var_506.length > const_1074)
         {
            _loc1_ = var_506.getKey(0);
            var_506.remove(_loc1_);
         }
      }
      
      public function registerRoom(param1:String) : void
      {
         var_701 = param1;
         if(var_701 != "")
         {
            addRoomNameForMissing();
         }
      }
   }
}
