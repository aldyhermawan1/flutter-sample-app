import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample/features/jokes/bloc/states/check_fav_joke_states.dart';
import 'package:sample/utils/extensions/string_ext.dart';
import 'package:sample/values/dimensions.dart';
import 'package:sample/values/strings.dart';

import '../../bloc/joke_bloc.dart';
import '../../bloc/states/save_fav_joke_states.dart';
import '../../domain/model/joke.dart';

class JokeWidget extends StatefulWidget {
  final Joke joke;
  final bool isFromFavList;

  const JokeWidget({
    required this.joke,
    required this.isFromFavList,
    super.key,
  });

  @override
  State<JokeWidget> createState() => _JokeWidgetState();
}

class _JokeWidgetState extends State<JokeWidget> {
  bool isClicked = false;

  @override
  void initState() {
    super.initState();
    context.read<JokeBloc>().add(CheckFavJokeEvent(widget.joke));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Dimensions.size16),
      child: ExpansionTile(
        title: Text(
          widget.joke.setup,
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
          Text(widget.joke.punchline),
          const SizedBox(height: Dimensions.size8),
          Visibility(
            visible: !widget.isFromFavList && !isClicked,
            child: BlocConsumer<JokeBloc, JokeState>(
              listenWhen: (previous, current) => current is SaveFavJokeState,
              listener: (context, state) {
                if (state is SaveFavJokeLoadingState) {
                  Fluttertoast.showToast(msg: Strings.labelLoadingDot);
                }
                if (state is SaveFavJokeSuccessState) {
                  context.read<JokeBloc>().add(CheckFavJokeEvent(widget.joke));
                  Fluttertoast.showToast(msg: 'Added to Favorites!');
                }
                if (state is SaveFavJokeErrorState) {
                  Fluttertoast.showToast(msg: state.message.orEmpty());
                }
              },
              buildWhen: (previous, current) => current is CheckFavJokeState,
              builder: (context, state) {
                if (state is CheckFavJokeSuccessState) {
                  if (!state.status) {
                    return TextButton(
                      child: const Text(Strings.actionSaveFav),
                      onPressed: () {
                        setState(() {
                          isClicked = true;
                        });
                        context
                            .read<JokeBloc>()
                            .add(SaveFavJokeEvent(widget.joke));
                      },
                    );
                  }
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
