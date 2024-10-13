
import 'package:clean_arch_pokemon/core/error/failures.dart';
import 'package:clean_arch_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:dartz/dartz.dart';

abstract class PokemonsRepository {
  
  Future<Either<Failure,PokemonEntity>> getPokemon(int id);
  Future<Either<Failure,bool>> catpurePokemon(PokemonEntity pokemon);
  Future<Either<Failure,List<PokemonEntity>>> getCapturedPokemon(); 

}
