import 'package:clean_arch_pokemon/core/error/failures.dart';
import 'package:clean_arch_pokemon/features/pokemon/data/datasources/local/pokemons_local_data_source.dart';
import 'package:clean_arch_pokemon/features/pokemon/data/datasources/remote/pokemons_remote_data_source.dart';
import 'package:clean_arch_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:clean_arch_pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class PokemonsRepositoryImpl implements PokemonsRepository {
  final PokemonsLocalDataSource pokemonsLocalDataSource;
  final PokemonsRemoteDataSource pokemonsRemoteDataSource;

  PokemonsRepositoryImpl(
      {required this.pokemonsLocalDataSource,
      required this.pokemonsRemoteDataSource});

  @override
  Future<Either<Failure, bool>> catpurePokemon(PokemonEntity pokemon) async {
    try{
      final bool resp = await pokemonsLocalDataSource.capturePokemon(pokemon);
      return Right(resp);
    }on LocalFailure{
      return Left(LocalFailure());
    }

  }

  @override
  Future<Either<Failure, List<PokemonEntity>>> getCapturedPokemon() async{
    try{
      final List<PokemonEntity> resp = await pokemonsLocalDataSource.getCapturedPokemonsList();
      return Right(resp);
    }on LocalFailure{
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, PokemonEntity>> getPokemon(int id) async{
    try{
      final PokemonEntity resp = await pokemonsRemoteDataSource.getPokemon(id);
      return Right(resp);
    }on DioException{
      return Left(ServerFailure());
    }
  }
}
