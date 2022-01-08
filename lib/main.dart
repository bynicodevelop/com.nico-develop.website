import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_nico_develop_app/components/authentication/authentication_component.dart';
import 'package:com_nico_develop_app/components/tracking/tracking_component.dart';
import 'package:com_nico_develop_app/config/custom_theme_data.dart';
import 'package:com_nico_develop_app/firebase_options.dart';
import 'package:com_nico_develop_app/providers_initializer.dart';
import 'package:com_nico_develop_app/repositories/authentication_repository.dart';
import 'package:com_nico_develop_app/repositories/tracking_repository.dart';
import 'package:com_nico_develop_app/screens/home_screen.dart';
import 'package:com_nico_develop_app/screens/lead_page_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

const Map<String, Widget> routes = {
  "/": HomeScreen(),
  "/lead-page": LeadPageScreen(),
};

final RouteObserver<ModalRoute<void>> routeObserver =
    RouteObserver<ModalRoute<void>>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kDebugMode) {
    await FirebaseAuth.instance.useAuthEmulator(
      'localhost',
      9099,
    );

    FirebaseFirestore.instance.useFirestoreEmulator(
      'localhost',
      8080,
    );
  }

  setPathUrlStrategy();

  runApp(App(
    firebaseAuth: FirebaseAuth.instance,
    firebaseFirestore: FirebaseFirestore.instance,
  ));
}

class App extends StatelessWidget {
  final FirebaseAuth firebaseAuth;
  final FirebaseFirestore firebaseFirestore;

  const App({
    Key? key,
    required this.firebaseAuth,
    required this.firebaseFirestore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProvidersInitializer(
      trackingRepository: TrackinRepository(
        firebaseFirestore: firebaseFirestore,
      ),
      authenticationRepository: AuthenticationRepository(
        firebaseAuth: firebaseAuth,
      ),
      child: MaterialApp(
        title: 'Formation Flutter Ultimate - Nico Develop',
        debugShowCheckedModeBanner: false,
        navigatorObservers: [
          routeObserver,
        ],
        theme: CustomThemeData.defaultTheme,
        initialRoute: HomeScreen.routeName,
        onGenerateRoute: (settings) {
          final routeName = settings.name;
          final route = routes[routeName!.split("?").first];

          return PageRouteBuilder(
            settings: settings,
            pageBuilder: (context, animation, secondaryAnimation) =>
                AuthenticationComponent(
              child: route!,
            ),
            //     AuthenticationComponent(
            //   child: TrackingComponent(
            //     routeObserver: routeObserver,
            //     child: route!,
            //   ),
            // ),
          );
        },
      ),
    );
  }
}
