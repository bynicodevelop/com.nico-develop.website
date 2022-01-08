import 'package:com_nico_develop_app/exceptions/field_required_exception.dart';
import 'package:com_nico_develop_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRepository {
  final FirebaseAuth firebaseAuth;

  const AuthenticationRepository({
    required this.firebaseAuth,
  });

  String get userId => firebaseAuth.currentUser!.uid;

  Stream<UserModel> get user {
    return firebaseAuth.authStateChanges().map((user) {
      if (user == null) {
        return UserModel.empty;
      }

      return UserModel.fromJson({
        'uid': user.uid,
        'email': user.email ?? '',
        'displayName': user.displayName ?? '',
      });
    });
  }

  Future<void> signInAnonymously() async =>
      await firebaseAuth.signInAnonymously();

  Future<void> startSignInLink(Map<String, dynamic> data) async {
    if (!data.containsKey("email")) {
      throw const FieldRequiredException("Email is required");
    }

    if (!data.containsKey("displayName")) {
      throw const FieldRequiredException("Display name is required");
    }

    await firebaseAuth.sendSignInLinkToEmail(
      email: data["email"],
      actionCodeSettings: ActionCodeSettings(
        url:
            "http://${Uri.base.host}:${Uri.base.port}/?displayName=${data["displayName"]}&email=${data["email"]}",
        // This must be true
        handleCodeInApp: true,
      ),
    );
  }

  Future<void> signInWithLink(
    String emailLink,
    String email,
    String displayName,
  ) async {
    AuthCredential authCredential = EmailAuthProvider.credentialWithLink(
      email: email,
      emailLink: emailLink,
    );

    await firebaseAuth.currentUser!.linkWithCredential(authCredential);

    await firebaseAuth.currentUser!.updateDisplayName(displayName);
  }
}
