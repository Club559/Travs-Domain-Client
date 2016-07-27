// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g.Buy

package _0A_g {

    import flash.utils.IDataOutput;

    public class CompleteQuest extends _R_q {

        public function CompleteQuest(_arg1:uint) {
            super(_arg1);
        }
        public var questType_:int;

        override public function writeToOutput(_arg1:IDataOutput):void {
            _arg1.writeInt(this.questType_);
        }

        override public function toString():String {
            return (formatToString("COMPLETEQUEST", "questType_"));
        }

    }
}//package _0A_g

