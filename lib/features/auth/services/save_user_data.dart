import 'package:dash_n_go/services/database/realtime_db.dart';
import 'package:firebase_database/firebase_database.dart';

import '../models/auth_user.dart';

class ManageUserData {
  ManageUserData._();

  static ManageUserData instance = ManageUserData._();

  static Future<void> deleteUserData(AuthUser user) async {
    await RealtimeDatabaseService.instance
        .getDatabaseReference()
        .child('users')
        .child(user.id)
        .remove();
  }

  static Future<void> saveUserData(AuthUser user) async {
    await RealtimeDatabaseService.instance
        .getDatabaseReference()
        .child('users')
        .child(user.id)
        .set({
          'email': user.email,
          'fullName': user.fullName,
          'phoneNumber': user.phoneNumber,
          'createdAt': ServerValue.timestamp,
        });
  }
}
