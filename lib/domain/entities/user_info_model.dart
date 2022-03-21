// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';

class UserInfoModel extends Equatable {
  String? avatar;
  String name;
  String email;
  String createdAt;
  bool confirmedEmail;

  UserInfoModel({
    this.avatar,
    this.name = '',
    this.email = '',
    this.createdAt = '',
    this.confirmedEmail = false,
  });

  @override
  List<Object?> get props => [
        avatar,
        name,
        email,
        createdAt,
        confirmedEmail,
      ];
}
