import 'package:hive/hive.dart';
import '../models/salon.dart';

class SalonRepository {
  // Charge les salons depuis Hive si présents, sinon depuis la source distante
  Future<List<SalonStartupAfro>> loadSalonsWithCache() async {
    final box = await Hive.openBox<SalonStartupAfro>('salonsBox');

    if (box.isNotEmpty) {
      return box.values.toList();
    }

    final salons = await fetchSalons();
    await box.clear();
    await box.addAll(salons);
    return salons;
  }

  // Simule la récupération de salons depuis une API ou base distante
  Future<List<SalonStartupAfro>> fetchSalons() async {
    await Future.delayed(const Duration(seconds: 2));

    return [
      SalonStartupAfro(
        id: "1", // ✅ id en String
        nom: "AfroTech Hub",
        description: "Incubateur de startups tech africaines",
        date: "2025-12-15",
        ville: "Abidjan",
        image: "https://via.placeholder.com/150",
      ),
      SalonStartupAfro(
        id: "2", // ✅ id en String
        nom: "Startup AfroBusiness",
        description: "Salon business pour entrepreneurs afro-descendants",
        date: "2026-01-10",
        ville: "Dakar",
        image: "https://via.placeholder.com/150",
      ),
      SalonStartupAfro(
        id: "3", // ✅ id en String
        nom: "BlackNetwork Connect",
        description: "Réseau de startups africaines",
        date: "2026-02-05",
        ville: "Paris",
        image: "https://via.placeholder.com/150",
      ),
    ];
  }
}
