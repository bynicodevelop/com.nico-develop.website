part of 'tracking_bloc.dart';

abstract class TrackingEvent extends Equatable {
  const TrackingEvent();

  @override
  List<Object> get props => [];
}

class OnAddRouteTrakingEvent extends TrackingEvent {
  final String route;

  const OnAddRouteTrakingEvent({
    required this.route,
  });

  @override
  List<Object> get props => [
        route,
      ];
}

class OnRouteCloseTrakingEvent extends TrackingEvent {}

class OnPushTrackingEvent extends TrackingEvent {
  // final String route;
  final TrackingTypeEvent trackingType;
  final String? value;

  const OnPushTrackingEvent({
    // required this.route,
    required this.trackingType,
    this.value,
  });

  @override
  List<Object> get props => [
        // route,
        trackingType,
      ];
}
