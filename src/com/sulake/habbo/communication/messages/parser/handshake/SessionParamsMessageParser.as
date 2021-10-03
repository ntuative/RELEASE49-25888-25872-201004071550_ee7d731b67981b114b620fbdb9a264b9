package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class SessionParamsMessageParser implements IMessageParser
   {
       
      
      protected var var_1384:Boolean;
      
      protected var var_2275:Boolean;
      
      protected var var_1380:Boolean;
      
      protected var var_663:String;
      
      protected var _confPartnerIntegration:Boolean;
      
      protected var var_2274:String;
      
      protected var var_2276:Boolean;
      
      protected var var_1381:Boolean;
      
      protected var var_1382:Boolean;
      
      protected var var_1383:Boolean;
      
      public function SessionParamsMessageParser()
      {
         super();
      }
      
      public function get tutorialEnabled() : Boolean
      {
         return var_2275;
      }
      
      public function get parentEmailRequired() : Boolean
      {
         return var_1381;
      }
      
      public function flush() : Boolean
      {
         var_1383 = false;
         var_1382 = false;
         var_663 = "";
         var_1381 = false;
         var_1384 = false;
         var_1380 = false;
         _confPartnerIntegration = false;
         var_2276 = false;
         var_2274 = "";
         var_2275 = false;
         return true;
      }
      
      public function get tracking_header() : String
      {
         return var_2274;
      }
      
      public function get parentEmailRequiredInReRegistration() : Boolean
      {
         return var_1384;
      }
      
      public function get allowProfileEditing() : Boolean
      {
         return var_2276;
      }
      
      public function get allowDirectEmail() : Boolean
      {
         return var_1380;
      }
      
      public function get voucher() : Boolean
      {
         return var_1382;
      }
      
      public function get confPartnerIntegration() : Boolean
      {
         return _confPartnerIntegration;
      }
      
      public function get coppa() : Boolean
      {
         return var_1383;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:int = param1.readInteger();
         Logger.log("[Parser.SessionParams] Got " + _loc2_ + " pairs");
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readInteger();
            Logger.log("[Parser.SessionParams] Got id: " + _loc4_);
            switch(_loc4_)
            {
               case 0:
                  _loc5_ = param1.readInteger();
                  var_1383 = _loc5_ > 0;
                  break;
               case 1:
                  _loc5_ = param1.readInteger();
                  var_1382 = _loc5_ > 0;
                  break;
               case 2:
                  _loc5_ = param1.readInteger();
                  var_1381 = _loc5_ > 0;
                  break;
               case 3:
                  _loc5_ = param1.readInteger();
                  var_1384 = _loc5_ > 0;
                  break;
               case 4:
                  _loc5_ = param1.readInteger();
                  var_1380 = _loc5_ > 0;
                  break;
               case 5:
                  _loc6_ = param1.readString();
                  break;
               case 6:
                  _loc5_ = param1.readInteger();
                  break;
               case 7:
                  _loc5_ = param1.readInteger();
                  break;
               case 8:
                  _loc7_ = param1.readString();
                  break;
               case 9:
                  _loc5_ = param1.readInteger();
                  break;
               default:
                  Logger.log("Unknown id: " + _loc4_);
                  break;
            }
            _loc3_++;
         }
         return true;
      }
      
      public function get date() : String
      {
         return var_663;
      }
   }
}
