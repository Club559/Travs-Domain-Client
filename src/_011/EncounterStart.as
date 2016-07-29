// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_011._08K_

package _011 {
import flash.utils.IDataInput;

public class EncounterStart extends _01Q_ {

    public function EncounterStart(_arg1:uint) {
        super(_arg1);
    }

    public var pokemon_:String;
    //public var data_:String;

    override public function parseFromInput(_arg1:IDataInput):void {
        //this.item_ = _arg1.readInt();
        this.pokemon_ = _arg1.readUTF();
    }

    override public function toString():String {
        return (formatToString("ENCOUNTERSTART", "pokemon_"));
    }

}
}//package _011

