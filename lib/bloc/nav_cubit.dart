import 'package:bloc/bloc.dart';

class NavCubit extends Cubit<int> {
  NavCubit() : super(null);

  void showPokemonDetails(int pokemonId) {
    emit(pokemonId);
  }

  void popToPokedex() {
    emit(null);
  }
}
