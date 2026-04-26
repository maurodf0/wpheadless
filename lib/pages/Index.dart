import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:wpheadless/pages/widgets/BlogItem.dart';

class Index extends StatefulWidget {
   const Index({super.key});

  @override
  State<Index> createState() => _IndexState();
}

class _IndexState extends State<Index> {
final dio = Dio();

final List posts = [];

void getWPPosts() async {
  Response response;
  response = await dio.get('https://wp.maurodefalco.it/wp-json/wp/v2/posts?_embed');  
  setState(() {
    posts.addAll(response.data);
  });
}

@override
void initState() {
  super.initState();
  getWPPosts();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Index'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(posts.length, (index) => Blogitem(
              title: ' ${posts[index]['title']['rendered']}', 
              content: '${posts[index]['excerpt']['rendered']}',
              link: '${posts[index]['link']}',
              )
              ),
          ],
        ),
      ),
    );
  }
}