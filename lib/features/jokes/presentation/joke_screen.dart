import 'package:flutter/material.dart';
import 'package:sample/values/dimensions.dart';
import 'package:sample/values/strings.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  static const routeName = '/jokes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.APP_NAME),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: Dimensions.SIZE64),
        ElevatedButton(onPressed: () {},
          child: const Center(child: Text(Strings.ACTION_JOKES),),),
        const SizedBox(height: Dimensions.SIZE16),
        ElevatedButton(onPressed: () {},
          child: const Center(child: Text(Strings.ACTION_JOKE_OF_THE_DAY),),),
      ],
    );
  }
}