package com.sulake.habbo.sound.object
{
   import com.sulake.habbo.sound.IHabboSound;
   import flash.events.Event;
   import flash.media.Sound;
   import flash.media.SoundChannel;
   import flash.media.SoundTransform;
   
   public class HabboSound implements IHabboSound
   {
       
      
      private var var_964:SoundChannel = null;
      
      private var var_787:Boolean;
      
      private var var_965:Sound = null;
      
      private var var_727:Number;
      
      public function HabboSound(param1:Sound)
      {
         super();
         var_965 = param1;
         var_965.addEventListener(Event.COMPLETE,onComplete);
         var_727 = 1;
         var_787 = false;
      }
      
      public function get finished() : Boolean
      {
         return !var_787;
      }
      
      public function stop() : Boolean
      {
         var_964.stop();
         return true;
      }
      
      public function play() : Boolean
      {
         var_787 = false;
         var_964 = var_965.play(0);
         this.volume = var_727;
         return true;
      }
      
      public function set position(param1:Number) : void
      {
      }
      
      public function get volume() : Number
      {
         return var_727;
      }
      
      public function get ready() : Boolean
      {
         return true;
      }
      
      public function get position() : Number
      {
         return var_964.position;
      }
      
      public function get length() : Number
      {
         return var_965.length;
      }
      
      public function set volume(param1:Number) : void
      {
         var_727 = param1;
         if(var_964 != null)
         {
            var_964.soundTransform = new SoundTransform(var_727);
         }
      }
      
      private function onComplete(param1:Event) : void
      {
         var_787 = true;
      }
   }
}
