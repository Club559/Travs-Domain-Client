/**
 * Created by club5_000 on 7/29/2016.
 */
package com.company.assembleegameclient.util {
  import com.company.util.AssetLibrary;

  import flash.display.BitmapData;
  import flash.utils.Dictionary;

  public class PokemonLibrary {
    public static const IdToXML:Dictionary = new Dictionary();
    public static const NameToXML:Dictionary = new Dictionary();
    public static const IdToName:Dictionary = new Dictionary();
    public static const NameToId:Dictionary = new Dictionary();

    public static function parse(_arg1:XML):void {
      for each(var _local1:XML in _arg1.Pokemon) {
        var _local2:String = _local1.@name;
        var _local3:int = int(_local1.@id);
        IdToXML[_local3] = _local1;
        NameToXML[_local2] = _local1;
        IdToName[_local3] = _local2;
        NameToId[_local2] = _local3;
      }
    }
    
    public static function getFrontSprite(_arg1:int):BitmapData {
      var _local1:BitmapData = AssetLibrary._xK_("pokemonFront", _arg1-1);
      return TextureRedrawer.resize(_local1, null, 300, true, 0, 0, 1);
    }

    public static function getBackSprite(_arg1:int):BitmapData {
      var _local1:BitmapData = AssetLibrary._xK_("pokemonBack", _arg1-1);
      return TextureRedrawer.resize(_local1, null, 300, true, 0, 0, 1);
    }
  }
}
