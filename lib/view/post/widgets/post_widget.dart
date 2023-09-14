import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phonebook_bloc/data/models/user_model.dart';

import 'package:phonebook_bloc/view/post/bloc/post_bloc.dart';

class PostDetail extends StatefulWidget {
  const PostDetail({super.key});

  @override
  State<PostDetail> createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        switch (state.status) {
          case PostStatus.failure:
            return const Center(child: Text('failed to fetch posts'));
          case PostStatus.success:
            if (state.post == null) return const Text('Нет данных');
            final Result user = state.post!;
            return Column(
              children: [
                ListTile(
                  title: Text(
                      '${user.name.title} ${user.name.last} ${user.name.first}'),
                ),
                ListTile(
                  title: Text('Phone: ${user.phone}'),
                ),
                ListTile(
                  title: Text('Id: ${user.id.name} ${user.id.name}'),
                )
              ],
            );
          case PostStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
