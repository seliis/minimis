import "package:flutter/material.dart";

import "package:minimis/nav/index.dart" as nav;

Future<void> showErrorMessage(String message) async {
  return await showDialog<void>(
    context: nav.Router.currentContext!,
    builder: (context) {
      return AlertDialog(
        title: const Text("Error"),
        content: SizedBox(
          width: 640,
          height: 360,
          child: Text(message),
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Dismiss"),
          ),
        ],
      );
    },
  );
}
