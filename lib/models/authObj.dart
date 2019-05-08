class AuthObj {
  String status;
  Data data;

  AuthObj({this.status, this.data});

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data.toJson(),
      };

  factory AuthObj.fromJson(Map<String, dynamic> parsedJson) {
    return AuthObj(
        status: parsedJson['status'], data: Data.fromJson(parsedJson['data']));
  }
}

class Data {
  int id;
  String firstname;
  String lastname;
  String username;
  String email;
  String address;

  Data(
      {this.id,
      this.firstname,
      this.lastname,
      this.username,
      this.email,
      this.address});

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "username": username,
        "address": address,
        "email": email,
      };

  factory Data.fromJson(Map<String, dynamic> parsedJson) {
    return Data(
      id: parsedJson['id'],
      firstname: parsedJson['firstname'],
      lastname: parsedJson['lastname'],
      username: parsedJson['username'],
      email: parsedJson['email'],
      address: parsedJson['address'],
    );
  }
}
