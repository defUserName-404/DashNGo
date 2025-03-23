import 'package:firebase_database/firebase_database.dart'
    show DatabaseReference, FirebaseDatabase;

class RealtimeDatabaseService {
  static final RealtimeDatabaseService _shared =
      RealtimeDatabaseService._sharedInstance();

  static RealtimeDatabaseService get instance => _shared;

  RealtimeDatabaseService._sharedInstance();

  final DatabaseReference _database = FirebaseDatabase.instance.ref();

  DatabaseReference getDatabaseReference() {
    return _database;
  }
}
