class User {
  final int? id;
  final String fullname;
  final String username;
  final String? email;
  final String? password;

  User(
      {required this.id,
      required this.fullname,
      required this.username,
      this.email,
      this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        fullname: json['fullname'],
        username: json['username'],
        email: json['email'],
        password: json['password']);
  }
}
