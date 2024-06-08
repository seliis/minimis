import "package:flutter/material.dart";

import "package:minimis/ui/common/index.dart" as common_ui;

abstract class AsyncState {
  const AsyncState();

  Widget? onSuccess(Widget Function() callback) {
    if (this is AsyncSuccess) return callback();

    if (this is AsyncFailure) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        common_ui.showErrorMessage((this as AsyncFailure).message);
      });

      return null;
    }

    return const CircularProgressIndicator();
  }
}

mixin AsyncLoading on AsyncState {}
mixin AsyncSuccess on AsyncState {}
mixin AsyncFailure on AsyncState {
  String get message;
}
