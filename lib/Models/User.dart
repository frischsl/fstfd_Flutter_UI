class User {
  int userID;
  String email;
  String password;
  String guid;

  User(this.userID, this.email, this.password, this.guid);

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email,
      'password': password,
      'guid': guid,
    };
  }

  factory User.fromMap(Map<String, dynamic> json) => new User(
        json['userID'],
        json['email'],
        json['password'],
        json['guid'],
      );

  User.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    email = json['email'];
    password = json['password'];
    guid = json['guid'];
  }
}
