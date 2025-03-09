import '../../models/auth_user.dart';

abstract class AuthService {
  AppAuthUser get currentUser;

  Future<void> initialize();

  Future<void> signIn({required String email, required String password});

  Future<void> signOut();

  Future<bool> register({required String email, required String password});
}
