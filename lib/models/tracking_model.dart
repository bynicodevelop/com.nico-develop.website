import 'package:com_nico_develop_app/models/event_model.dart';
import 'package:equatable/equatable.dart';

class TrackingModel extends Equatable {
  final DateTime startedAt;
  final String route;
  final DateTime? endedAt;
  final List<EventModel> event;

  const TrackingModel({
    required this.startedAt,
    required this.route,
    required this.event,
    this.endedAt,
  });

  Map<String, dynamic> toJson() => {
        'startedAt': startedAt.toIso8601String(),
        'route': route,
        'endedAt': endedAt?.toIso8601String(),
        'event': event,
      };

  TrackingModel.fromJson(Map<String, dynamic> json)
      : startedAt = DateTime.parse(json['startedAt']),
        route = json['route'],
        endedAt =
            json['endedAt'] != null ? DateTime.parse(json['endedAt']) : null,
        event = List<EventModel>.from(json['event']);

  @override
  List<Object?> get props => [startedAt, route, endedAt];
}
