import 'package:clean_arch_pokemon/features/pokemon/domain/use_cases/capture_pokemon.dart';
import 'package:clean_arch_pokemon/features/pokemon/domain/use_cases/get_captured_pokemons.dart';
import 'package:clean_arch_pokemon/features/pokemon/domain/use_cases/search_pokemon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_arch_pokemon/features/pokemon/domain/entities/pokemon_entity.dart';
import 'package:clean_arch_pokemon/core/error/failures.dart';
import 'package:clean_arch_pokemon/core/utils/utils.dart' as utils;

part 'search_pokemon_event.dart';
part 'search_pokemon_state.dart';

class SearchPokemonBloc extends Bloc<SearchPokemonEvent, SearchPokemonState> {
  final CapturePokemonUseCase _capturePokemonUseCase;
  final GetCapturedPokemonsUseCase _getCapturedPokemonsUseCase;
  final SearchPokemonUseCase _searchPokemonUseCase;

  SearchPokemonBloc(this._capturePokemonUseCase,
      this._getCapturedPokemonsUseCase, this._searchPokemonUseCase)
      : super(SearchPokemonInitial()) {
    on<OnSearchPokemon>((event, emit) async {
      emit(SearchPokemonLoading());

      final resp = await _searchPokemonUseCase(utils.randomPokemonId);

      resp.fold((f) => emit(SearchPokemonFailure(failure: f)),
          (p) => emit(SearchPokemonSuccess(pokemon: p)));
    });

    on<OnCapturePokemon>((event, emit) async {
      final resp = await _capturePokemonUseCase(event.pokemon);

      resp.fold((f) => emit(SearchPokemonFailure(failure: f)), (p) {});
    });

    on<OnGetCapturedPokemons>((event, emit) async {
      final resp = await _getCapturedPokemonsUseCase();

      resp.fold((f) => emit(SearchPokemonFailure(failure: f)),
          (ps) => emit(SearchPokemonList(pokemons: ps)));
    });
  }
}
