/**
 * Created by club5_000 on 7/27/2016.
 */
package encounter {
  import flash.display.Sprite;
  import flash.events.Event;

  public class EncounterRect extends Sprite {
    public function EncounterRect() {
      this.graphics.beginFill(0);
      this.graphics.drawRect(-50, -60, 100, 120);
      this.graphics.endFill();
      this.scaleX = 0;
      //this.scaleY = 0;
      this.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }

    private function onEnterFrame(event:Event):void {
      this.scaleX += 0.1;
      //this.scaleY += 0.1;
      if(this.scaleX >= 1) {
        this.scaleX = 1;
        //this.scaleY = 1;
        this.removeEventListener(Event.ENTER_FRAME, onEnterFrame);
      }
    }
  }
}
