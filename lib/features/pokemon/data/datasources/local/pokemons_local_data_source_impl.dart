import 'package:flutter/material.dart';
import 'package:clean_arch_pokemon/core/error/failures.dart';
import 'package:clean_arch_pokemon/features/pokemon/data/datasources/local/pokemons_local_data_source.dart';
import 'package:clean_arch_pokemon/features/pokemon/data/models/pokemon_model.dart';
import 'package:clean_arch_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HivePokemonLocalDataSourceImpl extends PokemonsLocalDataSource{


  HivePokemonLocalDataSourceImpl(){
    Hive.initFlutter();
  }


  @override
  Future<bool> capturePokemon(PokemonEntity pokemon) async{
    try{
      Box<dynamic> box = await Hive.openBox('pokemons');

      box.put(pokemon.id, PokemonModel.fromEntity(pokemon).toJson());
      return true;
    }catch(error){
      debugPrint(error.toString());
      throw LocalFailure();
    }
  }

  @override
  Future<List<PokemonModel>> getCapturedPokemonsList() async{
    try{
      Box<dynamic> box = await Hive.openBox('pokemons');

      return box.values.map((p) => PokemonModel.fromJson(p)).toList();


    }catch(error){
      debugPrint(error.toString());
      throw LocalFailure();
    }
  }

}