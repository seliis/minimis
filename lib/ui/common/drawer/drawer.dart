import "package:flutter/material.dart";

import "package:minimis/ui/index.dart" as ui;

final class MasterDrawer extends StatelessWidget {
  const MasterDrawer({super.key});

  static const List<String> pageNames = [
    ui.Home.pageName,
    ui.Aircraft.pageName,
  ];

  @override
  Widget build(context) {
    void go(String target) {
      Navigator.of(context)
        ..pop()
        ..popAndPushNamed(target);
    }

    return Drawer(
      child: Column(
        children: [
          for (final pageName in pageNames)
            ListTile(
              title: Text(pageName),
              onTap: () => go(pageName),
            ),
        ],
      ),
    );
  }
}
