import 'package:cloud_firestore/cloud_firestore.dart';

class TrackinRepository {
  final FirebaseFirestore firebaseFirestore;

  TrackinRepository({
    required this.firebaseFirestore,
  });

  Future<void> addVisit(Map<String, dynamic> data) async {
    DocumentReference userRef =
        firebaseFirestore.doc("users/${data["userId"]}");

    List<Map<String, dynamic>> events = data["events"];

    data.remove("userId");
    data.remove("events");

    data = {
      ...data,
      "userRef": userRef,
    };

    DocumentReference documentReference =
        await firebaseFirestore.collection("visits").add(data);

    // for (Map<String, dynamic> event in events) {
    //   event["event"] = event["event"].toString();
    //   await documentReference.collection("events").add(event);
    // }
  }

  Future<void> updateVisit() async {}
}
