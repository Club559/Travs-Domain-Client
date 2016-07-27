// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//com.company.assembleegameclient.objects.MoneyChanger

package com.company.assembleegameclient.objects {

    import _R_v.Panel;
    import _R_v.QuestPanel;

    import com.company.assembleegameclient.game.GameSprite;

    public class QuestGiver extends GameObject implements _G_4 {
        public function QuestGiver(_arg1:XML) {
            super(_arg1);
            this.quests_ = new Vector.<String>();
            if (_arg1.hasOwnProperty("Quests")) {
                for each (var _local1:XML in _arg1.Quests.children()) {
                    this.quests_.push(String(_local1));
                }
            }
            _064 = true;
        }
        public var quests_:Vector.<String>;

        public function getPanel(_arg1:GameSprite):Panel {
            return (new QuestPanel(_arg1, this));
        }
    }
}//package com.company.assembleegameclient.objects

