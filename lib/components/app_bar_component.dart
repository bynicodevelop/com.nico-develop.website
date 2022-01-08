import 'package:com_nico_develop_app/screens/home_screen.dart';
import 'package:com_nico_develop_app/screens/lead_page_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AppBarComponent extends StatelessWidget implements PreferredSize {
  const AppBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: !kIsWeb,
      title: Padding(
        padding: const EdgeInsets.only(left: 40.0),
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, HomeScreen.routeName),
          child: const CircleAvatar(
            backgroundImage: AssetImage("assets/images/avatar.png"),
          ),
        ),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(
            right: 40.0,
          ),
          child: TextButton(
            child: Text(
              "Commencer à coder",
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    color: Colors.white,
                  ),
            ),
            onPressed: () => Navigator.pushNamed(
              context,
              LeadPageScreen.routeName,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
