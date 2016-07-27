/**
 * Created by club5_000 on 1/5/2015.
 */
package com.company.assembleegameclient.ui.quests {

    import _sP_.MarketplaceSearch;
    import _sP_.MarketplaceSlot;

    import com.company.assembleegameclient.game.GameSprite;
    import com.company.assembleegameclient.objects.ObjectLibrary;
    import com.company.assembleegameclient.util.quests.QuestLibrary;
    import com.company.ui.SimpleText;

    import flash.display.Sprite;
    import flash.events.MouseEvent;

    import zerorealms.rotmg.assets.ScrollGraphic;

    public class QuestInfo extends Sprite {
        public function QuestInfo(_arg1:QuestGiverUI, _arg2:String, _arg3:GameSprite) {
            this.owner_ = _arg1;
            this.name_ = _arg2;
            this.data_ = QuestLibrary.IdToXML[_arg2];
            this.gs_ = _arg3;
            if (this.data_ != null) {
                this.type_ = int(this.data_.@type);
            }

            var _scrollGraphic:ScrollGraphic = new ScrollGraphic();
            _scrollGraphic.filters = [QuestMenu.OUTLINE_FILTER, QuestMenu.GLOW_FILTER]
            addChild(_scrollGraphic);

            var _local3:SimpleText = new SimpleText(32, 0x735636, false, 0, 0);
            _local3.setBold(true);
            _local3.text = this.name_;
            _local3.updateMetrics();
            _local3.x = (this.width / 2) - (_local3.width / 2);
            _local3.y = 17;
            addChild(_local3);

            var _local4:SimpleText = new SimpleText(26, 0x735636, false, 0, 0);
            _local4.setBold(true);
            _local4.mouseEnabled = true;
            _local4.text = "back";
            _local4.x = 30;
            _local4.y = 535;
            _local4.addEventListener(MouseEvent.MOUSE_OVER, this.mouseOverText);
            _local4.addEventListener(MouseEvent.MOUSE_OUT, this.mouseOutText);
            _local4.addEventListener(MouseEvent.CLICK, this.close);
            _local4.updateMetrics();
            addChild(_local4);

            if (this.data_ != null && this.gs_.map_ != null && this.gs_.map_.player_ != null) {
                this.build();
            }
        }
        private var owner_:QuestGiverUI;
        private var name_:String;
        private var type_:int;
        private var data_:XML;
        private var button:SimpleText;
        private var gs_:GameSprite;
        private var desc_:SimpleText;
        private var details_:Sprite;

        private function build() {
            var _local2:SimpleText;
            var _local3:SimpleText;
            var _local4:SimpleText;
            var _local5:SimpleText;
            var _local6:Boolean = gs_.map_.player_.completedQuests.indexOf(this.name_) >= 0;
            var _local7:Boolean = gs_.map_.player_.finishedQuests.indexOf(this.name_) >= 0;
            this.desc_ = new SimpleText(16, 0x735636, false, 320, 0);
            this.desc_.wordWrap = true;
            this.desc_.text = this.data_.Description;
            if (_local7) {
                this.desc_.text = (this.data_.hasOwnProperty("DescCompleted")) ? this.data_.DescCompleted : "Completed";
                this.desc_.text += "\n";
            }
            this.desc_.x = 65;
            this.desc_.y = 65;
            this.desc_.updateMetrics();
            addChild(desc_);
            this.details_ = new Sprite();
            if (this.data_.hasOwnProperty("Objective")) {
                _local2 = new SimpleText(20, 0x735636, false, 320, 0);
                _local2.setBold(true);
                _local2.text = "OBJECTIVE";
                _local2.x = 65;
                _local2.y = this.desc_.y + this.desc_.height;
                _local2.updateMetrics();
                this.details_.addChild(_local2);

                var _objectiveText:String = "";
                for each (var _questObj:XML in this.data_.Objective) {
                    _objectiveText += _questObj.Text + "\n";
                }

                _local3 = new SimpleText(16, 0x735636, false, 320, 0);
                _local3.wordWrap = true;
                _local3.text = _objectiveText;
                _local3.x = 65;
                _local3.y = _local2.y + _local2.height;
                _local3.updateMetrics();
                this.details_.addChild(_local3);
            }
            if (this.data_.hasOwnProperty("Reward")) {
                _local4 = new SimpleText(20, 0x735636, false, 320, 0);
                _local4.setBold(true);
                _local4.text = "REWARD";
                _local4.x = 65;
                _local4.y = _local3 != null ? (_local3.y + _local3.height) : (this.desc_.y + this.desc_.height);
                _local4.updateMetrics();
                this.details_.addChild(_local4);

                var _rewardText:String = "";
                if(this.data_.Reward.hasOwnProperty("Exp")) {
                    _rewardText += "Exp: " + this.data_.Reward.Exp + "\n";
                }
                if(this.data_.Reward.hasOwnProperty("Fame")) {
                    _rewardText += "Fame: " + this.data_.Reward.Fame + "\n";
                }
                if(this.data_.Reward.hasOwnProperty("Item")) {
                    _rewardText += "You will recieve the following items:";
                }

                _local5 = new SimpleText(16, 0x735636, false, 320, 0);
                _local5.wordWrap = true;
                _local5.text = _rewardText;
                _local5.x = 65;
                _local5.y = _local4.y + _local4.height;
                _local5.updateMetrics();
                this.details_.addChild(_local5);

                if(this.data_.Reward.hasOwnProperty("Item")) {
                    var _local11:int = 0;
                    for each (var _local9:String in this.data_.Reward.Item) {
                        var _local10:MarketplaceSlot = new MarketplaceSlot(ObjectLibrary._pb[_local9], null, gs_, true);
                        _local10.x = 65 + (MarketplaceSlot.WIDTH * _local11);
                        _local10.y = _local5.y + _local5.height;
                        this.details_.addChild(_local10);
                        _local11++;
                    }
                }
            }
            if (!_local6) {
                addChild(this.details_);
            }
            this.button = new SimpleText(32, 0x735636, false, 0, 0);
            this.button.setBold(true);
            this.button.mouseEnabled = true;
            this.button.text = "ACCEPT";
            this.button.updateMetrics();
            this.button.x = (this.width / 2) - (this.button.width / 2);
            this.button.y = 530;
            this.button.addEventListener(MouseEvent.MOUSE_OVER, this.mouseOverText);
            this.button.addEventListener(MouseEvent.MOUSE_OUT, this.mouseOutText);
            this.button.addEventListener(MouseEvent.CLICK, this.clickButton);

            if (gs_.map_.player_.activeQuests.indexOf(this.name_) == -1 && gs_.map_.player_.completedQuests.indexOf(this.name_) == -1) {
                addChild(this.button);
            }
            if (gs_.map_.player_.finishedQuests.indexOf(this.name_) >= 0) {
                this.setButtonText("COMPLETE");
            }
        }

        private function setButtonText(_arg1:String):void {
            this.button.text = _arg1;
            this.button.updateMetrics();
            this.button.x = (this.width / 2) - (this.button.width / 2);
        }

        private function complete():void {
            if (this.data_.hasOwnProperty("NextQuest")) {
                var _local1:QuestInfo = new QuestInfo(this.owner_, this.data_.NextQuest, this.gs_);
                _local1.x = 75;
                _local1.y = 6;
                this.owner_.changeInfo(_local1);
                return;
            }
            this.owner_.closeInfo();
            this.owner_.close(null);
        }

        private function clickButton(e:MouseEvent):void {
            if (this.button.text == "ACCEPT") {
                this.gs_.gsc_.acceptQuest(this.type_);
                removeChild(this.button);
                this.owner_.closeInfo();
            } else if (this.button.text == "COMPLETE") {
                this.gs_.gsc_.completeQuest(this.type_);
                removeChild(this.button);
                complete();
            }
        }

        private function close(e:MouseEvent):void {
            this.owner_.closeInfo();
        }

        private function mouseOverText(e:MouseEvent):void {
            var _local1:SimpleText = (e.target as SimpleText);
            _local1.setColor(0);
        }

        private function mouseOutText(e:MouseEvent):void {
            var _local1:SimpleText = (e.target as SimpleText);
            _local1.setColor(0x735636);
        }
    }
}
