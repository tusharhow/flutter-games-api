import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_games_api/app/constants.dart';
import '../models/game_model.dart';

// ignore: must_be_immutable
class CharacterTile extends StatelessWidget {
  CharacterTile({
    Key? key,
    required this.games,
    required this.onTap,
  }) : super(key: key);

  final Games games;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: games.thumbnail!,
                  height: 70,
                  placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                    color: Color(0xFF2c3e50),
                  )),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    games.title!,
                    maxLines: 2,
                    style: const TextStyle(
                        fontWeight: FontWeight.w800, fontSize: kDefaultPadding),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    games.genre.toString(),
                    style: const TextStyle(fontSize: 13, color: Colors.black54),
                    maxLines: 2,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
