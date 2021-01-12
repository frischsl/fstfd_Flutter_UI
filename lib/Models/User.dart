class User {
  int userID;
  String email;
  String password;
  String guid;
  String firstName;
  String lastName;
  String joined;

  User(this.userID, this.email, this.password, this.guid, this.firstName,
      this.lastName, this.joined);

  Map<String, dynamic> toMap() {
    return {
      'userID': userID,
      'email': email,
      'password': password,
      'guid': guid,
      'firstName': firstName,
      'lastName': lastName,
      'joined': joined,
    };
  }

  factory User.fromMap(Map<String, dynamic> json) => new User(
        json['userID'],
        json['email'],
        json['password'],
        json['guid'],
        json['firstName'],
        json['lastName'],
        json['joined'],
      );

  User.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    email = json['email'];
    password = json['password'];
    guid = json['guid'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    joined = json['joined'];
  }
}
