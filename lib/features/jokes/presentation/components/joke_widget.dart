import 'package:flutter/material.dart';
import 'package:sample/values/dimensions.dart';

import '../../domain/model/joke.dart';

class JokeWidget extends StatelessWidget {
  final Joke joke;

  const JokeWidget({
    required this.joke,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.size16),
      child: ExpansionTile(
        title: Text(
          joke.setup,
          style: const TextStyle(
              fontSize: Dimensions.size20, fontWeight: FontWeight.w500),
        ),
        tilePadding: const EdgeInsets.all(Dimensions.size8),
        childrenPadding: const EdgeInsets.all(Dimensions.size8),
        collapsedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.size8),
          side: const BorderSide(color: Colors.black12),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Dimensions.size8),
          side: const BorderSide(color: Colors.black12),
        ),
        children: [
          Text(joke.punchline),
        ],
      ),
    );
  }
}
