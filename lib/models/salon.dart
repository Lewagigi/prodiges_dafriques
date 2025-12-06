import 'package:hive/hive.dart';

part 'salon.g.dart';

@HiveType(typeId: 3)
class SalonStartupAfro extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String nom;

  @HiveField(2)
  String ville;

  @HiveField(3)
  String date;

  @HiveField(4)
  String description;

  @HiveField(5)
  String image;

  SalonStartupAfro({
    required this.id,
    required this.nom,
    required this.ville,
    required this.date,
    required this.description,
    this.image = '',
  });
}
