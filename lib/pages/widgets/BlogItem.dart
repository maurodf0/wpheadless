import 'package:flutter/material.dart';
import 'package:characters/characters.dart';

class Blogitem extends StatelessWidget {
  const Blogitem({super.key, required this.title, required this.content, required this.link, this.image_link});

  final String title;
  final String content;
  final String link;
  final String? image_link;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (image_link != null) Image.network(image_link!),
            Text(title, style: TextStyle(fontSize: 20.0)),
            const SizedBox(height: 8.0),
            Text(content.characters.take(25), style: TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}