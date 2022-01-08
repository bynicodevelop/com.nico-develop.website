import 'package:com_nico_develop_app/components/authentication/bloc/authentication_bloc.dart';
import 'package:com_nico_develop_app/components/tracking/bloc/tracking_bloc.dart';
import 'package:com_nico_develop_app/repositories/authentication_repository.dart';
import 'package:com_nico_develop_app/repositories/tracking_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProvidersInitializer extends StatelessWidget {
  final AuthenticationRepository authenticationRepository;
  final TrackinRepository trackingRepository;

  final Widget child;

  const ProvidersInitializer({
    Key? key,
    required this.child,
    required this.authenticationRepository,
    required this.trackingRepository,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) => AuthenticationBloc(
            authenticationRepository: authenticationRepository,
          ),
        ),
        BlocProvider<TrackingBloc>(
          create: (context) => TrackingBloc(
            trackingRepository: trackingRepository,
            authenticationRepository: authenticationRepository,
          ),
        ),
      ],
      child: child,
    );
  }
}
