import 'package:test_app/models/address.dart';
import 'package:test_app/models/company.dart';

class User {
  final int id;
  final String username;
  final String name;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  User(
      {this.id,
      this.username,
      this.name,
      this.email,
      this.address,
      this.phone,
      this.website,
      this.company});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        name: json['name'],
        email: json['email'],
        address: Address.fromJson(json['address']),
        phone: json['phone'],
        website: json['website'],
        company: Company.fromJson(json['company']));
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'username': username,
        'name': name,
        'email': email,
        'address': address.toJson(),
        'phone': phone,
        'website': website,
        'company': company.toJson()
      };

  String getAddress() {
    return address.zipcode +
        ', ' +
        address.city +
        ', ' +
        address.street +
        ', ' +
        address.suite;
  }
}
