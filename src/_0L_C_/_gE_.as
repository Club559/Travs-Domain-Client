/**
 * Created by Thelzar on 7/1/2014.
 */

package _0L_C_ {
import flash.events.Event;

public class _gE_ extends _qO_ {

        public function _gE_() {
            super("You do not have enough Souls for this item.  " + "You gain Souls when you kill Bosses " + "in the Seraphs Castle.", "Not Enough Souls", "Ok", null, "/notEnoughSouls");
            addEventListener(BUTTON1_EVENT, this._G1_);
        }

        public function _G1_(_arg1:Event):void {
            parent.removeChild(this);
        }
    }
}
