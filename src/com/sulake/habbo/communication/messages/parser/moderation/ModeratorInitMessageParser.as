package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.moderation.OffenceCategoryData;
   
   public class ModeratorInitMessageParser implements IMessageParser
   {
       
      
      private var _roomMessageTemplates:Array;
      
      private var var_1814:Boolean;
      
      private var var_1461:Array;
      
      private var var_1813:Boolean;
      
      private var var_1811:Boolean;
      
      private var var_1812:Boolean;
      
      private var var_155:Array;
      
      private var var_1815:Boolean;
      
      private var var_1810:Boolean;
      
      private var var_1462:Array;
      
      private var var_1817:Boolean;
      
      private var var_1816:Boolean;
      
      public function ModeratorInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get banPermission() : Boolean
      {
         return var_1816;
      }
      
      public function get roomKickPermission() : Boolean
      {
         return var_1814;
      }
      
      public function get alertPermission() : Boolean
      {
         return var_1813;
      }
      
      public function get cfhPermission() : Boolean
      {
         return var_1815;
      }
      
      public function get roomMessageTemplates() : Array
      {
         return _roomMessageTemplates;
      }
      
      public function get roomAlertPermission() : Boolean
      {
         return var_1810;
      }
      
      public function get messageTemplates() : Array
      {
         return var_1461;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc2_:IssueInfoMessageParser = new IssueInfoMessageParser();
         var_155 = [];
         var_1461 = [];
         _roomMessageTemplates = [];
         var_1462 = [];
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            if(!_loc2_.parse(param1))
            {
               return false;
            }
            var_155.push(_loc2_.issueData);
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1461.push(param1.readString());
            _loc4_++;
         }
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            var_1462.push(new OffenceCategoryData(param1));
            _loc4_++;
         }
         var_1815 = param1.readBoolean();
         var_1812 = param1.readBoolean();
         var_1813 = param1.readBoolean();
         var_1811 = param1.readBoolean();
         var_1816 = param1.readBoolean();
         var_1810 = param1.readBoolean();
         var_1814 = param1.readBoolean();
         _loc3_ = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            _roomMessageTemplates.push(param1.readString());
            _loc4_++;
         }
         var_1817 = param1.readBoolean();
         return true;
      }
      
      public function get kickPermission() : Boolean
      {
         return var_1811;
      }
      
      public function get offenceCategories() : Array
      {
         return var_1462;
      }
      
      public function get issues() : Array
      {
         return var_155;
      }
      
      public function get bobbaFilterPermission() : Boolean
      {
         return var_1817;
      }
      
      public function get chatlogsPermission() : Boolean
      {
         return var_1812;
      }
   }
}
