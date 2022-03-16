// ignore_for_file: must_be_immutable

class UserInfoModel {
  String name;
  bool isPremium;
  UserInfoModel({
    this.name = '',
    this.isPremium = false,
  });
  UserInfoModel copyWith({
    String? name,
    bool? isPremium,
  }) {
    return UserInfoModel(
      name: name ?? this.name,
      isPremium: isPremium ?? this.isPremium,
    );
  }
}
