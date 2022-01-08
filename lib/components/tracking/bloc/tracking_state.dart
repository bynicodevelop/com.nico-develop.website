part of 'tracking_bloc.dart';

abstract class TrackingState extends Equatable {
  const TrackingState();

  @override
  List<Object> get props => [];
}

class TrackingInitialState extends TrackingState {
  final TrackingTypeEvent event;
  final DateTime startedAt;
  final String route;
  final DateTime? endedAt;
  final List<EventModel> events;

  const TrackingInitialState({
    required this.startedAt,
    this.event = TrackingTypeEvent.pageview,
    this.route = "",
    this.endedAt,
    this.events = const [],
  });

  copyWith({
    TrackingTypeEvent? eventParam,
    DateTime? startedAtParam,
    String? routeParam,
    DateTime? endedAtParam,
    List<EventModel>? eventsParam,
  }) =>
      TrackingInitialState(
        event: eventParam ?? event,
        startedAt: startedAtParam ?? startedAt,
        route: routeParam ?? route,
        endedAt: endedAtParam ?? endedAt,
        events: eventsParam ?? events,
      );

  Map<String, dynamic> toJson() => {
        "startedAt": startedAt.toIso8601String(),
        "route": route,
        "endedAt": endedAt?.toIso8601String(),
        "events": events.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object> get props => [
        startedAt,
        route,
        events,
      ];
}
