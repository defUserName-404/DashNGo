import 'package:dash_n_go/services/auth/auth_user.dart';
import 'package:firebase_database/firebase_database.dart'
    show DatabaseReference, FirebaseDatabase, ServerValue;

class RealtimeDatabaseService {
  static final RealtimeDatabaseService _shared =
      RealtimeDatabaseService._sharedInstance();

  static RealtimeDatabaseService get instance => _shared;

  RealtimeDatabaseService._sharedInstance();

  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  Future<void> saveUserData(AuthUser user) async {
    await _database.child('users').child(user.id).set({
      'email': user.email,
      'fullName': user.fullName,
      'phoneNumber': user.phoneNumber,
      'createdAt': ServerValue.timestamp,
    });
  }
}
