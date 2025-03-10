import 'package:dash_n_go/services/auth/auth_user.dart';
import 'package:firebase_database/firebase_database.dart'
    show DatabaseReference, FirebaseDatabase;

class RealtimeDatabaseService {
  static final RealtimeDatabaseService _shared =
      RealtimeDatabaseService._sharedInstance();

  static RealtimeDatabaseService get instance => _shared;

  RealtimeDatabaseService._sharedInstance();

  Future<void> saveUserData(AuthUser user) async {
    final DatabaseReference userRef = FirebaseDatabase.instance
        .ref()
        .child("users")
        .child(user.id);
    await userRef.set({
      "fullName": user.fullName,
      "phoneNumber": user.phoneNumber,
      "email": user.email,
      "uid": user.id,
    });
  }
}
