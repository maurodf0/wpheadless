import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zod/flutter_zod.dart';


class Addpost extends StatefulWidget {
  const Addpost({super.key});

  @override
  State<Addpost> createState() => _AddpostState();
}

class _AddpostState extends State<Addpost> {

  final titleController = TextEditingController();
  final contentController = TextEditingController();

  final dio = Dio();

Future<void> addArticle() async {
  try {
    await dio.post(
      'https://jsonplaceholder.typicode.com/posts',
      data: {
        'title': titleController.text,
        'body': contentController.text,
        'userId': 1,
      },
    );

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Post inviato')),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Errore')),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Post'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ZodFormField(
              schema: ZodString().min(5, 'Title must be at least 5 characters'),
               liveValidation: true,
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            SizedBox(height: 20.0,),
            ZodFormField(
              schema: ZodString().min(15, 'Content must be at least 5 characters'),
              liveValidation: true,
              controller: contentController,
              decoration: InputDecoration(
                labelText: 'Content',
              ),
            ),
            SizedBox(height: 20.0,),
            ElevatedButton(
              onPressed: addArticle,
            child: Text('Add Post to Blog'))
          ],
        ),
      ),
    );
  }
}