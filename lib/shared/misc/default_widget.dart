import 'package:flutter/material.dart';
import 'package:sample/utils/extensions/string_ext.dart';
import 'package:sample/values/dimensions.dart';
import 'package:sample/values/strings.dart';

class DefaultWidget {
  static Widget loadingView() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  static Widget emptyView() {
    return const Center(
      child: Text(
        Strings.messageGeneralEmpty,
        style: TextStyle(
          fontSize: Dimensions.size20,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  static Widget errorView({
    String? message,
    Function? onRetry,
  }) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            Strings.messageGeneralError,
            style: TextStyle(
              fontSize: Dimensions.size20,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: Dimensions.size8),
          Visibility(
            visible: message.isNotNullOrEmpty(),
            child: Text(message.orEmpty()),
          ),
          const SizedBox(height: Dimensions.size8),
          Visibility(
            visible: onRetry != null,
            child: ElevatedButton(
              onPressed: () {
                onRetry!.call();
              },
              child: const Text(Strings.actionRetry),
            ),
          ),
        ],
      ),
    );
  }
}
