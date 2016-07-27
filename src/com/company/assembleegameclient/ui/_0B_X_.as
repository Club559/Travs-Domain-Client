// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.ui._0B_X_

package com.company.assembleegameclient.ui {
    import _011.ItemSelectStart;

    import _D_d._E_m;

    import _R_v.Panel;

    import _zm._01c;

    import com.company.assembleegameclient.map._3m;
    import com.company.assembleegameclient.parameters.Parameters;

    import flash.display.Sprite;

import com.company.assembleegameclient.game.GameSprite;

import flash.display.Shape;

import _R_v._Q_V_;

import flash.events.Event;

import _011._S_M_;
import _011._Z_J_;
import _011._qe;

import com.company.util._O_m;
import com.company.assembleegameclient.objects.Player;

import flash.display.Graphics;

public class _0B_X_ extends Sprite {

    private static const _08A_:int = 4;
    private static const _0D_Q_:int = 8;

    public function _0B_X_(_arg1:GameSprite, _arg2:int, _arg3:int) {
        this._3S_ = new _return(184, 0);
        super();
        this.gs_ = _arg1;
        this.w_ = _arg2;
        this.h_ = _arg3;
        this._L_C_ = false;
        this.editing_ = false;
        mouseEnabled = true;
        mouseChildren = true;
        addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
        addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
    }
    public var _F_:_ej = null;
    public var _02y:_T_W_;
    public var _U_T_:_Q_V_;
    public var _6K_:_zg = null;
    public var itemSelect_:ItemSelect = null;
    public var _C_K_:Sprite;
    public var abilityBox_:AbilityBox;
    public var editSelect_:_01c;
    public var editObj_:_E_m;
    public var editTile_:_E_m;
    public var currentEdit_:_E_m;
    public var editing_:Boolean;
    private var gs_:GameSprite;
    private var w_:int;
    private var h_:int;
    private var _L_C_:Boolean;
    private var background_:Shape;
    private var _3S_:_return;
    private var gameBar_:Sprite;
    private var editBar_:Sprite;

    public function initialize():void {
        this.gameBar_ = new Sprite();
        this.editBar_ = new Sprite();
        this._4T_();
        this._C_K_ = new _3m();
        this._C_K_.mouseEnabled = false;
        addChild(this._C_K_);
        this.abilityBox_ = new AbilityBox(this.gs_);
        this.abilityBox_.x = -1;
        this.abilityBox_.y = 312;
        //addChild(this.abilityBox_);

        this.editSelect_ = new _01c(new <String>["Ground", "Objects"], _E_m.WIDTH, 26);
        this.editSelect_.x = 32;
        this.editSelect_.y = 34;
        this.editSelect_.addEventListener(Event.CHANGE, this.changeEditType);
        this.editBar_.addChild(this.editSelect_);
        this.editTile_ = new TileSelect();
        this.editTile_.x = 32;
        this.editTile_.y = 86;
        this.editBar_.addChild(this.editTile_);
        this.editObj_ = new ObjSelect();
        this.editObj_.x = 32;
        this.editObj_.y = 86;

        this.currentEdit_ = this.editTile_;
    }

    public function dispose():void {
        if (this._F_ != null) {
            if (this.gameBar_.contains(this._F_)) {
                this.gameBar_.removeChild(this._F_);
            }
            this._F_.dispose();
            this._F_ = null;
        }
        if (this._02y != null) {
            if (this.gameBar_.contains(this._02y)) {
                this.gameBar_.removeChild(this._02y);
            }
            this._02y = null;
        }
        if(this._C_K_ != null) {
            if (this.gameBar_.contains(this._C_K_)) {
                this.gameBar_.removeChild(this._C_K_);
            }
            this._C_K_ = null;
        }
    }

    public function _0L_v(_arg1:_S_M_):void {
        if (this._6K_ != null) {
            return;
        }
        this._6K_ = new _zg(this.gs_, _arg1);
        this._6K_.y = 200;
        this._6K_.addEventListener(Event.CANCEL, this._05I_);
    }

    public function selectItem(_arg1:ItemSelectStart):void {
        if(this._02y == null) {
            return;
        }
        this._02y.selectItems(_arg1);
    }

    public function _ss(_arg1:_Z_J_):void {
        if (this._6K_ == null) {
            return;
        }
        this._6K_._hf(_arg1.offer_);
    }

    public function _A_a():void {
        this._0L_A_();
    }

    public function _mH_(_arg1:_qe):void {
        if (this._6K_ == null) {
            return;
        }
        this._6K_._C_D_(_arg1.myOffer_, _arg1.yourOffer_);
    }

    public function draw():void {
        if (this.gs_.map_.player_ == null) {
            return;
        }
        if (!this._L_C_) {
            this._rC_();
            _O_m._041(this.gameBar_, this._F_);
            this._0J_s();
            this._L_C_ = true;
        }
        if(this.editing_) {
            _O_m._03d(this, this.gameBar_);
            _O_m._041(this, this.editBar_);
        } else {
            _O_m._03d(this, this.editBar_);
            _O_m._041(this, this.gameBar_);
        }
        this._F_.draw();
        if (this._6K_ != null) {
            this._3S_.visible = false;
            _O_m._03d(this.gameBar_, this._02y);
            _O_m._03d(this.gameBar_, this._U_T_);
            _O_m._041(this.gameBar_, this._6K_);
        } else {
            this._3S_.visible = false;
            _O_m._041(this.gameBar_, this._02y);
            _O_m._041(this.gameBar_, this._U_T_);
            this._02y.draw();
            this._U_T_.draw();
        }
        if (!Parameters._0F_o) {
            this._C_K_.visible = true;
            this._C_K_.x = -10;
            this._C_K_.y = 0;
        } else {
            this._C_K_.visible = false;
        }
        this.setChildIndex(this._C_K_, this.numChildren - 1);
    }

    private function _0L_A_():void {
        if (this._6K_ != null) {
            this._6K_.removeEventListener(Event.CANCEL, this._05I_);
            _O_m._03d(this.gameBar_, this._6K_);
            this._6K_ = null;
        } else if (this._02y != null && this._02y.itemSelect_ != null) {
            this._02y.cancelSelect();
        }
    }

    private function _4T_():void {
        this._F_ = new _ej(this.gs_.map_, (200 - (2 * _08A_)), (200 - (2 * _08A_)));
        this._F_.x = _08A_;
        this._F_.y = _08A_;
    }

    private function _0J_s():void {
        var _local1:Player;
        _local1 = this.gs_.map_.player_;
        this._02y = new _T_W_(this.gs_, _local1, 200, 300);
        this._02y.y = 200;
        this._U_T_ = new _Q_V_(this.gs_, _local1, 200, 135);
        this._U_T_.x = 0;
        this._U_T_.y = 475;
    }

    private function _rC_():void {
        this.background_ = new Shape();
        var _local1:Graphics = this.background_.graphics;
        _local1.clear();
        _local1.beginFill(0x363636);
        _local1.drawRect(0, 0, this.w_, this.h_);
        _local1.endFill();
        addChild(this.background_);
        this._3S_.x = 8;
        this._3S_.y = 500;
        //addChild(this._3S_); //Disable if adding HP/MP pot buttons
    }

    private function _05I_(_arg1:Event):void {
        this._0L_A_();
    }

    private function onEnterFrame(_arg1:Event):void {
        this.draw();
    }

    private function onAddedToStage(_arg1:Event):void {
        stage.addEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function onRemovedFromStage(_arg1:Event):void {
        stage.removeEventListener(Event.ENTER_FRAME, this.onEnterFrame);
    }

    private function changeEditType(event:Event):void {
        switch(this.editSelect_.getValue()) {
            case "Ground":
                _O_m._03d(this.editBar_, this.editObj_);
                _O_m._041(this.editBar_, this.editTile_);
                this.currentEdit_ = this.editTile_;
                break;
            case "Objects":
                _O_m._03d(this.editBar_, this.editTile_);
                _O_m._041(this.editBar_, this.editObj_);
                this.currentEdit_ = this.editObj_;
                break;
        }
    }
}
}
import _D_d._E_m;
import _D_d._M_u;
import _D_d._Q_H_;
import _D_d._Q_S_;

import com.company.assembleegameclient.map._pf;

import com.company.assembleegameclient.objects.ObjectLibrary;
import com.company.util._L_2;

class TileSelect extends _E_m {

    function TileSelect() {
        var _local1:String;
        var _local3:int;
        var _local4:_Q_S_;
        super(_M_u._6h);
        var _local2:Vector.<String> = new Vector.<String>();
        for (_local1 in _pf._pb) {
            _local2.push(_local1);
        }
        _local2.sort(_L_2._L_O_);
        for each (_local1 in _local2) {
            _local3 = _pf._pb[_local1];
            _local4 = new _Q_S_(_pf._Q_F_[_local3]);
            _08M_(_local4);
        }
    }
}

class ObjSelect extends _E_m {

    function ObjSelect() {
        var _local1:String;
        var _local3:int;
        var _local4:XML;
        var _local5:_Q_H_;
        super(_M_u._S_E_);
        var _local2:Vector.<String> = new Vector.<String>();
        for (_local1 in ObjectLibrary._pb) {
            _local2.push(_local1);
        }
        _local2.sort(_L_2._L_O_);
        for each (_local1 in _local2) {
            _local3 = ObjectLibrary._pb[_local1];
            _local4 = ObjectLibrary._Q_F_[_local3];
            if (!((_local4.hasOwnProperty("Item")) || (_local4.hasOwnProperty("Player")) || (_local4.Class == "Projectile")) && (_local4.hasOwnProperty("Static") || _local4.hasOwnProperty("Buildable"))) {
                _local5 = new _Q_H_(_local4);
                _08M_(_local5);
            }
        }
    }
}
