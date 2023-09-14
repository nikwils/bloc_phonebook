import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'package:phonebook_bloc/view/post/bloc/post_bloc.dart';
import 'package:phonebook_bloc/view/post/widgets/post_widget.dart';
import 'package:phonebook_bloc/view/settings/view/widget/settings_page.dart';

class PostDetailPage extends StatelessWidget {
  const PostDetailPage({super.key});

  static const routeName = '/post_page';

  @override
  Widget build(BuildContext context) {
    final postId = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Post'),
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
        create: (_) => PostBloc(httpClient: http.Client(), postId: postId)
          ..add(PostFetched()),
        child: const PostDetail(),
      ),
    );
  }
}
