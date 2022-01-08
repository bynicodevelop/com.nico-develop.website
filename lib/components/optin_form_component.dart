import 'package:com_nico_develop_app/components/authentication/bloc/authentication_bloc.dart';
import 'package:com_nico_develop_app/config/custom_theme_data.dart';
import 'package:com_nico_develop_app/widgets/cta_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:validators/validators.dart';

class OptinFormComponent extends StatefulWidget {
  const OptinFormComponent({Key? key}) : super(key: key);

  @override
  State<OptinFormComponent> createState() => _OptinFormComponentState();
}

class _OptinFormComponentState extends State<OptinFormComponent> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _invalidName = false;
  bool _invalidEmail = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
        vertical: 100.0,
        horizontal: (MediaQuery.of(context).size.width - 450) / 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10.0,
            ),
            child: Text(
              "Codez une application Flutter",
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
            ),
            child: Text(
              "Dans cette formation gratuite, vous allez être capable de prendre en main les différents outils pour devenir développeur Web et mobile avec Flutter.",
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
            ),
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Votre prénom',
                errorText:
                    _invalidName ? 'Vous devez saisir votre prénom' : null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
            ),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Votre e-mail',
                errorText:
                    _invalidEmail ? 'Vous devez saisir un e-mail valide' : null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
            ),
            child: SizedBox(
              width: double.infinity,
              child: BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state is LinkSentState) {
                    _emailController.clear();
                    _nameController.clear();
                  }
                },
                child: CtaButtonWidget(
                  label: "commencer maintenant",
                  onPressed: () {
                    setState(() => _invalidName = false);
                    setState(() => _invalidEmail = false);

                    if (_emailController.text.isEmpty ||
                        !isEmail(_emailController.text)) {
                      setState(() => _invalidEmail = true);
                    }

                    if (_nameController.text.isEmpty) {
                      setState(() => _invalidName = true);
                    }

                    if (!_invalidName && !_invalidEmail) {
                      context.read<AuthenticationBloc>().add(
                            OnAuthenticatedUserEvent(
                              email: _emailController.text,
                              displayName: _nameController.text,
                            ),
                          );
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 4.0,
            ),
            child: Text(
              "Vous allez recevoir 5 e-mails permettant d'accéder au vidéos de formation ainsi que d'autres conseils pour continuer à progresser en tant que développeur.",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontStyle: FontStyle.italic,
                    fontSize: primaryFontSize / 1.5,
                  ),
            ),
          ),
          Text(
            "Conformément à la RGPD, vous pouvez vous désabonner à tout moment dans chacun des mails.",
            style: Theme.of(context).textTheme.bodyText2!.copyWith(
                  fontStyle: FontStyle.italic,
                  fontSize: primaryFontSize / 1.5,
                ),
          )
        ],
      ),
    );
  }
}
