class AppAuthUser {
  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;

  AppAuthUser({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  factory AppAuthUser.fromJson(Map<String, dynamic> json) {
    return AppAuthUser(
      fullName: json['fullName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      password: json['password'],
    );
  }

  @override
  String toString() =>
      'AppAuthUser(fullName: $fullName, email: $email, phoneNumber: $phoneNumber, password: $password)';
}
