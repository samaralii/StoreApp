class CustomerDetail {
  String amount;
  String firstName;
  String lastName;
  String email;
  String address;
  String city;
  String phoneNumber;
  String paymentMethod;

  CustomerDetail(
      {this.amount,
      this.firstName,
      this.lastName,
      this.email,
      this.address,
      this.city,
      this.phoneNumber});


       Map<String, dynamic> toJson() => {
        "amount": amount,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "address": address,
        "city": city,
        "phoneNumber": phoneNumber,
      };
}
