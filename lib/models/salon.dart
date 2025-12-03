import 'package:hive/hive.dart';

part 'salon.g.dart';

@HiveType(typeId: 1)
class SalonStartupAfro {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String nom;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final String date;

  @HiveField(4)
  final String ville;

  @HiveField(5)
  final String image;

  SalonStartupAfro({
    required this.id,
    required this.nom,
    required this.description,
    required this.date,
    required this.ville,
    required this.image,
  });
}
