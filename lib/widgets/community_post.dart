import 'package:flutter/material.dart';

class CommunityPost extends StatelessWidget {
  final String title;
  final String author;
  final String content;

  const CommunityPost({
    super.key,
    required this.title,
    required this.author,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 16)),
            Text(author, style: const TextStyle(color: Colors.grey)),
            const SizedBox(height: 12),
            Text(content),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(Icons.comment, size: 20),
                const SizedBox(width: 10),
                Icon(Icons.bookmark_border, size: 20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
