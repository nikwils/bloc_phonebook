import 'package:flutter/material.dart';
import 'package:phonebook_bloc/data/models/user_model.dart';
import 'package:phonebook_bloc/view/post/widgets/post_page.dart';

class PostListItem extends StatelessWidget {
  const PostListItem({required this.post, super.key});

  final Result post;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        onTap: () {
          Navigator.of(context)
              .pushNamed(PostDetailPage.routeName, arguments: post.id.value);
        },
        leading:
            CircleAvatar(backgroundImage: NetworkImage(post.picture.thumbnail)),
        title: Text('${post.name.title} ${post.name.first} ${post.name.last}'),
        subtitle: Text('Phone: ${post.phone}'),
        trailing: Text(post.number.toString()),
      ),
    );
  }
}
