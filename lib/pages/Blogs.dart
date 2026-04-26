import 'package:flutter/material.dart';

class Blogs extends StatelessWidget {
  const Blogs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blogs'),
      ),
      body: const Center(
        child: Text('This is the Blogs page'),
      ),
    );
  }
}