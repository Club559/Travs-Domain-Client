/**
 * Created by club5_000 on 7/27/2016.
 */
package encounter {
  import _05R_.GTween;

  import flash.display.Sprite;
  import flash.events.Event;
  import flash.events.TimerEvent;
  import flash.utils.Timer;

  public class Encounter extends Sprite {
    public static var ACTIVE:Boolean = false;

    private var step:int = 0;
    private var flashSprite:Sprite;
    private var fadeIO:Boolean = true;
    private var rectCount:int = 0;

    public function Encounter() {
      this.flashSprite = new Sprite();
      this.flashSprite.alpha = 0;
      this.flashSprite.graphics.beginFill(0);
      this.flashSprite.graphics.drawRect(0, 0, 800, 600);
      this.flashSprite.graphics.endFill();
      addChild(this.flashSprite);
      focusRect = false;
      addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
    }

    private function onAddedToStage(event:Event):void {
      Encounter.ACTIVE = true;
      addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(event:Event):void {
      stage.focus = this;
      if(this.step < 4) {
        if(this.fadeIO) {
          this.flashSprite.alpha += 0.1;
          if(this.flashSprite.alpha >= 1) {
            this.flashSprite.alpha = 1;
            this.fadeIO = false;
          }
        } else {
          this.flashSprite.alpha -= 0.1;
          if(this.flashSprite.alpha <= 0) {
            this.flashSprite.alpha = 0;
            this.step++;
            this.fadeIO = true;
            if(this.step == 4) {
              var rectTimer:Timer = new Timer(25, 25);
              rectTimer.addEventListener(TimerEvent.TIMER, onRectTimer);
              rectTimer.start();
            }
          }
        }
      }
    }

    private function onRectTimer(event:TimerEvent):void {
      var rect1:EncounterRect = new EncounterRect();
      if(Math.floor(rectCount / 10) % 2 == 0) {
        rect1.x = 50 + ((rectCount % 10) * 100);
      } else {
        rect1.x = 750 - ((rectCount % 10) * 100);
      }
      rect1.y = 60 + (Math.floor(rectCount / 10) * 120);
      var rect2:EncounterRect = new EncounterRect();
      if(Math.floor(rectCount / 10) % 2 == 0) {
        rect2.x = 750 - ((rectCount % 10) * 100);
      } else {
        rect2.x = 50 + ((rectCount % 10) * 100);
      }
      rect2.y = 540 - (Math.floor(rectCount / 10) * 120);
      addChild(rect1);
      addChild(rect2);
      rectCount++;
    }
  }
}
