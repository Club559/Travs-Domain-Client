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
    private var doneTimer:Timer;
    private var coverRect1:Sprite;
    private var coverRect2:Sprite;
    private var encounterBattle:EncounterBattle;

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
          this.flashSprite.alpha += 0.125;
          if(this.flashSprite.alpha >= 1) {
            this.flashSprite.alpha = 1;
            this.fadeIO = false;
          }
        } else {
          this.flashSprite.alpha -= 0.125;
          if(this.flashSprite.alpha <= 0) {
            this.flashSprite.alpha = 0;
            this.step++;
            this.fadeIO = true;
            if(this.step == 4) {
              var rectTimer:Timer = new Timer(25, 25);
              rectTimer.addEventListener(TimerEvent.TIMER, onRectTimer);
              rectTimer.start();

              doneTimer = new Timer(1500, 0);
              doneTimer.addEventListener(TimerEvent.TIMER, onDoneTimer);
              doneTimer.start();
            }
          }
        }
      }
      if(this.coverRect1 != null) {
        this.coverRect1.y -= 5;
        if(this.coverRect1.y <= -300) {
          removeChild(this.coverRect1);
          this.coverRect1 = null;
        }
      }
      if(this.coverRect2 != null) {
        this.coverRect2.y += 5;
        if(this.coverRect2.y >= 600) {
          removeChild(this.coverRect2);
          this.coverRect2 = null;
        }
      }
    }

    private function onDoneTimer(event:TimerEvent):void {
      doneTimer.stop();

      this.encounterBattle = new EncounterBattle();
      this.encounterBattle.x = 40;
      this.encounterBattle.y = 60;
      addChild(this.encounterBattle);

      this.coverRect1 = new Sprite();
      this.coverRect1.graphics.beginFill(0);
      this.coverRect1.graphics.drawRect(0, 0, 800, 300);
      this.coverRect1.graphics.endFill();
      addChild(this.coverRect1);
      this.coverRect2 = new Sprite();
      this.coverRect2.graphics.beginFill(0);
      this.coverRect2.graphics.drawRect(0, 0, 800, 300);
      this.coverRect2.graphics.endFill();
      this.coverRect2.y = 300;
      addChild(this.coverRect2);
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
