class AuthObj {
  String status;
  Data data;

  AuthObj({this.status, this.data});

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
