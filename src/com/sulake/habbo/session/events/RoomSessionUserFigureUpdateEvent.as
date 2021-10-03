package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionUserFigureUpdateEvent extends RoomSessionEvent
   {
      
      public static const const_140:String = "RSUBE_FIGURE";
       
      
      private var var_693:String = "";
      
      private var var_308:String = "";
      
      private var _userId:int = 0;
      
      public function RoomSessionUserFigureUpdateEvent(param1:IRoomSession, param2:int, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_140,param1,param5,param6);
         _userId = param2;
         var_308 = param3;
         var_693 = param4;
      }
      
      public function get gender() : String
      {
         return var_693;
      }
      
      public function get figure() : String
      {
         return var_308;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
   }
}
