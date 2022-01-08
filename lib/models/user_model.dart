import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String uid;
  final String email;
  final String displayName;

  const UserModel({
    required this.uid,
    required this.email,
    required this.displayName,
  });

  static const empty = UserModel(
    uid: '',
    email: '',
    displayName: '',
  );

  bool get isEmpty => this == UserModel.empty;

  bool get isUnauthenticated => email.isEmpty;

  bool get isNotEmpty => this != UserModel.empty;

  UserModel.fromJson(Map<String, dynamic> json)
      : uid = json['uid'],
        email = json['email'],
        displayName = json['displayName'];

  Map<String, dynamic> toJson() => {
        'uid': uid,
        'email': email,
      };

  @override
  List<Object?> get props => [
        uid,
        email,
        displayName,
      ];
}
