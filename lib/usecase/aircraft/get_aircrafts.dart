import "package:flutter_bloc/flutter_bloc.dart";

import "package:minimis/domain/index.dart" as domain;
import "package:minimis/entity/index.dart" as entity;
import "package:minimis/net/index.dart" as net;

final class GetAircrafts extends Cubit<GetAircraftsState> {
  GetAircrafts({
    required this.aircraftRepository,
  }) : super(GetAircraftsLoading());

  final domain.AircraftRepository aircraftRepository;

  void execute() async {
    try {
      await aircraftRepository.getList().then((response) {
        if (response is net.SuccessResponse) {
          emit(
            GetAircraftsSuccess(aircrafts: (response as net.SuccessResponse<List<entity.Aircraft>>).data),
          );
        } else {
          emit(
            GetAircraftsFailure(message: (response as net.FailureResponse).message),
          );
        }
      });
    } catch (error) {
      emit(GetAircraftsFailure(message: error.toString()));
    }
  }
}

sealed class GetAircraftsState extends domain.AsyncState {}

final class GetAircraftsLoading extends GetAircraftsState with domain.AsyncLoading {}

final class GetAircraftsSuccess extends GetAircraftsState with domain.AsyncSuccess {
  GetAircraftsSuccess({
    required this.aircrafts,
  });

  final List<entity.Aircraft> aircrafts;
}

final class GetAircraftsFailure extends GetAircraftsState with domain.AsyncFailure {
  GetAircraftsFailure({
    required this.message,
  });

  @override
  final String message;
}
