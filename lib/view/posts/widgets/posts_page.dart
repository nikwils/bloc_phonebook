import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phonebook_bloc/view/posts/bloc/posts_bloc.dart';
import 'package:phonebook_bloc/view/posts/widgets/posts_list.dart';
import 'package:http/http.dart' as http;
import 'package:phonebook_bloc/view/settings/view/widget/settings_page.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  static const routeName = '/posts_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            padding: const EdgeInsets.only(right: 30),
            onPressed: () {
              Navigator.of(context).pushNamed(SettingsPage.routeName);
            },
            icon: const Icon(
              Icons.settings,
            ),
            key: const Key("settingsButton"),
          )
        ],
      ),
      body: BlocProvider(
        create: (_) => PostsBloc(httpClient: http.Client())..add(PostFetched()),
        child: const PostsList(),
      ),
    );
  }
}
