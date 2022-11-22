import 'package:flutter/cupertino.dart';
import 'package:flutter_games_api/app/services/api_service.dart';
import '../models/game_model.dart';

class GameController extends ChangeNotifier {
  List<Games> games = [];
  bool isLoading = false;

  GameController() {
    getGames();
  }

  Future<void> getGames() async {
    isLoading = true;
    notifyListeners();
    games = await ApiService.getGames();
    isLoading = false;
    notifyListeners();
  }
}
