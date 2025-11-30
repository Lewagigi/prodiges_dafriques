import 'package:flutter/material.dart';

class ProjectCard extends StatelessWidget {
  final String title;
  final String category;
  final Color? color;
  final String? image;

  const ProjectCard({
    super.key,
    required this.title,
    required this.category,
    this.color,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      margin: const EdgeInsets.only(bottom: 18),
      child: ListTile(
        leading: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color ?? Colors.grey,
            borderRadius: BorderRadius.circular(12),
            image: image != null && image!.isNotEmpty
                ? DecorationImage(image: AssetImage(image!), fit: BoxFit.cover)
                : null,
          ),
        ),
        title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(category),
      ),
    );
  }
}
