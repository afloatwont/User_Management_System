class User {
  final int? id;
  final String name;
  final String email;
  final String? username;
  final String? phone;
  final String? website;
  final String? companyName;
  final Address? address;

  User({
    this.id,
    required this.name,
    required this.email,
    this.username,
    this.phone,
    this.website,
    this.companyName,
    this.address,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      phone: json['phone'],
      website: json['website'],
      companyName: json['company']?['name'],
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
    );
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  Address({
    required this.street,
    required this.suite,
    required this.city,
    required this.zipcode,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
    );
  }
}