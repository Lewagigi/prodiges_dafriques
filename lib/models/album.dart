class Album {
  final int id;
  final String title;

  Album({required this.id, required this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() => {
      "id": 12,
      "nom": "Salon AfroTech Paris",
      "description": "Événement dédié aux startups afro innovantes.",
      "date": "2025-04-17",
      "ville": "Paris",
      "image": "https://exemple.com/afrotech.jpg"
      };
}
