
import 'package:clean_arch_pokemon/features/pokemon/data/datasources/remote/pokemons_remote_data_source.dart';
import 'package:clean_arch_pokemon/features/pokemon/data/models/pokemon_model.dart';
import 'package:dio/dio.dart';

class PokemonsRemoteDataSourceImpl extends PokemonsRemoteDataSource{

  final Dio dio = Dio();

  @override
  Future<PokemonModel> getPokemon(int id) async{
    final resp =  await dio.get('https://pokeapi.co/api/v2/pokemon/$id/');

      return PokemonModel.fromJson(resp);
  }

}