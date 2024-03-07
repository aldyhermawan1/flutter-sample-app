import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sample/features/jokes/bloc/states/delete_all_fav_joke_states.dart';
import 'package:sample/features/jokes/domain/model/joke.dart';
import 'package:sample/features/jokes/presentation/components/joke_widget.dart';
import 'package:sample/shared/loading/loading_dialog.dart';
import 'package:sample/shared/misc/default_widget.dart';
import 'package:sample/utils/extensions/string_ext.dart';
import 'package:sample/values/strings.dart';

import '../../../values/dimensions.dart';
import '../bloc/joke_bloc.dart';
import '../bloc/states/get_fav_jokes_states.dart';

class JokeFavScreen extends StatefulWidget {
  const JokeFavScreen({super.key});

  static const routeName = '/jokes/fav';

  @override
  State<JokeFavScreen> createState() => _JokeFavScreenState();
}

class _JokeFavScreenState extends State<JokeFavScreen> {
  @override
  void initState() {
    super.initState();
    context.read<JokeBloc>().add(GetFavJokesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(Strings.titleJokesFav),
        actions: [
          IconButton(
            onPressed: () =>
                context.read<JokeBloc>().add(DeleteAllFavJokeEvent()),
            icon: const Icon(Icons.delete_forever),
          )
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<JokeBloc>().add(GetFavJokesEvent());
      },
      child: BlocConsumer<JokeBloc, JokeState>(
        listenWhen: (previous, current) => current is DeleteAllFavJokeState,
        listener: (context, state) {
          if (state is DeleteAllFavJokeLoadingState) {
            LoadingDialog.show(context);
          }
          if (state is DeleteAllFavJokeSuccessState) {
            LoadingDialog.hide(context);
            context.read<JokeBloc>().add(GetFavJokesEvent());
          }
          if (state is DeleteAllFavJokeErrorState) {
            LoadingDialog.hide(context);
            Fluttertoast.showToast(msg: state.message.orEmpty());
          }
        },
        buildWhen: (previous, current) => current is GetFavJokesState,
        builder: (context, state) {
          if (state is GetFavJokesSuccessState) {
            return _buildSuccessBody(state.jokes);
          }
          if (state is GetFavJokesEmptyState) {
            return DefaultWidget.emptyView();
          }
          if (state is GetFavJokesErrorState) {
            return DefaultWidget.errorView(
              message: state.message,
              onRetry: () => context.read<JokeBloc>().add(GetFavJokesEvent()),
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
        isFromFavList: true,
      ),
    );
  }
}
