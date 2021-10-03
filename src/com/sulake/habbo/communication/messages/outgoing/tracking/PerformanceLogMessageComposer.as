package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_1079:int = 0;
      
      private var var_1151:int = 0;
      
      private var var_1743:String = "";
      
      private var var_1080:int = 0;
      
      private var var_1748:String = "";
      
      private var var_1746:int = 0;
      
      private var var_1564:String = "";
      
      private var var_1742:int = 0;
      
      private var var_1744:int = 0;
      
      private var var_1747:String = "";
      
      private var var_1745:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1742 = param1;
         var_1747 = param2;
         var_1564 = param3;
         var_1743 = param4;
         var_1748 = param5;
         if(param6)
         {
            var_1151 = 1;
         }
         else
         {
            var_1151 = 0;
         }
         var_1746 = param7;
         var_1744 = param8;
         var_1080 = param9;
         var_1745 = param10;
         var_1079 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1742,var_1747,var_1564,var_1743,var_1748,var_1151,var_1746,var_1744,var_1080,var_1745,var_1079];
      }
      
      public function dispose() : void
      {
      }
   }
}
