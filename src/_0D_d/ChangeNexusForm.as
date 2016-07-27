/**
 * Created by club5_000 on 9/13/2014.
 */
package _0D_d {
    import com.company.assembleegameclient.game.GameSprite;
    import com.company.util._H_V_;

    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;

    public class ChangeNexusForm extends Frame {

        public function ChangeNexusForm(_gs:GameSprite) {
            super("Text input", "Cancel", "Confirm", "/textInput");
            this.gs_ = _gs;
            this._0D_6("Really set your nexus here?");
            Button1.addEventListener(MouseEvent.CLICK, this.close);
            Button2.addEventListener(MouseEvent.CLICK, this.confirm);
        }
        private var gs_:GameSprite;

        private function _0_c():void {
            stage.focus = null;
            dispatchEvent(new Event(Event.COMPLETE));
        }

        private function close(e:Event):void {
            _0_c();
        }

        private function confirm(event:MouseEvent):void {
            gs_.gsc_.changeNexus();
            _0_c();
        }
    }
}
