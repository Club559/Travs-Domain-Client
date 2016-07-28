/**
 * Created by club5_000 on 7/28/2016.
 */
package encounter {
  import com.company.assembleegameclient.appengine.SavedCharacter;
  import com.company.assembleegameclient.game.GameSprite;
  import com.company.assembleegameclient.objects.ObjectLibrary;
  import com.company.assembleegameclient.objects.Player;
  import com.company.assembleegameclient.util.TextureRedrawer;
  import com.company.assembleegameclient.util._0B_c;
  import com.company.assembleegameclient.util._J_H_;
  import com.company.assembleegameclient.util._lJ_;
  import com.company.ui.SimpleText;
  import com.company.util._G_;

  import flash.display.Bitmap;

  import flash.display.BitmapData;

  import flash.display.Sprite;
  import flash.events.Event;
  import flash.events.TimerEvent;
  import flash.geom.ColorTransform;
  import flash.utils.Timer;

  public class EncounterBattle extends Sprite {
    private var gs:GameSprite;
    private var characterSprite:Bitmap;
    private var textBoxSprite:EmbedEncounterTextBox;
    private var textBox:SimpleText;
    private var desiredText:String = "";
    private var textPosition:int = 0;
    private var textTimer:Timer;

    public function EncounterBattle(gs:GameSprite) {
      this.gs = gs;
      addChild(new EmbedEncounterBackground());
      var cimg:BitmapData = getCharacterImage(gs.map_.player_);
      this.characterSprite = new Bitmap(cimg);
      this.characterSprite.scaleX = 3;
      this.characterSprite.scaleY = 3;
      this.characterSprite.x = 100;
      this.characterSprite.y = 200;
      addChild(this.characterSprite);
      this.textBoxSprite = new EmbedEncounterTextBox();
      this.textBoxSprite.y = 336;
      addChild(this.textBoxSprite);
      this.textBox = new SimpleText(26, 0xFFFFFF, false, 672, 102);
      this.textBox.x = 26;
      this.textBox.y = this.textBoxSprite.y + 21;
      this.textBox.wordWrap = true;
      addChild(this.textBox);

      this.textTimer = new Timer(25);
      this.textTimer.addEventListener(TimerEvent.TIMER, onTextTimer);
      addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
      addEventListener(Event.REMOVED_FROM_STAGE, onRemovedFromStage);
    }

    private function onRemovedFromStage(event:Event):void {
      removeEventListener(Event.ENTER_FRAME, onEnterFrame);
      this.textTimer.stop();
    }

    private function onAddedToStage(event:Event):void {
      addEventListener(Event.ENTER_FRAME, onEnterFrame);
      this.textTimer.start();
    }

    private function onEnterFrame(event:Event):void {
      this.textBox.text = this.desiredText.substr(0, this.textPosition);
    }

    private function onTextTimer(event:TimerEvent):void {
      if(this.textPosition < this.desiredText.length) {
        this.textPosition++;
      }
    }

    private function getCharacterImage(_arg1:Player):BitmapData {
      var _local9:_J_H_ = _arg1._yN_.imageFromDir(_lJ_.RIGHT, _lJ_._sS_, 0);
      var _local12:BitmapData = TextureRedrawer.resize(_local9.image_, _local9.mask_, 100, false, _arg1.tex1Id_, _arg1.tex2Id_);
      _local12 = TextureRedrawer.outlineGlow(_local12, 0, _arg1._2v == -1 ? 0 : _arg1._2v);
      return (_local12);
    }

    public function setText(_arg1:String, _instant:Boolean=false):void {
      if(!_instant) {
        this.textBox.text = "";
        this.textBox.updateMetrics();
        this.desiredText = _arg1;
        this.textPosition = 0;
      } else {
        this.textBox.text = _arg1;
        this.textBox.updateMetrics();
        this.desiredText = _arg1;
        this.textPosition = desiredText.length;
      }
    }

    public function start():void {
      this.setText("Wild NOTHING appeared!");
    }
  }
}
