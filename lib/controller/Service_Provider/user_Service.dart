class User {
  final String email;
  final String password;
  User({required this.email, required this.password});

  factory User.fromjson(Map<String, dynamic> json) =>
      User(email: json['email'], password: json['password']);
}
