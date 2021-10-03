package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_125:String = "RWPUE_VOTE_RESULT";
      
      public static const const_131:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1211:int;
      
      private var var_963:String;
      
      private var var_680:Array;
      
      private var var_988:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         var_963 = param2;
         var_988 = param3;
         var_680 = param4;
         if(var_680 == null)
         {
            var_680 = [];
         }
         var_1211 = param5;
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
