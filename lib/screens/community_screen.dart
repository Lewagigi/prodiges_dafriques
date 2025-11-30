import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {

const CommunityScreen({super.key});

final List<Map<String, String>> posts = const [
{'user': 'Startup K', 'content': 'Lorem ipsum devievour'},
{'user': 'L pisseć', 'content': 'Lorem ipsum dolor sit amet'},
];

@override
Widget build(BuildContext context) {


return Scaffold(
  appBar: AppBar(
    title: const Text('Espace communauté'),
    backgroundColor: Colors.brown,
  ),
  body: ListView.builder(
    padding: const EdgeInsets.all(16),
    itemCount: posts.length,
    itemBuilder: (context, index) {

      return Card(
        margin: const EdgeInsets.symmetric(vertical: 8),
        child: ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(posts[index]['user']!),
          subtitle: Text(posts[index]['content']!),
          trailing: IconButton(
            icon: const Icon(Icons.bookmark_border),
            onPressed: () {},
          ),
        ),
      );

    },
  ),
  floatingActionButton: FloatingActionButton(
    onPressed: () {},
    child: const Icon(Icons.add),
  ),
);


}
}
