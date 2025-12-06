import 'package:hive/hive.dart';

part 'entreprise.g.dart';

@HiveType(typeId: 2)
class Entreprise {
  @HiveField(0)
  final String nom;

  @HiveField(1)
  final String description;

  @HiveField(2)
  final String ville;

  @HiveField(3)
  final String image;

  Entreprise({
    required this.nom,
    required this.description,
    required this.ville,
    required this.image,
  });
}
