// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._T_W_

package com.company.assembleegameclient.ui {
    import _011.ItemSelectStart;

    import _qN_.Account;

import com.company.assembleegameclient.game.GameSprite;
import com.company.assembleegameclient.objects.Player;
import com.company.assembleegameclient.parameters.Parameters;
import com.company.googleanalytics.GA;
import com.company.ui.SimpleText;
import com.company.util.AssetLibrary;

import flash.display.Bitmap;
import flash.display.Sprite;
import flash.events.Event;
import flash.events.KeyboardEvent;
import flash.events.MouseEvent;
import flash.filters.DropShadowFilter;

import _0C_P_.Options;

public class _T_W_ extends Sprite {

    public function _T_W_(_arg1:GameSprite, _arg2:Player, _arg3:int, _arg4:int) {
        this.gs_ = _arg1;
        this.go_ = _arg2;
        this.w_ = _arg3;
        this.h_ = _arg4;
        this._tm = new Bitmap(null);
        this._tm.x = -2;
        this._tm.y = -10;
        addChild(this._tm);
        this.nameText_ = new SimpleText(20, 0xB3B3B3, false, 0, 0, "Myriad Pro");
        this.nameText_.setBold(true);
        this.nameText_.x = 36;
        this.nameText_.y = -2;
        if (this.gs_.charList_.name_ == null) {
            this.nameText_.text = this.go_.name_;
        } else {
            this.nameText_.text = this.gs_.charList_.name_;
        }
        this.nameText_.updateMetrics();
        this.nameText_.filters = [new DropShadowFilter(0, 0, 0)];
        addChild(this.nameText_);
        if (this.gs_.gsc_.gameId_ != Parameters.NEXUS_ID) {
            this._nw = new _rN_(AssetLibrary._xK_("lofiInterfaceBig", 6), "Nexus", "escapeToNexus");
            this._nw.addEventListener(MouseEvent.CLICK, this._Q_C_);
            this._nw.x = 172;
            this._nw.y = 2;
            addChild(this._nw);
        } else {
            this._nw = new _rN_(AssetLibrary._xK_("lofiInterfaceBig", 5), "Options", "options");
            this._nw.addEventListener(MouseEvent.CLICK, this._nD_);
            this._nw.x = 172;
            this._nw.y = 2;
            addChild(this._nw);
        }
        this._sI_ = new _0M_Y_(176, 16, 5931045, 0x545454, "Lvl X");
        this._sI_.x = 12;
        this._sI_.y = 30;
        addChild(this._sI_);
        this._sI_.visible = true;
        this._U_U_ = new _0M_Y_(176, 16, 0xE25F00, 0x545454, "Fame");
        this._U_U_.x = 12;
        this._U_U_.y = 30;
        addChild(this._U_U_);
        this._U_U_.visible = false;
        this._023 = new _0M_Y_(176, 16, 14693428, 0x545454, "HP");
        this._023.x = 12;
        this._023.y = 54;
        addChild(this._023);
        this._F_C_ = new _0M_Y_(176, 16, 6325472, 0x545454, "MP");
        this._F_C_.x = 12;
        this._F_C_.y = 78;
        addChild(this._F_C_);
        this.equips_ = new Inventory(_arg1, _arg2, "Inventory", _arg2._9A_.slice(0, 4), 4, true, 0, true);
        this.equips_.x = 14;
        this.equips_.y = 104;
        addChild(this.equips_);
        this.tabList_ = [];
        this.invTab_ = new TabButton(AssetLibrary._xK_("lofiInterfaceBig", 0x20), true, 0);
        this.invTab_.addEventListener(MouseEvent.CLICK, this.onTabClick);
        this.invTab_.x = 7;
        this.invTab_.y = 152;
        addChild(this.invTab_);
        this.tabList_[0] = this.invTab_;
        this.statTab_ = new TabButton(AssetLibrary._xK_("lofiInterfaceBig", 0x21), false, 1);
        this.statTab_.addEventListener(MouseEvent.CLICK, this.onTabClick);
        this.statTab_.x = 35;
        this.statTab_.y = 152;
        addChild(this.statTab_);
        this.tabList_[1] = this.statTab_;
        this._086 = new Stats(191, 45);
        this._086.x = 6;
        this._086.y = 7;
        this.statTab_.holder_.addChild(this._086);
        this._e9 = new Inventory(_arg1, _arg2, "Inventory", _arg2._9A_.slice(4), 8, true, 4);
        this._e9.x = 7;
        this._e9.y = 7;
        this.invTab_.holder_.addChild(this._e9);
        mouseEnabled = false;
        this.setChildIndex(this.invTab_, this.numChildren - 1);
        this.draw();
    }
    public var equips_:Inventory;
    public var _e9:Inventory;
    public var pack_:Inventory;
    public var _0E__:int;
    public var itemSelect_:ItemSelect;
    private var gs_:GameSprite;
    private var go_:Player;
    private var w_:int;
    private var h_:int;
    private var _tm:Bitmap;
    private var nameText_:SimpleText;
    private var _L_P_:Sprite;
    private var _nw:_rN_ = null;
    private var _sI_:_0M_Y_;
    private var _U_U_:_0M_Y_;
    private var _023:_0M_Y_;
    private var _F_C_:_0M_Y_;
    private var _086:Stats;
    private var invTab_:TabButton;
    private var statTab_:TabButton;
    private var tabBG_:TabBackground;
    private var tabList_:Array;
    private var selectedTab_:int = 0;
    private var stackPots:Boolean = false;

    public function setName(_arg1:String):void {
        this.nameText_.text = _arg1;
        this.nameText_.updateMetrics();
    }

    public function nextTab():void {
        if (this.selectedTab_ + 1 == this.tabList_.length) {
            this.switchTab(this.tabList_[0] as TabButton);
        } else {
            this.switchTab(this.tabList_[this.selectedTab_ + 1] as TabButton);
        }
    }

    public function switchTab(_tab:TabButton):void {
        if (_tab.selected_) return;
        for each(var _i:TabButton in this.tabList_) {
            _i.setSelected(false);
        }
        _tab.setSelected(true);
        this.selectedTab_ = _tab.tabId_;
        this.setChildIndex(_tab, this.numChildren - 1);
    }

    public function draw():void {
        this._tm.bitmapData = this.go_.getPortrait();
        var _local1:String = ("Lvl " + this.go_.level_);
        if (_local1 != this._sI_.labelText_.text) {
            this._sI_.labelText_.text = _local1;
            this._sI_.labelText_.updateMetrics();
        }
        if (this.go_.level_ != Parameters.levelCap_) {
            if (!this._sI_.visible) {
                this._sI_.visible = true;
                this._U_U_.visible = false;
            }
            this._sI_.draw(this.go_.exp_, this.go_._7V_, 0);
            if (this._0E__ != this.go_._gz) {
                this._0E__ = this.go_._gz;
                this._sI_._Y_r(this._0E__, this.go_._gz);
            }
        } else {
            if (!this._U_U_.visible) {
                this._U_U_.visible = true;
                this._sI_.visible = false;
            }
            this._U_U_.draw(this.go_._0L_o, this.go_._n8, 0);
        }
        //this.tabBG_.draw(this.invTab_.selected_);
        this._023.draw(this.go_.HP_, this.go_.maxHP_, this.go_._P_7, this.go_._uR_);
        this._F_C_.draw(this.go_.MP_, this.go_.maxMP_, this.go_._0D_G_, this.go_._dt);
        this._086.draw(this.go_);
        this.equips_.draw(this.go_.equipment_.slice(0, 4));
        this._e9.draw(this.go_.equipment_.slice(4));
    }

    public function destroy():void {
    }

    private function _Q_C_(_arg1:MouseEvent):void {
        this.gs_.gsc_._M_6();
        //GA.global().trackEvent("enterPortal", "Nexus Button");
        Parameters.data_.needsRandomRealm = false;
        Parameters.save();
    }

    private function _nD_(_arg1:MouseEvent):void {
        this.gs_.mui_.clearInput();
        //GA.global().trackEvent("options", "Options Button");
        this.gs_.addChild(new Options(this.gs_));
    }

    private function onTabClick(me:MouseEvent):void {
        if (me.target is TabButton) {
            this.switchTab(me.target as TabButton);
        }
    }

    public function selectItems(_arg1:ItemSelectStart) {
        if(this.itemSelect_ != null) {
            return;
        }
        this.equips_.visible = false;
        this.statTab_.visible = false;
        this.invTab_.visible = false;
        this.itemSelect_ = new ItemSelect(this.gs_, _arg1);
        this.itemSelect_.y = 62;
        addChild(this.itemSelect_);
        this.itemSelect_.addEventListener(Event.CANCEL, this.cancelSelect)
    }

    public function cancelSelect(event:Event=null):void {
        this.equips_.visible = true;
        this.statTab_.visible = true;
        this.invTab_.visible = true;
        if(this.itemSelect_ != null) {
            this.itemSelect_.removeEventListener(Event.CANCEL, this.cancelSelect);
            removeChild(this.itemSelect_);
            this.itemSelect_ = null;
        }
    }
}
}//package com.company.assembleegameclient.ui

