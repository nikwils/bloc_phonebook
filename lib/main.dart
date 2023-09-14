import 'package:flutter/material.dart';
import 'package:phonebook_bloc/view/posts/widgets/posts_page.dart';
import 'package:phonebook_bloc/view/route.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.routesMap,
      home: const PostsPage(),
    );
  }
}
