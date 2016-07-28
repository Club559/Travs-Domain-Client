/**
 * Created by club5_000 on 7/28/2016.
 */
package encounter {
  import flash.display.Sprite;

  public class EncounterBattle extends Sprite {
    public var textBoxSprite:EmbedEncounterTextBox;

    public function EncounterBattle() {
      addChild(new EmbedEncounterBackground());
      this.textBoxSprite = new EmbedEncounterTextBox();
      this.textBoxSprite.y = 336;
      addChild(this.textBoxSprite);
    }
  }
}
