part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitialState extends AuthenticationState {}

class LinkSentState extends AuthenticationState {}

class LinkValidatedState extends AuthenticationState {}

class InvalidLinkState extends AuthenticationState {}
