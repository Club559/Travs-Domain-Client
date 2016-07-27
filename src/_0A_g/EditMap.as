// Decompiled by AS3 Sorcerer 1.99
// http://www.as3sorcerer.com/

//_0A_g.Buy

package _0A_g {

    import com.company.assembleegameclient.net.messages.data._Q_0;

    import flash.utils.IDataOutput;

public class EditMap extends _R_q {

    public function EditMap(_arg1:uint) {
        this.pos_ = new _Q_0();
        super(_arg1);
    }
    public var mode_:int;
    public var type_:int;
    public var pos_:_Q_0;

    override public function writeToOutput(_arg1:IDataOutput):void {
        _arg1.writeInt(this.mode_);
        _arg1.writeInt(this.type_);
        this.pos_.writeToOutput(_arg1);
    }

    override public function toString():String {
        return (formatToString("EDITMAP", "mode_", "type_", "pos_"));
    }

}
}//package _0A_g

