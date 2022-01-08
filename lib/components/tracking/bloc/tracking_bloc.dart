import 'package:bloc/bloc.dart';
import 'package:com_nico_develop_app/models/event_model.dart';
import 'package:com_nico_develop_app/repositories/authentication_repository.dart';
import 'package:com_nico_develop_app/repositories/tracking_repository.dart';
import 'package:equatable/equatable.dart';

part 'tracking_event.dart';
part 'tracking_state.dart';

class TrackingBloc extends Bloc<TrackingEvent, TrackingState> {
  final TrackinRepository trackingRepository;
  final AuthenticationRepository authenticationRepository;

  TrackingBloc({
    required this.trackingRepository,
    required this.authenticationRepository,
  }) : super(
          TrackingInitialState(
            startedAt: DateTime.now(),
          ),
        ) {
    on<OnAddRouteTrakingEvent>((event, emit) {
      emit((state as TrackingInitialState).copyWith(
        routeParam: event.route,
        startedAtParam: DateTime.now(),
        eventsParam: [],
      ));
    });

    on<OnPushTrackingEvent>((event, emit) {
      EventModel eventModel = EventModel(
        event: event.trackingType,
        value: event.value,
        date: DateTime.now(),
      );

      TrackingInitialState initialState =
          (state as TrackingInitialState).copyWith(
        eventsParam: (state as TrackingInitialState).events + [eventModel],
      );

      print(initialState.toJson());

      emit(initialState);
    });

    on<OnRouteCloseTrakingEvent>((event, emit) async {
      TrackingInitialState initialState =
          (state as TrackingInitialState).copyWith(
        endedAtParam: DateTime.now(),
      );

      print("OnRouteCloseTrakingEvent: ${initialState.toJson()}");

      await trackingRepository.addVisit({
        ...initialState.toJson(),
        ...{
          "userId": authenticationRepository.userId,
        }
      });

      emit(initialState);
    });
  }
}
