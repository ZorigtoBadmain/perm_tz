class User {
  int id;
  String name;
  String username;
  String email;
  String phone;

  User({this.id, this.name, this.username, this.email, this.phone});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
          id: json['id'],
      name: json['name'],
      username: json['username'],
      phone: json['phone']
    );
  }
}