package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_550:int = 6;
      
      public static const const_226:int = 5;
      
      public static const const_692:int = 2;
      
      public static const const_299:int = 9;
      
      public static const const_322:int = 4;
      
      public static const const_273:int = 2;
      
      public static const const_732:int = 4;
      
      public static const const_200:int = 8;
      
      public static const const_646:int = 7;
      
      public static const const_253:int = 3;
      
      public static const const_330:int = 1;
      
      public static const const_222:int = 5;
      
      public static const const_472:int = 12;
      
      public static const const_306:int = 1;
      
      public static const const_551:int = 11;
      
      public static const const_507:int = 3;
      
      public static const const_1579:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_434:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_434 = new Array();
         var_434.push(new Tab(_navigator,const_330,const_472,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_382));
         var_434.push(new Tab(_navigator,const_273,const_306,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_382));
         var_434.push(new Tab(_navigator,const_322,const_551,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_821));
         var_434.push(new Tab(_navigator,const_253,const_226,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_382));
         var_434.push(new Tab(_navigator,const_222,const_200,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_715));
         setSelectedTab(const_330);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_434)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_434)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_434)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_322;
      }
      
      public function get tabs() : Array
      {
         return var_434;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}
