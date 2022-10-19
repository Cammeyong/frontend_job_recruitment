import 'dart:io';

class Post {
  String _title;
  File _banner;
  String _position;
  String _requirements;
  String _tel;
  String _email;
  String _mailingAddress;
  String _author;

  Post(this._email, this._author, this._banner, this._position,
      this._requirements, this._tel, this._title, this._mailingAddress);

  factory Post.from(Map<String, dynamic> source) => Post(
        source['email'],
        source['author'],
        source['banner'],
        source['position'],
        source['requirements'],
        source['tel'],
        source['title'],
        source['mailing_address'],
      );

  // TODO model methods

  _from () {
    // TODO source => properties
  }
}
