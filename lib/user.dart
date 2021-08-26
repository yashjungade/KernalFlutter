class User {
  final String token;
  User({this.token});
  factory User.fromJson(Map<String, dynamic> json) {
    return User(token:json['token']);
  }
}