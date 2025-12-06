import 'package:hive/hive.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String nom;

  @HiveField(2)
  String email;

  @HiveField(3)
  String password;

  @HiveField(4)
  bool isConnected;

  User({
    required this.id,
    required this.nom,
    required this.email,
    required this.password,
    this.isConnected = false,
  });
}
