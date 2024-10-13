
import 'package:clean_arch_pokemon/core/error/failures.dart';
import 'package:clean_arch_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:clean_arch_pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:dartz/dartz.dart';

class GetCapturedPokemonsUseCase {
  final PokemonsRepository repository;

  GetCapturedPokemonsUseCase({required this.repository});

  Future<Either<Failure,List<PokemonEntity>>> call(){
    return repository.getCapturedPokemon();
  }
}