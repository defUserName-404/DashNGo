import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
class AuthUser {
  final String id;
  final String fullName;
  final String email;
  final String phoneNumber;

  const AuthUser({
    required this.id,
    required this.fullName,
    required this.email,
    required this.phoneNumber,
  });

  factory AuthUser.fromFirebase(User user) {
    return AuthUser(
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
