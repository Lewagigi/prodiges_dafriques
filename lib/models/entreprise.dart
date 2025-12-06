import 'package:hive/hive.dart';

part 'entreprise.g.dart';

@HiveType(typeId: 2)
class Entreprise extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String nom;

  @HiveField(2)
  String ville;

  @HiveField(3)
  String description;

  @HiveField(4)
  String image;

  Entreprise({
    required this.id,
    required this.nom,
    required this.ville,
    required this.description,
    this.image = '',
  });
}
