package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class NavigationNodeData
   {
       
      
      private var var_1158:int;
      
      private var var_1438:String;
      
      public function NavigationNodeData(param1:int, param2:String)
      {
         super();
         var_1158 = param1;
         var_1438 = param2;
         Logger.log("READ NODE: " + var_1158 + ", " + var_1438);
      }
      
      public function get nodeName() : String
      {
         return var_1438;
      }
      
      public function get nodeId() : int
      {
         return var_1158;
      }
   }
}
