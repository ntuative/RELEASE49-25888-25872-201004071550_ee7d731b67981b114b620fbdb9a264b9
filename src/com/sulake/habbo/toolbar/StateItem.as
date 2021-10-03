package com.sulake.habbo.toolbar
{
   public class StateItem
   {
       
      
      private var var_1166:Boolean;
      
      private var var_1756:String;
      
      private var _frames:XMLList;
      
      private var var_1019:String = "-1";
      
      private var var_639:String;
      
      private var var_168:int = 120;
      
      private var var_1152:String = "-1";
      
      private var var_1153:String;
      
      private var var_1757:Boolean;
      
      private var var_1451:String = "-1";
      
      private var _id:String;
      
      public function StateItem(param1:XML, param2:String)
      {
         super();
         _id = param1.@id;
         if(param1.attribute("loop").length() > 0)
         {
            var_1166 = Boolean(param1.@loop);
         }
         if(param1.attribute("bounce").length() > 0)
         {
            var_1757 = Boolean(param1.@loop);
         }
         if(param1.attribute("timer").length() > 0)
         {
            var_168 = int(param1.@timer);
         }
         if(param1.attribute("namebase").length() > 0)
         {
            var_1153 = param1.@namebase;
         }
         else
         {
            var_1153 = param2;
         }
         if(param1.attribute("state_over").length() > 0)
         {
            var_1019 = param1.@state_over;
         }
         if(param1.attribute("nextState").length() > 0)
         {
            var_1152 = param1.@nextState;
         }
         else
         {
            var_1152 = _id;
         }
         if(param1.attribute("state_default").length() > 0)
         {
            var_1451 = param1.@state_default;
         }
         if(param1.attribute("tooltip").length() > 0)
         {
            var_1756 = param1.@tooltip;
         }
         if(param1.attribute("background").length() > 0)
         {
            var_639 = param1.@background;
         }
         var _loc3_:XMLList = param1.elements("frame");
         if(_loc3_.length() > 0)
         {
            _frames = _loc3_;
         }
      }
      
      public function get hasStateOver() : Boolean
      {
         return var_1019 != "-1";
      }
      
      public function get bounce() : Boolean
      {
         return var_1757;
      }
      
      public function get defaultState() : String
      {
         return var_1451;
      }
      
      public function get hasDefaultState() : Boolean
      {
         return var_1451 != "-1";
      }
      
      public function get tooltip() : String
      {
         return var_1756;
      }
      
      public function get id() : String
      {
         return _id;
      }
      
      public function get timer() : int
      {
         return var_168;
      }
      
      public function get loop() : Boolean
      {
         return var_1166;
      }
      
      public function get nextState() : String
      {
         return var_1152;
      }
      
      public function get frames() : XMLList
      {
         return _frames;
      }
      
      public function get background() : String
      {
         return var_639;
      }
      
      public function get stateOver() : String
      {
         return var_1019;
      }
      
      public function get nameBase() : String
      {
         return var_1153;
      }
   }
}
