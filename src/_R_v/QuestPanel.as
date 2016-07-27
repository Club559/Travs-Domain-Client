// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_R_v._0D_t

package _R_v {

    import com.company.assembleegameclient.game.GameSprite;
    import com.company.assembleegameclient.objects.QuestGiver;
    import com.company.assembleegameclient.parameters.Parameters;
    import com.company.assembleegameclient.ui._4D_;
    import com.company.assembleegameclient.ui.quests.QuestGiverUI;

    import flash.events.Event;
    import flash.events.KeyboardEvent;
    import flash.events.MouseEvent;

    public class QuestPanel extends _X_i {
        public function QuestPanel(_arg1:GameSprite, _arg2:QuestGiver) {
            super(_arg1, "Quest Giver", "Quests");
            this.questGiver_ = _arg2;
            addEventListener(Event.ADDED_TO_STAGE, this.onAddedToStage);
            addEventListener(Event.REMOVED_FROM_STAGE, this.onRemovedFromStage);
        }
        private var questGiver_:QuestGiver;

        override protected function onButtonClick(_arg1:MouseEvent):void {
            var _local1:QuestGiverUI = new QuestGiverUI(this.questGiver_, this.gs_);
            stage.addChild(_local1);
        }

        private function onRemovedFromStage(_arg1:Event):void {
            stage.removeEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
        }

        private function onAddedToStage(_arg1:Event):void {
            stage.addEventListener(KeyboardEvent.KEY_DOWN, this._0A_Y_);
        }

        private function _0A_Y_(_arg1:KeyboardEvent):void {
            if ((((_arg1.keyCode == Parameters.data_.interact)) && (!(_4D_._0G_B_)))) {
                var _local1:QuestGiverUI = new QuestGiverUI(this.questGiver_, this.gs_);
                stage.addChild(_local1);
            }
        }

    }
}//package _R_v

