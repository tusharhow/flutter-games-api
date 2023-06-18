import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_games_api/app/blocs/game_bloc.dart';
import 'package:flutter_games_api/app/components/game_card.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Games Catalog'),
      ),
      body: BlocBuilder<GameBloc, GameState>(
        builder: (context, state) {
          if (state is GameInitial) {
            BlocProvider.of<GameBloc>(context).add(GetGames());
            return const SizedBox();
          } else if (state is GameLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GameLoaded) {
            return ListView.builder(
              itemCount: state.games.length,
              itemBuilder: (context, index) {
                final game = state.games[index];
                return CharacterTile(
                  game: game,
                  onTap: () {},
                );
              },
            );
          } else {
            return const Center(
              child: Text('Error Occured'),
            );
          }
        },
      ),
    );
  }
}
