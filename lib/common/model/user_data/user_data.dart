import 'package:football_app/common/common.dart';

class UserData extends BaseModel {
  final String? email;
  final String? username;
  final String? fullName;
  final String? imageUrl;

  UserData({
    this.email,
    this.username,
    this.fullName,
    this.imageUrl,
  }) : super({
          "email": email,
          "username": username,
          "fullName": fullName,
          "imageUrl": imageUrl,
        });

  @override
  copyWith({
    String? email,
    String? username,
    String? fullName,
    String? imageUrl,
  }) {
    return UserData(
      email: email ?? this.email,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}
