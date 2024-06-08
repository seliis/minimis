import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter/material.dart";

import "package:minimis/ui/common/index.dart" as common_ui;
import "package:minimis/usecase/index.dart" as usecase;
import "package:minimis/infra/index.dart" as infra;

final class Aircraft extends StatelessWidget {
  const Aircraft({super.key});

  static const String pageName = "Aircraft";

  @override
  Widget build(context) {
    return BlocBuilder<usecase.GetAircrafts, usecase.GetAircraftsState>(
      bloc: usecase.GetAircrafts(
        aircraftRepository: RepositoryProvider.of<infra.AircraftRepositoryImpl>(context),
      )..execute(),
      builder: (context, state) => _Aircraft(state: state),
    );
  }
}

final class _Aircraft extends StatelessWidget {
  const _Aircraft({
    required this.state,
  });

  final usecase.GetAircraftsState state;

  @override
  Widget build(context) {
    Widget getListView() {
      return ListView(
        children: (state as usecase.GetAircraftsSuccess)
            .aircrafts
            .map(
              (aircraft) => ListTile(
                title: Text(aircraft.registration),
              ),
            )
            .toList(),
      );
    }

    return Scaffold(
      appBar: const common_ui.MasterAppBar(
        title: Aircraft.pageName,
      ),
      drawer: const common_ui.MasterDrawer(),
      body: Center(
        child: state.onSuccess(getListView),
      ),
    );
  }
}
