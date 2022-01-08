import 'package:bloc/bloc.dart';
import 'package:com_nico_develop_app/repositories/authentication_repository.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthenticationRepository authenticationRepository;

  AuthenticationBloc({
    required this.authenticationRepository,
  }) : super(AuthenticationInitialState()) {
    authenticationRepository.user.listen((user) {
      Uri uri = Uri(query: Uri.base.query);

      if (user.isEmpty) {
        add(OnAuthenticationInitializeEvent());
      } else if (user.isUnauthenticated &&
          uri.queryParameters.containsKey("mode") &&
          uri.queryParameters["mode"] == "signIn") {
        add(
          OnAuthenticatedSignInEvent(
            email: uri.queryParameters["email"]!,
            displayName: uri.queryParameters["displayName"]!,
          ),
        );
      }
    });

    on<OnAuthenticationInitializeEvent>((event, emit) async {
      emit(LinkSentState());
      await authenticationRepository.signInAnonymously();
    });

    on<OnAuthenticatedUserEvent>((event, emit) async {
      await authenticationRepository.startSignInLink({
        'email': event.email,
        'displayName': event.displayName,
      });

      emit(LinkSentState());
    });

    on<OnAuthenticatedSignInEvent>((event, emit) async {
      try {
        await authenticationRepository.signInWithLink(
          Uri.base.toString(),
          event.email,
          event.displayName,
        );

        emit(LinkValidatedState());
      } catch (e) {
        emit(InvalidLinkState());
      }
    });
  }
}
