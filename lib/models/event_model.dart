import 'package:equatable/equatable.dart';

enum TrackingTypeEvent {
  click,
  pageview,
  prospect,
}

class EventModel extends Equatable {
  final TrackingTypeEvent event;
  final DateTime date;
  final String? value;

  const EventModel({
    required this.event,
    required this.date,
    this.value,
  });

  Map<String, dynamic> toJson() => {
        'event': event,
        'value': value,
        'date': date,
      };

  EventModel.fromJson(Map<String, dynamic> json)
      : event = TrackingTypeEvent.values.firstWhere(
          (e) => e.toString().split('.').last == json['event'],
          orElse: () => TrackingTypeEvent.pageview,
        ),
        date = DateTime.parse(json['date']),
        value = json['value'];

  @override
  List<Object> get props => [
        event,
      ];
}
