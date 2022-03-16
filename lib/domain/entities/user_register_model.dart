// ignore_for_file: must_be_immutable

class UserRegisterModel {
  String name;
  String email;
  String password;
  bool acceptedTerms;
  UserRegisterModel({
    this.name = '',
    this.email = '',
    this.password = '',
    this.acceptedTerms = false,
  });
  UserRegisterModel copyWith({
    String? name,
    String? email,
    String? password,
    bool? acceptedTerms,
  }) {
    return UserRegisterModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      acceptedTerms: acceptedTerms ?? this.acceptedTerms,
    );
  }
}
