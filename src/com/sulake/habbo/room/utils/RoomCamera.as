package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_344:Number = 0.5;
      
      private static const const_753:int = 3;
      
      private static const const_1043:Number = 1;
       
      
      private var var_1717:Boolean = false;
      
      private var var_1714:Boolean = false;
      
      private var var_962:int = 0;
      
      private var var_247:Vector3d = null;
      
      private var var_1712:int = 0;
      
      private var var_1715:int = 0;
      
      private var var_1713:Boolean = false;
      
      private var var_1720:int = -2;
      
      private var var_1716:Boolean = false;
      
      private var var_1719:int = 0;
      
      private var var_1721:int = -1;
      
      private var var_391:Vector3d = null;
      
      private var var_1718:int = 0;
      
      public function RoomCamera()
      {
         super();
      }
      
      public function get roomWd() : int
      {
         return var_1712;
      }
      
      public function get targetId() : int
      {
         return var_1721;
      }
      
      public function set roomHt(param1:int) : void
      {
         var_1719 = param1;
      }
      
      public function set roomWd(param1:int) : void
      {
         var_1712 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         var_1717 = param1;
      }
      
      public function set targetId(param1:int) : void
      {
         var_1721 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         var_1714 = param1;
      }
      
      public function dispose() : void
      {
         var_391 = null;
         var_247 = null;
      }
      
      public function set target(param1:IVector3d) : void
      {
         if(var_391 == null)
         {
            var_391 = new Vector3d();
         }
         var_391.assign(param1);
         var_962 = 0;
      }
      
      public function get targetCategory() : int
      {
         return var_1720;
      }
      
      public function get screenHt() : int
      {
         return var_1718;
      }
      
      public function set screenWd(param1:int) : void
      {
         var_1715 = param1;
      }
      
      public function get location() : IVector3d
      {
         return var_247;
      }
      
      public function set screenHt(param1:int) : void
      {
         var_1718 = param1;
      }
      
      public function get roomHt() : int
      {
         return var_1719;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return var_1717;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return var_1714;
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         if(var_391 != null && var_247 != null)
         {
            ++var_962;
            _loc2_ = Vector3d.dif(var_391,var_247);
            if(_loc2_.length <= const_344)
            {
               var_247 = var_391;
               var_391 = null;
            }
            else
            {
               _loc2_.div(_loc2_.length);
               if(_loc2_.length < const_344 * (const_753 + 1))
               {
                  _loc2_.mul(const_344);
               }
               else if(var_962 <= const_753)
               {
                  _loc2_.mul(const_344);
               }
               else
               {
                  _loc2_.mul(const_1043);
               }
               var_247 = Vector3d.sum(var_247,_loc2_);
            }
         }
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         var_1713 = param1;
      }
      
      public function get screenWd() : int
      {
         return var_1715;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         var_1716 = param1;
      }
      
      public function set targetCategory(param1:int) : void
      {
         var_1720 = param1;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(var_247 != null)
         {
            return;
         }
         var_247 = new Vector3d();
         var_247.assign(param1);
      }
      
      public function get centeredLocX() : Boolean
      {
         return var_1713;
      }
      
      public function get centeredLocY() : Boolean
      {
         return var_1716;
      }
   }
}
