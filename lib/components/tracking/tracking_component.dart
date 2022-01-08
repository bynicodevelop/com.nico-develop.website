import 'package:com_nico_develop_app/components/tracking/bloc/tracking_bloc.dart';
import 'package:com_nico_develop_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackingComponent extends StatefulWidget {
  final Widget child;
  final RouteObserver<ModalRoute<void>> routeObserver;

  const TrackingComponent({
    Key? key,
    required this.child,
    required this.routeObserver,
  }) : super(key: key);

  @override
  State<TrackingComponent> createState() => _TrackingComponentState();
}

class _TrackingComponentState extends State<TrackingComponent> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    widget.routeObserver.subscribe(
      this,
      ModalRoute.of(context)!,
    );
  }

  @override
  void dispose() {
    widget.routeObserver.unsubscribe(
      this,
    );

    super.dispose();
  }

  @override
  void didPush() {
    final String routeName = ModalRoute.of(context)!.settings.name!;

    context.read<TrackingBloc>().add(
          OnAddRouteTrakingEvent(
            route: routeName,
          ),
        );

    context.read<TrackingBloc>().add(
          const OnPushTrackingEvent(
            trackingType: TrackingTypeEvent.pageview,
          ),
        );
  }

  @override
  void didPop() {
    final String routeName = ModalRoute.of(context)!.settings.name!;

    print("didPop from $routeName");

    super.didPop();
  }

  @override
  void didPushNext() {
    final String routeName = ModalRoute.of(context)!.settings.name!;

    print("didPushNext from $routeName");
    context.read<TrackingBloc>().add(OnRouteCloseTrakingEvent());

    super.didPushNext();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
