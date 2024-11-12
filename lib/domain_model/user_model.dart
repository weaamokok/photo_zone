import 'package:hive_flutter/adapters.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserHive extends HiveObject {
  UserHive(
      {this.image,
      required this.email,
      required this.createdAt,
      required this.userName,
      this.name,
      this.id,
      this.bio});
  @HiveField(0)
  String? image;
  @HiveField(1)
  String? name;
  @HiveField(2)
  String userName;
  @HiveField(3)
  DateTime createdAt;
  @HiveField(4)
  dynamic id;
  @HiveField(5)
  String? email;
  @HiveField(6)
  String? bio;

  UserHive copyWith({
    String? image,
    dynamic id,
    String? name,
    String? userName,
    String? email,
    DateTime? createdAt,
    String? bio,
  }) {
    return UserHive(
        image: image ?? this.image,
        id: id ?? super.key,
        name: name ?? this.name,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        createdAt: createdAt ?? this.createdAt,
        bio: bio ?? this.bio);
  }
}
