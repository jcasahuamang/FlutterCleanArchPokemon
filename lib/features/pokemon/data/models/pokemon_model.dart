import 'package:clean_arch_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';

class PokemonModel extends PokemonEntity {
  PokemonModel({required super.name, required super.image, required super.id});

  factory PokemonModel.fromJson(json) {
    return PokemonModel(
        name: json['name'],
        image: json['sprites']['front_default'],
        id: json['id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sprites': {'front_default': image},
      'name': name
    };
  }

  factory PokemonModel.fromEntity(PokemonEntity pokemon) {
    return PokemonModel(
        name: pokemon.name, image: pokemon.image, id: pokemon.id);
  }
}
