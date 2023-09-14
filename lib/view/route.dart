import 'package:flutter/material.dart';
import 'package:phonebook_bloc/view/post/widgets/post_page.dart';
import 'package:phonebook_bloc/view/posts/widgets/posts_page.dart';
import 'package:phonebook_bloc/view/settings/view/widget/settings_page.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> routesMap = {
    PostsPage.routeName: ((ctx) => const PostsPage()),
    PostDetailPage.routeName: ((ctx) => const PostDetailPage()),
    SettingsPage.routeName: ((ctx) => const SettingsPage()),
  };
}
