import 'package:dio/dio.dart';
import 'package:flutter_games_api/app/constants.dart';
import '../models/game_model.dart';

class GameService {
  static final _dio = Dio();

  Future<List<Games>> getGames() async {
    Response response = await _dio.get(BASE_URL + GAME_ENDPOINT);
    if (response.statusCode == 200) {
      final List<dynamic> data = response.data;
      return data.map((e) => Games.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load games');
    }
  }
}
