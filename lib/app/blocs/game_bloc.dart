import 'package:bloc/bloc.dart';
import 'package:flutter_games_api/app/models/game_model.dart';
import 'package:flutter_games_api/app/repository/game_repository.dart';
import 'package:meta/meta.dart';

part 'game_event.dart';
part 'game_state.dart';

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc() : super(GameInitial()) {
    final GameRepository gameRepository = GameRepository();
    on<GetGames>((event, emit) async {
      emit(GameLoading());
      try {
        final games = await gameRepository.getGames();
        emit(GameLoaded(games));
      } catch (e) {
        emit(GameError(e.toString()));
      }
    });
  }
}
