import 'dart:io';

import 'package:frontend_job_recruitment/models/post.model.dart';

class Company {
  String? _id;
  String _name;
  String _email;
  String _password;
  String _address;
  File _logo;
  File _certificate;

  Company(
    this._id,
    this._email,
    this._password,
    this._name,
    this._address,
    this._certificate,
    this._logo,
  );

  factory Company.from(Map<String, dynamic> source) => Company(
        source['_id'],
        source['email'],
        source['password'],
        source['name'],
        source['address'],
        source['certificate'],
        source['logo'],
      );

  // TODO model methods

  _from() {
    // TODO source => properties
  }
}
