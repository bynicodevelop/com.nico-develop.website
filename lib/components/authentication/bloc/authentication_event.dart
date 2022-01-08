part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class OnAuthenticationInitializeEvent extends AuthenticationEvent {}

class OnAuthenticatedUserEvent extends AuthenticationEvent {
  final String email;
  final String displayName;

  const OnAuthenticatedUserEvent({
    required this.email,
    required this.displayName,
  });

  @override
  List<Object> get props => [
        email,
        displayName,
      ];
}

class OnAuthenticatedSignInEvent extends AuthenticationEvent {
  final String email;
  final String displayName;

  const OnAuthenticatedSignInEvent({
    required this.email,
    required this.displayName,
  });

  @override
  List<Object> get props => [
        email,
        displayName,
      ];
}
