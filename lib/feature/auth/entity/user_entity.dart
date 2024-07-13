class UserEntity {
  const UserEntity({
    required this.uid,
    required this.email,
    required this.name,
    required this.phone,
    required this.photoUrl,
  });

  final String uid;
  final String email;
  final String name;
  final String phone;
  final String photoUrl;
}
