import 'auth_user.dart';

abstract class AuthService {
  Future<AuthUser> signIn({required String email, required String password});

  Future<void> signOut();

  Future<AuthUser> register({
    required String email,
    required String password,
    required String fullName,
    required String phoneNumber,
  });
}
