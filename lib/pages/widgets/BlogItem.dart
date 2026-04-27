import 'package:flutter/material.dart';
import 'package:characters/characters.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class Blogitem extends StatelessWidget {
  const Blogitem({
    super.key,
    required this.title,
    required this.content,
    required this.link,
    this.image_link,
  });

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
            if (image_link != null) ...[
              SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.network(
                  image_link!,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 12),
            ],
            Text(
              title,
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 8.0),
            HtmlWidget(
              content.characters.take(120).toString(),
              textStyle: const TextStyle(
                fontSize: 14.0,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }
}