/**
 * Created by club5_000 on 7/29/2016.
 */
package encounter {
  import com.company.assembleegameclient.util.PokemonLibrary;

  import flash.display.Bitmap;
  import flash.display.Sprite;

  public class EncounterPokemon extends Sprite {
    public var pokemon:String;
    public var pokemonId:int;
    public var bitmap:Bitmap;

    public function EncounterPokemon(_name:String, _id:int, _enemy:Boolean) {
      if(_name != "") {
        this.pokemon = _name;
        this.pokemonId = PokemonLibrary.NameToId[_name];
      } else if(_id > 0) {
        this.pokemon = PokemonLibrary.IdToName[_id];
        this.pokemonId = _id;
      }
      this.bitmap = new Bitmap(_enemy ? PokemonLibrary.getFrontSprite(this.pokemonId) : PokemonLibrary.getBackSprite(this.pokemonId));
      this.bitmap.x = -96;
      this.bitmap.y = -192;
      addChild(this.bitmap);
    }
  }
}
