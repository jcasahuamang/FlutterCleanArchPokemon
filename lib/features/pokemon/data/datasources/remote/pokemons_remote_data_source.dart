
import 'package:clean_arch_pokemon/features/pokemon/data/models/pokemon_model.dart';


abstract class PokemonsRemoteDataSource {
  
  Future<PokemonModel> getPokemon(int id);

}

