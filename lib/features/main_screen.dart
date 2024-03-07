import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample/features/jokes/presentation/joke_screen.dart';
import 'package:sample/values/dimensions.dart';
import 'package:sample/values/strings.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.appName),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: Dimensions.size64),
        const Text(
          Strings.labelSelectFeature,
          style: TextStyle(
            fontSize: Dimensions.size24,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: Dimensions.size24),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: Dimensions.size16),
          child: ElevatedButton(
            onPressed: () => context.pushNamed(JokeScreen.routeName),
            child: const Center(
              child: Text(Strings.actionJokes),
            ),
          ),
        ),
        const SizedBox(height: Dimensions.size16),
      ],
    );
  }
}
