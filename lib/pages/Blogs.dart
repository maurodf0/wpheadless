import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class Blogs extends StatefulWidget {
  const Blogs({super.key, required this.id});

  final String id;

  @override
  State<Blogs> createState() => _BlogsState();
}

class _BlogsState extends State<Blogs> {
  final List<dynamic> singlePost = [];
  final dio = Dio();

  @override
  void initState() {
    super.initState();
    getPostByID();
    print('ID del post: ${widget.id}');
  }

  Future<void> getPostByID() async {
    try {
      final response = await dio.get(
        'https://wp.maurodefalco.it/wp-json/wp/v2/posts/${widget.id}?_embed',
      );



      setState(() {
        singlePost.add(response.data);
      });
    } catch (e) {
      debugPrint('Errore: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (singlePost.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final post = singlePost.first;
    final featuredMedia = post['_embedded']?['wp:featuredmedia'];
    final postTitle = post['title']['rendered'];

    return Scaffold(
      appBar: AppBar(
        title: Text(postTitle),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
            featuredMedia != null && featuredMedia.isNotEmpty
              ? Image.network(featuredMedia[0]['source_url'])
              : ColoredBox(
              color: Colors.teal, 
              child: SizedBox(
                height: 150, 
                width: double.infinity,
                child: Center(
                  child: Text( 
                  postTitle,
                  style: TextStyle(color: Colors.white, fontSize: 22.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                  ),
                ),
                )),
              const SizedBox(height: 16),
              HtmlWidget(post['content']['rendered']),
            ],
          ),
        ),
      ),
    );
  }
}