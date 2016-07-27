/**
 * Created by club5_000 on 1/23/2015.
 */
package com.company.assembleegameclient.ui.quests {

    import _05R_.GTween;

    import com.company.assembleegameclient.game.GameSprite;
    import com.company.assembleegameclient.util.quests.QuestLibrary;
    import com.company.ui.SimpleText;

    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.filters.ColorMatrixFilter;

    import zerorealms.rotmg.assets.ScrollClosedGraphic;

    public class QuestMenuOption extends Sprite {
        public static const WIDTH:int = 450;
        public static const HEIGHT:int = 66;

        public function QuestMenuOption(_arg1:QuestMenu, _arg2:String, _arg3:GameSprite) {
            this.menu_ = _arg1;
            this.name_ = _arg2;
            this.gs_ = _arg3;
            this.locked_ = false;
            this.data_ = QuestLibrary.IdToXML[_arg2];

            var matrix:Array = [0.25, 0.25, 0.25, 0, 0,
                0.25, 0.25, 0.25, 0, 0,
                0.25, 0.25, 0.25, 0, 0,
                0, 0, 0, 1, 0];
            this.filters = [new ColorMatrixFilter(matrix)];

            this.graphic_ = new ScrollClosedGraphic();
            addChild(this.graphic_);

            this.text_ = new SimpleText(24, 0x735636, false, 0, 0, "Roman New Times");
            this.text_.text = this.name_;
            this.text_.width = this.text_.textWidth + 5;
            this.text_.height = this.text_.textHeight;
            this.text_.x = (this.width / 2) - (this.text_.width / 2);
            this.text_.y = 20;
            addChild(this.text_);

            this.unlock();
        }
        private var menu_:QuestMenu;
        private var name_:String;
        private var locked_:Boolean;
        private var data_:XML;
        private var gs_:GameSprite;
        private var text_:SimpleText;
        private var originalX_:int = -1;
        private var graphic_:ScrollClosedGraphic;

        public function unlock():void {
            if (this.data_ != null && this.data_.hasOwnProperty("QuestReq")) {
                for each (var _local1:XML in this.data_.QuestReq) {
                    if (gs_.map_.player_.completedQuests.indexOf(String(_local1)) == -1) {
                        return;
                    }
                }
            }
            this.filters = [];
            this.graphic_.filters = [QuestMenu.OUTLINE_FILTER, QuestMenu.GLOW_FILTER]
            //this.addEventListener(MouseEvent.MOUSE_OVER, this.onMouseOver);
            //this.addEventListener(MouseEvent.MOUSE_OUT, this.onMouseOut);
            this.addEventListener(MouseEvent.CLICK, this.onClick)
        }

        private function open():void {
            this.menu_.viewQuest(this.name_);
        }

        private function onClick(e:MouseEvent):void {
            this.open();
        }

        private function onMouseOver(e:MouseEvent):void {
            if (this.originalX_ == -1) {
                this.originalX_ = this.x;
            }
            new GTween(this, 0.15, {
                "x": this.originalX_ + 20
            });
        }

        private function onMouseOut(e:MouseEvent):void {
            new GTween(this, 0.15, {
                "x": this.originalX_
            });
        }
    }
}
