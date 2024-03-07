import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample/features/jokes/presentation/joke_list_screen.dart';
import 'package:sample/values/dimensions.dart';
import 'package:sample/values/strings.dart';

class AvatarScreen extends StatefulWidget {
  const AvatarScreen({super.key});

  static const routeName = '/avatar';

  @override
  State<AvatarScreen> createState() => _AvatarScreenState();
}

class _AvatarScreenState extends State<AvatarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.titleAvatar),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: Dimensions.size16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.size16),
          child: ElevatedButton(
            onPressed: () => context.pushNamed(JokeListScreen.routeName),
            child: const Center(
              child: Text(Strings.actionJokesList),
            ),
          ),
        ),
        const SizedBox(height: Dimensions.size16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.size16),
          child: ElevatedButton(
            onPressed: () {},
            child: const Center(
              child: Text(Strings.actionJokeOfTheDay),
            ),
          ),
        ),
        const SizedBox(height: Dimensions.size16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.size16),
          child: ElevatedButton(
            onPressed: () {},
            child: const Center(
              child: Text(Strings.actionJokesFav),
            ),
          ),
        ),
      ],
    );
  }
}
