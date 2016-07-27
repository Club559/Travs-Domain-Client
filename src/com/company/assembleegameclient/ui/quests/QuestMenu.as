/**
 * Created by club5_000 on 1/23/2015.
 */
package com.company.assembleegameclient.ui.quests {

    import com.company.assembleegameclient.game.GameSprite;
    import com.company.assembleegameclient.util.TextureRedrawer;
    import com.company.assembleegameclient.util.quests.QuestLibrary;
    import com.company.util.AssetLibrary;

    import flash.display.Bitmap;

    import flash.display.BitmapData;

    import flash.display.Sprite;
    import flash.filters.BitmapFilterQuality;
    import flash.filters.GlowFilter;

    public class QuestMenu extends Sprite {
        public static const OUTLINE_FILTER = new GlowFilter(0, 0.8, 1.4, 1.4, 0xFF, BitmapFilterQuality.LOW, false, false);
        public static const GLOW_FILTER:GlowFilter = new GlowFilter(0, 0.3, 12, 12, 2, BitmapFilterQuality.LOW, false, false);

        public function QuestMenu(_arg1:QuestGiverUI, _arg2:GameSprite) {
            this.owner_ = _arg1;
            this.gs_ = _arg2;
            this.availableQuests_ = new Vector.<String>();
            for each (var _quest:String in this.owner_.obj_.quests_) {
                var _local1:XML = QuestLibrary.IdToXML[_quest];
                if (_local1 != null && gs_.map_.player_.completedQuests.indexOf(_quest) != -1) {
                    continue;
                }
                if (_local1 != null && _local1.hasOwnProperty("QuestReq")) {
                    var _local3:Boolean = false;
                    for each (var _local2:XML in _local1.QuestReq) {
                        if (gs_.map_.player_.completedQuests.indexOf(String(_local2)) == -1) {
                            _local3 = true;
                            break;
                        }
                    }
                    if(_local3) {
                        continue;
                    }
                }
                availableQuests_.push(_quest);
            }
            for each (var _quest:String in this.availableQuests_) {
                this.addQuest(_quest);
            }
        }
        private var availableQuests_:Vector.<String>;
        private var questCount_:int = 0;
        private var owner_:QuestGiverUI;
        private var gs_:GameSprite;

        public function addQuest(_name:String):void {
            var _local2:int = Math.min((QuestGiverUI.HEIGHT - (this.availableQuests_.length * QuestMenuOption.HEIGHT)) / this.availableQuests_.length, 50);

            var _local1:QuestMenuOption = new QuestMenuOption(this, _name, this.gs_);
            _local1.y = this.questCount_ * (_local1.height + _local2);
            addChild(_local1);

            var _local3:BitmapData = questNew();
            if(gs_.map_.player_.finishedQuests.indexOf(_name) != -1) {
                _local3 = questFinished();
            }
            if(gs_.map_.player_.activeQuests.indexOf(_name) != -1) {
                _local3 = questActive();
            }
            var _local4:Bitmap = new Bitmap(_local3);
            _local4.x = _local1.width;
            _local4.y = _local1.y + (_local4.height / 2) - (_local1.height / 2);
            addChild(_local4);

            this.questCount_++;
        }

        public function viewQuest(_name:String):void {
            var _local1:QuestInfo = new QuestInfo(this.owner_, _name, this.gs_);
            _local1.x = 75;
            _local1.y = 6;
            this.owner_.openInfo(_local1);
        }

        private var questNew_:BitmapData;
        public function questNew():BitmapData {
            if (questNew_ == null) {
                questNew_ = TextureRedrawer.resize(AssetLibrary._xK_("lofiObj3", 0x23b), null, 100, true, 0, 0);
                questNew_ = TextureRedrawer.outlineGlow(questNew_, 0, 0xFFFFFFFF);
            }
            return (questNew_);
        }

        private var questFinished_:BitmapData;
        public function questFinished():BitmapData {
            if (questFinished_ == null) {
                questFinished_ = TextureRedrawer.resize(AssetLibrary._xK_("lofiObj3", 0x23c), null, 100, true, 0, 0);
                questFinished_ = TextureRedrawer.outlineGlow(questFinished_, 0, 0xFFFFFFFF);
            }
            return (questFinished_);
        }

        private var questActive_:BitmapData;
        public function questActive():BitmapData {
            if (questActive_ == null) {
                questActive_ = TextureRedrawer.resize(AssetLibrary._xK_("lofiObj3", 0x23d), null, 100, true, 0, 0);
                questActive_ = TextureRedrawer.outlineGlow(questActive_, 0, 0xFFFFFFFF);
            }
            return (questActive_);
        }

    }
}
