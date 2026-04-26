import 'package:flutter/material.dart';

class Blogitem extends StatelessWidget {
  const Blogitem({super.key, required this.title, required this.content, required this.link});

  final String title;
  final String content;
  final String link;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 20.0)),
            const SizedBox(height: 8.0),
            Text(content, style: TextStyle(fontSize: 16.0)),
          ],
        ),
      ),
    );
  }
}