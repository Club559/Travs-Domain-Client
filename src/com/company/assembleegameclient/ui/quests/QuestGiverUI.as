/**
 * Created by club5_000 on 1/23/2015.
 */
package com.company.assembleegameclient.ui.quests {

    import com.company.assembleegameclient.game.GameSprite;
    import com.company.assembleegameclient.objects.QuestGiver;
    import com.company.rotmg.graphics.DeleteXGraphic;

    import flash.display.Graphics;
    import flash.display.Shape;
    import flash.display.Sprite;
    import flash.events.MouseEvent;

    public class QuestGiverUI extends Sprite {
        public static const WIDTH:int = 600;
        public static const HEIGHT:int = 600;

        public function QuestGiverUI(_arg1:QuestGiver, _arg2:GameSprite) {
            this.obj_ = _arg1;
            this.gs_ = _arg2;

            var _local1:Shape = new Shape();
            var _local2:Graphics = _local1.graphics;
            _local2.clear();
            _local2.beginFill(0, 0.8);
            _local2.drawRect(0, 0, WIDTH, HEIGHT);
            _local2.endFill();
            addChild(_local1);
            var _local3:DeleteXGraphic = new DeleteXGraphic();
            _local3.addEventListener(MouseEvent.CLICK, this.close);
            _local3.x = WIDTH - _local3.width - 10;
            _local3.y = 10;
            addChild(_local3);
            this.menu_ = new QuestMenu(this, this.gs_);
            this.menu_.x = (WIDTH / 2) - (menu_.width / 2);
            this.menu_.y = (HEIGHT / 2) - (menu_.height / 2);
            addChild(this.menu_);
        }
        public var obj_:QuestGiver;
        public var gs_:GameSprite;
        private var menu_:QuestMenu;
        private var info_:QuestInfo;

        public function openInfo(_arg1:QuestInfo) {
            removeChild(this.menu_);
            this.info_ = _arg1;
            addChild(this.info_);
        }

        public function changeInfo(_arg1:QuestInfo) {
            removeChild(this.info_);
            this.info_ = _arg1;
            addChild(this.info_);
        }

        public function closeInfo() {
            removeChild(this.info_);
            this.info_ = null;
            this.menu_ = new QuestMenu(this, this.gs_);
            this.menu_.x = (WIDTH / 2) - (menu_.width / 2);
            this.menu_.y = (HEIGHT / 2) - (menu_.height / 2);
            addChild(this.menu_);
        }

        public function close(e:MouseEvent):void {
            stage.focus = null;
            parent.removeChild(this);
        }
    }
}
