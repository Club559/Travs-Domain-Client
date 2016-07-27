/**
 * Created by club5_000 on 9/1/2015.
 */
package _E_7 {

    import com.company.assembleegameclient.objects.ObjectLibrary;
    import com.company.assembleegameclient.ui._return;
    import com.company.assembleegameclient.util.AbilityLibrary;
    import com.company.ui.SimpleText;
    import com.company.util.BitmapUtil;

    import flash.display.Bitmap;
    import flash.display.BitmapData;
    import flash.display.DisplayObject;
    import flash.filters.DropShadowFilter;

    public class AbilityToolTip extends _for_ {
        private static const maxWidth:int = 286;
        private static const fontName:String = "CHIP SB";
        private static const fontSize:int = 16;

        public function AbilityToolTip(_arg1:int) {
            this.abilityType_ = _arg1;
            this.abilityXML_ = AbilityLibrary.TypeToXML[this.abilityType_];
            super(0x363636, 1, 0x9B9B9B, 1, true);
            this.init();
        }

        public var abilityType_:int;
        public var abilityXML_:XML;
        private var icon_:Bitmap;
        private var name_:SimpleText;
        private var desc_:SimpleText;
        private var stats_:SimpleText;
        private var effs_:Vector.<Effect>;
        private var nextPos_:int;

        private function init():void {
            this.initIcon();
            this.initName();
            this.initDesc();

            this.initMpCost();
            this.initCooldown();

            this.initStats();
        }

        private function initIcon():void {
            var _local1:BitmapData = AbilityLibrary.getIcon(this.abilityType_);
            this.icon_ = new Bitmap(_local1);
            this.effs_ = new Vector.<Effect>();
            addChild(this.icon_);
            nextPos(this.icon_);
        }

        private function initName():void {
            this.name_ = new SimpleText(fontSize + 2, 0xFFFFFF, false, (((maxWidth - this.icon_.width) - 4) - 30), 0, fontName);
            this.name_.setBold(true);
            this.name_.wordWrap = true;
            this.name_.text = AbilityLibrary.TypeToId[this.abilityType_];
            this.name_.updateMetrics();
            this.name_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
            this.name_.x = this.icon_.width + 4;
            this.name_.y = (this.icon_.height / 2) - (this.name_._I_x / 2);
            addChild(this.name_);
        }

        private function initDesc():void {
            this.desc_ = new SimpleText(fontSize, 0xB3B3B3, false, maxWidth, 0, fontName);
            this.desc_.wordWrap = true;
            this.desc_.text = String(this.abilityXML_.Description);
            this.desc_.updateMetrics();
            this.desc_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
            this.desc_.x = 4;
            this.desc_.y = nextPos()+4;
            addChild(this.desc_);
            nextPos(this.desc_);
        }

        private function initStats():void {
            if(this.effs_.length != 0) {
                this.addLine(nextPos());
                this.stats_ = new SimpleText(fontSize, 0xB3B3B3, false, ((maxWidth - 4)), 0, fontName);
                this.stats_.wordWrap = true;
                this.stats_.htmlText = this._41(this.effs_);
                this.stats_._08S_();
                this.stats_.filters = [new DropShadowFilter(0, 0, 0, 0.5, 12, 12)];
                this.stats_.x = 4;
                this.stats_.y = nextPos();
                addChild(this.stats_);
            }
        }

        private function initMpCost():void {
            var _local1:int = 0;
            if(this.abilityXML_.hasOwnProperty("MpCost")) {
                _local1 = int(this.abilityXML_.MpCost);
            }
            this.effs_.push(new Effect("MP Cost", String(_local1)));
        }

        private function initCooldown():void {
            if(this.abilityXML_.hasOwnProperty("Cooldown")) {
                this.effs_.push(new Effect("Cooldown", String(int(this.abilityXML_.Cooldown)/1000)));
            }
        }

        private function addLine(_arg1:int):void {
            var _local1:_return = new _return(maxWidth - 12, 0);
            _local1.x = 8;
            _local1.y = _arg1;
            addChild(_local1);
            nextPos(_local1);
        }

        private function _41(_arg1:Vector.<Effect>):String {
            var _local4:Effect;
            var _local5:String;
            var _local2:String = "";
            var _local3:Boolean = true;
            for each (_local4 in _arg1) {
                _local5 = "#FFFF8F";
                if (!_local3) {
                    _local2 = (_local2 + "\n");
                } else {
                    _local3 = false;
                }
                if (_local4.name_ != "") {
                    _local2 = (_local2 + (_local4.name_ + ": "));
                }
                _local2 = (_local2 + (((('<font color="' + _local5) + '">') + _local4.value_) + "</font>"));
            }
            return (_local2);
        }

        private function nextPos(_arg1:DisplayObject=null):int {
            if(_arg1 != null) {
                nextPos_ = _arg1.y + _arg1.height;
            }
            return nextPos_;
        }
    }
}

class Effect {

    public var name_:String;
    public var value_:String;

    public function Effect(_arg1:String, _arg2:String) {
        this.name_ = _arg1;
        this.value_ = _arg2;
    }
}
class Restriction {

    public var text_:String;
    public var color_:uint;
    public var bold_:Boolean;

    public function Restriction(_arg1:String, _arg2:uint, _arg3:Boolean) {
        this.text_ = _arg1;
        this.color_ = _arg2;
        this.bold_ = _arg3;
    }
}