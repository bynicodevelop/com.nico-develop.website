import 'package:another_flushbar/flushbar.dart';
import 'package:com_nico_develop_app/components/authentication/bloc/authentication_bloc.dart';
import 'package:com_nico_develop_app/components/tracking/bloc/tracking_bloc.dart';
import 'package:com_nico_develop_app/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthenticationComponent extends StatelessWidget {
  final Widget child;

  const AuthenticationComponent({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) async {
        if (state is LinkSentState) {
          await Flushbar(
            title: "Confirmation d'inscription",
            message: "Vous avez reçu un lien d'activation d'inscription",
            flushbarStyle: FlushbarStyle.GROUNDED,
            flushbarPosition: FlushbarPosition.TOP,
            margin: const EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(8),
            icon: Icon(
              Icons.info_outline,
              size: 28.0,
              color: Colors.blue[300],
            ),
            duration: const Duration(
              seconds: 10,
            ),
          ).show(context);
        }

        if (state is LinkValidatedState) {
          await Flushbar(
            title: "Confirmation d'inscription",
            message: "Votre inscription est validée.",
            flushbarStyle: FlushbarStyle.GROUNDED,
            flushbarPosition: FlushbarPosition.TOP,
            margin: const EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(8),
            icon: Icon(
              Icons.info_outline,
              size: 28.0,
              color: Colors.blue[300],
            ),
            duration: const Duration(
              seconds: 10,
            ),
          ).show(context);
        }

        if (state is InvalidLinkState) {
          await Flushbar(
            title: "Confirmation invalide",
            message:
                "Votre lien d'activation est invalide. Il a peut-être expiré.",
            flushbarStyle: FlushbarStyle.GROUNDED,
            flushbarPosition: FlushbarPosition.TOP,
            margin: const EdgeInsets.all(8),
            borderRadius: BorderRadius.circular(8),
            icon: Icon(
              Icons.warning_amber_rounded,
              size: 28.0,
              color: Colors.blue[300],
            ),
            duration: const Duration(
              seconds: 10,
            ),
          ).show(context);
        }
      },
      child: child,
    );
  }
}
