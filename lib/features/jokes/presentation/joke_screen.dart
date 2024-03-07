import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:sample/features/jokes/bloc/states/get_joke_of_the_day_states.dart';
import 'package:sample/features/jokes/domain/model/joke.dart';
import 'package:sample/features/jokes/presentation/joke_list_screen.dart';
import 'package:sample/shared/loading/loading_dialog.dart';
import 'package:sample/utils/extensions/string_ext.dart';
import 'package:sample/values/dimensions.dart';
import 'package:sample/values/strings.dart';

import '../bloc/joke_bloc.dart';

class JokeScreen extends StatefulWidget {
  const JokeScreen({super.key});

  static const routeName = '/jokes';

  @override
  State<JokeScreen> createState() => _JokeScreenState();
}

class _JokeScreenState extends State<JokeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.titleJokes),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocListener<JokeBloc, JokeState>(
      listenWhen: (previous, current) => current is GetJokeOfTheDayState,
      listener: (context, state) {
        if (state is GetJokeOfTheDayLoadingState) {
          LoadingDialog.show(context);
        }
        if (state is GetJokeOfTheDaySuccessState) {
          LoadingDialog.hide(context);
          _showJokeOfTheDayDialog(context, state.joke);
        }
        if (state is GetJokeOfTheDayErrorState) {
          LoadingDialog.hide(context);
          Fluttertoast.showToast(msg: state.message.orEmpty());
        }
      },
      child: Column(
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
            child:ElevatedButton(
              onPressed: () => context.read<JokeBloc>().add(GetJokeOfTheDayEvent()),
              child: const Center(
                child: Text(Strings.actionJokeOfTheDay),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _showJokeOfTheDayDialog(BuildContext context, Joke joke) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(Strings.titleJokeOfTheDay),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                joke.setup,
                style: const TextStyle(
                    fontSize: Dimensions.size16, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: Dimensions.size16),
              Text(joke.punchline),
            ],
          ),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
