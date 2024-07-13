import '../entity/user_entity.dart';
export '../entity/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.email,
    super.name = '',
    super.phone = '',
    super.photoUrl = '',
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      name: json['display_name'] ?? '',
      phone: json['phone'] ?? '',
      photoUrl: json['photo_url'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'display_name': name,
      'phone': phone,
      'photo_url': photoUrl,
    };
  }
}
