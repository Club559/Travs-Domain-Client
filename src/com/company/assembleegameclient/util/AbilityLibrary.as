/**
 * Created by club5_000 on 9/1/2015.
 */
package com.company.assembleegameclient.util {

    import com.company.assembleegameclient.objects.ObjectProperties;
    import com.company.util.AssetLibrary;

    import flash.display.BitmapData;
    import flash.utils.Dictionary;

    public class AbilityLibrary {
        public static const Props:Dictionary = new Dictionary();
        public static const IdToXML:Dictionary = new Dictionary();
        public static const TypeToXML:Dictionary = new Dictionary();
        public static const IdToType:Dictionary = new Dictionary();
        public static const TypeToId:Dictionary = new Dictionary();

        public static function parse(_arg1:XML):void {
            for each (var _local1:XML in _arg1.Ability) {
                var _local2:String = _local1.@id;
                var _local3:int = int(_local1.@type);
                IdToXML[_local2] = _local1;
                TypeToXML[_local3] = _local1;
                IdToType[_local2] = _local3;
                TypeToId[_local3] = _local2;
                Props[_local3] = new ObjectProperties(_local1);
            }
        }

        public static function getIcon(_arg1:int):BitmapData {
            var _local1:XML = TypeToXML[_arg1];
            if(_local1 == null) {
                return null;
            }
            if(!_local1.hasOwnProperty("Texture")) {
                return null;
            }
            var _local2:XMLList = _local1.Texture;
            return AssetLibrary._xK_(_local2.File, int(_local2.Index));
        }
    }
}
