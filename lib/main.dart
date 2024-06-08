import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/material.dart";

import "package:minimis/infra/index.dart" as infra;
import "package:minimis/nav/index.dart" as nav;
import "package:minimis/ui/index.dart" as ui;

Future<void> main() async {
  runApp(
    MultiBlocProvider(
      providers: [
        RepositoryProvider.value(
          value: const infra.AircraftRepositoryImpl(dataSource: infra.AircraftDataSource()),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: nav.Router.onGenerateRoute,
        navigatorKey: nav.Router.navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: ui.Home.pageName,
      ),
    ),
  );
}
