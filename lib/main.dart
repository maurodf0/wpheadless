import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wpheadless/pages/About.dart';
import 'package:wpheadless/pages/AddPost.dart';
import 'package:wpheadless/pages/Blogs.dart';
import 'package:wpheadless/pages/Index.dart';


void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const Index();
      },
      routes: <RouteBase>[
        GoRoute(
          path: 'blog/:id',
          builder: (BuildContext context, GoRouterState state) {
            final id = state.pathParameters['id']!;
            return Blogs(id: id);
          },
        ),
        GoRoute(
          path: 'about',
          builder: (BuildContext context, GoRouterState state) {
            return const About();
          },
        ),
        GoRoute(
          path: 'add-post', 
        builder: (context, state) => const Addpost()),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WPHeadless',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.teal, brightness: Brightness.dark),
      ),
      routerConfig: _router,
    );
  }
} 


