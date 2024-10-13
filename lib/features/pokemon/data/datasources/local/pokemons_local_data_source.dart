
import 'package:clean_arch_pokemon/features/pokemon/data/models/pokemon_model.dart';
import 'package:clean_arch_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';

abstract class PokemonsLocalDataSource {
    Future<bool> capturePokemon(PokemonEntity pokemon);
    Future<List<PokemonModel>> getCapturedPokemonsList();

}