import 'package:flutter_games_api/app/models/game_model.dart';
import 'package:flutter_games_api/app/services/api_service.dart';

class GameRepository {
  final GameService gameService = GameService();
  
  Future<List<Games>> getGames() async {
    return await gameService.getGames();
  }
}
