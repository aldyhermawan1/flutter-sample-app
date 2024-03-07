import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sample/features/jokes/bloc/states/get_jokes_states.dart';
import 'package:sample/features/jokes/domain/model/joke.dart';
import 'package:sample/features/jokes/presentation/components/joke_widget.dart';
import 'package:sample/shared/misc/default_widget.dart';
import 'package:sample/values/strings.dart';

import '../../../values/dimensions.dart';
import '../bloc/joke_bloc.dart';

class JokeListScreen extends StatefulWidget {
  const JokeListScreen({super.key});

  static const routeName = '/jokes/list';

  @override
  State<JokeListScreen> createState() => _JokeListScreenState();
}

class _JokeListScreenState extends State<JokeListScreen> {
  @override
  void initState() {
    super.initState();
    context.read<JokeBloc>().add(GetJokesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.titleJokesList),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<JokeBloc>().add(GetJokesEvent());
      },
      child: BlocBuilder<JokeBloc, JokeState>(
        buildWhen: (previous, current) => current is GetJokesState,
        builder: (context, state) {
          if (state is GetJokesSuccessState) {
            return _buildSuccessBody(state.jokes);
          }
          if (state is GetJokesEmptyState) {
            return DefaultWidget.emptyView();
          }
          if (state is GetJokesErrorState) {
            return DefaultWidget.errorView(
              message: state.message,
              onRetry: () => context.read<JokeBloc>().add(GetJokesEvent()),
            );
          }
          return DefaultWidget.loadingView();
        },
      ),
    );
  }

  Widget _buildSuccessBody(List<Joke> jokes) {
    return ListView.separated(
      itemCount: jokes.length,
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(vertical: Dimensions.size16),
      separatorBuilder: (context, index) =>
          const SizedBox(height: Dimensions.size16),
      itemBuilder: (context, index) => JokeWidget(
        joke: jokes[index],
        isFromFavList: false,
      ),
    );
  }
}
