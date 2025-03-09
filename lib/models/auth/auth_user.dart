import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
class AppAuthUser {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;

  const AppAuthUser({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
  });

  factory AppAuthUser.fromFirebase(User user) {
    return AppAuthUser(
      id: user.uid,
      fullName: user.displayName!,
      email: user.email!,
      phoneNumber: user.phoneNumber!,
    );
  }

  @override
  String toString() =>
      'AppAuthUser(id: $id, fullName: $fullName, email: $email, phoneNumber: $phoneNumber)';
}
