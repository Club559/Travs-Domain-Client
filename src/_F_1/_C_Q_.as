// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_F_1._C_Q_

package _F_1 {
import _02t._R_f;

import _ke.Buttons;

import _qN_.Account;

import _sp._aJ_;

import com.company.assembleegameclient.appengine._0K_R_;
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.rotmg.graphics.*;
import com.company.ui.SimpleText;

import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;
import flash.net.URLRequest;
import flash.net.navigateToURL;
import flash.system.Capabilities;

public class _C_Q_ extends _05p {

    private static const webUrl_:String = "http://forum.zerorealms.com";

    public function _C_Q_() {
        addChild(new _R_f());
        super(_C_Q_);
        addChild(new TitleScreenGraphic());
        this._ft = new _aJ_(String);
    }
    public var _ft:_aJ_;
    private var _qR_:_H_o;
    private var _2z:_H_o;
    private var _2x:_H_o;
    private var _0_W_:_H_o;
    private var _bP_:_H_o;
    private var _04A_:_H_o;
    private var _14A_:_H_o;
    private var webButton:_H_o;
    private var _T_w:SimpleText;
    private var _06K_:SimpleText;
    private var _T_1:_0K_R_;

    override public function initialize(_arg1:_0K_R_):void {
        super.initialize(_arg1);
        this._T_1 = _arg1;
        this._qR_ = new _H_o(Buttons.PLAY, 36, true);
        if (!_T_1.servers_.length == 0 || Account._get().isRegistered()) {
            this._qR_.addEventListener(MouseEvent.CLICK, this._021);
        } else {
            this._qR_.addEventListener(MouseEvent.CLICK, this.reg_);
        }
        addChild(this._qR_);
        this._2z = new _H_o(Buttons.SERVERS, 22, false);
        this._2z.addEventListener(MouseEvent.CLICK, this._021);
        addChild(this._2z);
        this._2x = new _H_o(Buttons.CREDITS, 22, false);
        this._2x.addEventListener(MouseEvent.CLICK, this._021);
        addChild(this._2x);
        this._0_W_ = new _H_o(Buttons.ACCOUNT, 22, false);
        this._0_W_.addEventListener(MouseEvent.CLICK, this._021);
        addChild(this._0_W_);
        this._bP_ = new _H_o(Buttons.LEGENDS, 22, false);
        this._bP_.addEventListener(MouseEvent.CLICK, this._021);
        addChild(this._bP_);
        this._04A_ = new _H_o(Buttons.EDITOR, 22, false);
        this._04A_.addEventListener(MouseEvent.CLICK, this._021);
        this._04A_.visible = Account._get().isRegistered();
        addChild(this._04A_);
        this._14A_ = new _H_o(Buttons.SPRITE, 22, false);
        this._14A_.addEventListener(MouseEvent.CLICK, this._021);
        this._14A_.visible = Account._get().isRegistered();
        addChild(this._14A_);
        this.webButton = new _H_o(Buttons.FORUMS, 22, false);
        this.webButton.addEventListener(MouseEvent.CLICK, this._021);
        addChild(this.webButton);
        this._T_w = new SimpleText(12, 0x7F7F7F, false, 0, 0, "Myriad Pro");
        this._T_w.htmlText = (Parameters.isTesting ? (Parameters._I_O_() ? "Testing " : "") : '<font color="#ff0000">DEVELOPMENT</font> ') + "v" + Parameters.clientVersion;
        this._T_w.updateMetrics();
        this._T_w.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this._T_w);
        this._06K_ = new SimpleText(12, 0x7F7F7F, false, 0, 0, "Myriad Pro");
        this._06K_.text = "© 2014 by Zero Realms.";
        this._06K_.updateMetrics();
        this._06K_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this._06K_);
        stage;
        this._qR_.x = ((800 / 2) - (this._qR_.width / 2));
        this._qR_.y = 524;
        stage;
        this._2z.x = (((800 / 2) - (this._2z.width / 2)) - 94);
        this._2z.y = 534;
        this._2x.x = 180;
        this._2x.y = 534;
        stage;
        this._0_W_.x = (((800 / 2) - (this._0_W_.width / 2)) + 96);
        this._0_W_.y = 534;
        this._bP_.x = 550;
        this._bP_.y = 534;
        this._04A_.x = 100;
        this._04A_.y = 544;
        this._14A_.x = 100;
        this._14A_.y = 524;
        this.webButton.x = 645;
        this.webButton.y = 534;
        stage;
        this._T_w.y = (600 - this._T_w.height);
        stage;
        this._06K_.x = (800 - this._06K_.width);
        stage;
        this._06K_.y = (600 - this._06K_.height);
    }

    private function _021(_arg1:MouseEvent):void {
        var _local2:_H_o = (_arg1.target as _H_o);
        this._ft.dispatch(_local2.name);
    }

    private function reg_(_arg1:MouseEvent):void {
        var _local2:_H_o = (_arg1.target as _H_o);
        if (_local2.name == "PLAY") {
            _local2.name = "ACCOUNT";
        }
        this._ft.dispatch(_local2.name);
    }

    private function onClick(_arg1:MouseEvent):void {
        navigateToURL(new URLRequest(webUrl_), "_blank");
    }

}
}//package _F_1

