/**
 * Created by club5_000 on 1/23/2015.
 */
package com.company.assembleegameclient.util.quests {

    import flash.utils.Dictionary;

    public class QuestLibrary {
        public static const IdToXML:Dictionary = new Dictionary();
        public static const TypeToXML:Dictionary = new Dictionary();
        public static const IdToType:Dictionary = new Dictionary();
        public static const TypeToId:Dictionary = new Dictionary();

        public static function parse(_arg1:XML):void {
            for each (var _local1:XML in _arg1.Quest) {
                var _local2:String = _local1.@id;
                var _local3:int = int(_local1.@type);
                IdToXML[_local2] = _local1;
                TypeToXML[_local3] = _local1;
                IdToType[_local2] = _local3;
                TypeToId[_local3] = _local2;
            }
        }

        public static function fromQuestList(_arg1:String):Vector.<String> {
            var _local1:Vector.<String> = new Vector.<String>();
            if (_arg1 == "") {
                return _local1;
            }
            var _local2:Array = _arg1.split(", ");
            for each (var _local3:String in _local2) {
                _local1.push(TypeToId[int(_local3)]);
            }
            return _local1;
        }
    }
}
