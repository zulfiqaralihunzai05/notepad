
class User {
  final int id;
  final String name;
  final String username;

  User({required this.id, required this.name, required this.username,});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        name: json['name'],
        username: json['username'],
    );
  }
}

