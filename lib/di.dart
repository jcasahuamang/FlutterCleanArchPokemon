import 'package:clean_arch_pokemon/features/pokemon/data/datasources/local/pokemons_local_data_source.dart';
import 'package:clean_arch_pokemon/features/pokemon/data/datasources/local/pokemons_local_data_source_impl.dart';
import 'package:clean_arch_pokemon/features/pokemon/data/datasources/remote/pokemons_remote_data_source.dart';
import 'package:clean_arch_pokemon/features/pokemon/data/datasources/remote/pokemons_remote_data_sources_impl.dart';
import 'package:clean_arch_pokemon/features/pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:clean_arch_pokemon/features/pokemon/domain/repositories/pokemons_repository.dart';
import 'package:clean_arch_pokemon/features/pokemon/domain/use_cases/capture_pokemon.dart';
import 'package:clean_arch_pokemon/features/pokemon/domain/use_cases/get_captured_pokemons.dart';
import 'package:clean_arch_pokemon/features/pokemon/domain/use_cases/search_pokemon.dart';
import 'package:clean_arch_pokemon/features/pokemon/presentation/bloc/search_pokemon/search_pokemon_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(
    () => SearchPokemonBloc(
      sl(),
      sl(),
      sl(),
    ),
  );

  // Use cases
  sl.registerLazySingleton(() => CapturePokemonUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetCapturedPokemonsUseCase(repository: sl()));
  sl.registerLazySingleton(() => SearchPokemonUseCase(repository: sl()));

  // Repository
  sl.registerLazySingleton<PokemonsRepository>(
    () => PokemonsRepositoryImpl(
      pokemonsLocalDataSource: sl(),
      pokemonsRemoteDataSource: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<PokemonsLocalDataSource>(
    () => HivePokemonLocalDataSourceImpl(),
  );

  sl.registerLazySingleton<PokemonsRemoteDataSource>(
    () => PokemonsRemoteDataSourceImpl(),
  );
}