import "package:flutter/material.dart";

import "package:minimis/ui/common/index.dart" as common_ui;

final class Home extends StatelessWidget {
  const Home({super.key});

  static const String pageName = "Home";

  @override
  Widget build(context) {
    return const Scaffold(
      appBar: common_ui.MasterAppBar(
        title: pageName,
      ),
      drawer: common_ui.MasterDrawer(),
      body: Center(
        child: Text(pageName),
      ),
    );
  }
}
