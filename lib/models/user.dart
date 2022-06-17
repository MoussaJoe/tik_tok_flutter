import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String username;
  String uid;
  String email;
  String photoUrl;

  User(
      {required this.username,
      required this.uid,
      required this.email,
      required this.photoUrl});

  Map<String, dynamic> toJson() =>
      {"username": username, "uid": uid, "email": email, "photoUrl": photoUrl};

  static User fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return User(
        username: snapshot["username"],
        uid: snapshot["uid"],
        email: snapshot["email"],
        photoUrl: snapshot["photoUrl"]);
  }
}
