
import 'package:clean_arch_pokemon/core/error/failures.dart';
import 'package:clean_arch_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:clean_arch_pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:dartz/dartz.dart';

class CapturePokemonUseCase {
  final PokemonsRepository repository;

  CapturePokemonUseCase({required this.repository});

  Future<Either<Failure,bool>> call(PokemonEntity pokemon){
      return repository.catpurePokemon(pokemon);
  }


}