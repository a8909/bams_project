class User {
  final String email;
  final String password;
  User({required this.email, required this.password});

  factory User.fromjson(Map<String, dynamic> json) =>
      User(email: 'email', password: 'password');
}
