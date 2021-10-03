package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_125:String = "RSPE_VOTE_RESULT";
      
      public static const const_131:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1211:int = 0;
      
      private var var_963:String = "";
      
      private var var_680:Array;
      
      private var var_988:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         var_988 = [];
         var_680 = [];
         super(param1,param2,param7,param8);
         var_963 = param3;
         var_988 = param4;
         var_680 = param5;
         if(var_680 == null)
         {
            var_680 = [];
         }
         var_1211 = param6;
      }
      
      public function get votes() : Array
      {
         return var_680.slice();
      }
      
      public function get totalVotes() : int
      {
         return var_1211;
      }
      
      public function get question() : String
      {
         return var_963;
      }
      
      public function get choices() : Array
      {
         return var_988.slice();
      }
   }
}
