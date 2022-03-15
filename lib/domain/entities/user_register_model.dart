import 'package:flutter/cupertino.dart';

@immutable
class UserRegisterModel {
  String name;
  String email;
  String password;
  UserRegisterModel({
    this.name = '',
    this.email = '',
    this.password = '',
  });
  UserRegisterModel copyWith({
    String? name,
    String? email,
    String? password,
  }) {
    return UserRegisterModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
