/**
 * Created by club5_000 on 9/1/2015.
 */
package com.company.assembleegameclient.ui {

    import _E_7.AbilityToolTip;

    import com.company.assembleegameclient.game.GameSprite;
    import com.company.assembleegameclient.objects.Player;

    import com.company.assembleegameclient.util.AbilityLibrary;
    import com.company.ui.SimpleText;

    import flash.display.Bitmap;

    import flash.display.BitmapData;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;
    import flash.text.TextFormatAlign;

    public class Ability extends Sprite {

        private var abilitySlot_:int;
        private var abilityType_:int;
        private var abilityIcon_:Bitmap;
        private var cooldownOverlay_:Sprite;
        private var cooldownText_:SimpleText;
        private var toolTip_:AbilityToolTip;
        private var gs_:GameSprite;

        public function Ability(_arg1:GameSprite, _arg2:int, _arg3:int) {
            this.gs_ = _arg1;
            this.abilitySlot_ = _arg2;
            this.setAbilityType(_arg3);
            this.initOverlay();
            addEventListener(Event.ADDED_TO_STAGE, addedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, removedFromStage);
        }

        private function removedFromStage(event:Event):void {
            this._9();
            removeEventListener(Event.ENTER_FRAME, onEnterFrame);
            removeEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            removeEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
        }

        private function addedToStage(event:Event):void {
            addEventListener(Event.ENTER_FRAME, onEnterFrame);
            addEventListener(MouseEvent.MOUSE_OVER, onMouseOver);
            addEventListener(MouseEvent.MOUSE_OUT, onMouseOut);
        }

        private function initOverlay() {
            this.cooldownOverlay_ = new Sprite();
            this.cooldownOverlay_.graphics.beginFill(0, 0.75);
            this.cooldownOverlay_.graphics.drawRect(0, 0, 40, 40);
            this.cooldownOverlay_.graphics.endFill();
            this.cooldownOverlay_.visible = false;
            this.cooldownText_ = new SimpleText(26, 0xFFFFFF, false);
            this.cooldownText_.setBold(true);
            this.cooldownText_.text = "99";
            this.cooldownText_.updateMetrics();
            this.cooldownText_.x = 20 - this.cooldownText_.textWidth / 2;
            this.cooldownText_.y = 20 - this.cooldownText_.textHeight / 2;
            this.cooldownOverlay_.addChild(this.cooldownText_);
            addChild(this.cooldownOverlay_);
        }

        public function setAbilityType(_arg1:int) {
            this.abilityType_ = _arg1;
            this.redraw();
        }

        public function draw() {
            graphics.clear();
            graphics.beginFill(0x161616);
            graphics.drawRect(-1, -1, 42, 42);
            graphics.endFill();
            graphics.beginFill(0x545454);
            graphics.drawRect(0, 0, 40, 40);
            graphics.endFill();
        }

        public function redraw() {
            this.draw();
            if(this.abilityIcon_ != null) {
                if(contains(this.abilityIcon_)) {
                    removeChild(this.abilityIcon_);
                }
                this.abilityIcon_ = null;
            }
            if(abilityType_ != -1) {
                var _local1:BitmapData = AbilityLibrary.getIcon(abilityType_);
                this.abilityIcon_ = new Bitmap(_local1);
                addChild(this.abilityIcon_);
            }
        }

        private function onEnterFrame(event:Event):void {
            if(this.gs_.map_.player_ != null) {
                var _local1:Player = this.gs_.map_.player_;
                if(_local1.abilityCooldowns[abilitySlot_] > 0 && !this.cooldownOverlay_.visible) {
                    this.cooldownOverlay_.visible = true;
                }
                if(_local1.abilityCooldowns[abilitySlot_] == 0 && this.cooldownOverlay_.visible) {
                    this.cooldownOverlay_.visible = false;
                }
                if(this.cooldownOverlay_.visible) {
                    this.cooldownText_.text = String(Math.ceil(_local1.abilityCooldowns[abilitySlot_]/1000));
                    this.cooldownText_.x = 20 - this.cooldownText_.textWidth / 2;
                    setChildIndex(this.cooldownOverlay_, this.numChildren - 1);
                }
            }
        }

        private function _9():void {
            if (toolTip_ != null) {
                if (toolTip_.parent != null) {
                    toolTip_.parent.removeChild(toolTip_);
                }
                toolTip_ = null;
            }
        }

        private function onMouseOver(e:MouseEvent):void {
            this._9();
            if(this.abilityType_ != -1) {
                this.toolTip_ = new AbilityToolTip(this.abilityType_);
                stage.addChild(this.toolTip_);
            }
        }

        private function onMouseOut(e:MouseEvent):void {
            this._9();
        }
    }
}
