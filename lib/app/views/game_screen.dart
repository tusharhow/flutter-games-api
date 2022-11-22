import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/game_card.dart';
import '../controllers/game_controller.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GameController>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2c3e50),
        elevation: 0,
        title: Text(
          controller.isLoading ? 'Loading...' : 'ZGames',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF2c3e50),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                      itemCount: controller.games.length,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        final character = controller.games[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: CharacterTile(
                            games: character,
                            onTap: () {},
                          ),
                        );
                      }),
                ),
        ],
      ),
    );
  }
}
